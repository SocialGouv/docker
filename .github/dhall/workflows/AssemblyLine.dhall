let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/3dfe570631036d6617a6ac0ad95a2cdd6e9b5ef7/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let ContainerTestJob =
      ../jobs/ContainerTest.dhall
        sha256:400214d12eb103c2500b450f1b1b62345be43866b1d5551badb68199b3c4aea9

let DockerBuildJob =
      ../jobs/DockerBuild.dhall
        sha256:4598776685311ced8e974f3842d13e25ba0942a2dd9d5ca5fea708f02b522369

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
