let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/df8a3f19345850314da558f63678c6c307d36449/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let ContainerTestJob =
      ../jobs/ContainerTest.dhall
        sha256:400214d12eb103c2500b450f1b1b62345be43866b1d5551badb68199b3c4aea9

let DockerBuildJob =
      ../jobs/DockerBuild.dhall
        sha256:31398149a20e78661ee58064a4859b3c33fc3b64e8e4c787a643a772069882d9

let HadolintJob =
      ../jobs/Hadolint.dhall
        sha256:832bac8e5ba7cb3fa31ba11de677a2b8c6b3b3a32129d087e776d5dd54317cbc

let TrivyJob =
      ../jobs/Trivy.dhall
        sha256:52073382b4c4f32ada3c093400296802c2ad530276f8622164224105cb4879b2

let Worklflow =
      λ ( args
        : { name : Text
          , jobs : List { mapKey : Text, mapValue : GithubActions.types.Job }
          }
        ) →
        GithubActions.Workflow::{
        , name = args.name
        , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
        , concurrency = Some GithubActions.Concurrency::{
          , group = "${args.name}-\${{ github.ref }}"
          , cancel-in-progress = True
          }
        , jobs =
              toMap
                { lint = HadolintJob args.name
                , build = DockerBuildJob args.name
                , container_test = ContainerTestJob { package = args.name }
                , security_scan = TrivyJob args.name
                }
            # args.jobs
        }

in  { Worklflow }
