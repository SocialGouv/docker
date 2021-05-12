let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let trivy-action =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/steps/aquasecurity/trivy-action/package.dhall sha256:72a518acac9663695cd99b5219b2f6d330ab32c1077c20bbd7804d8798485416

let upload-sarif =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/steps/github/codeql-action/upload-sarif/package.dhall sha256:e96a4a49e32c41420b99afd427f0549038b2b33d399ec1a66295e19e6cd9bf1a

let ContainerTestJob =
      ../jobs/ContainerTest.dhall sha256:bc34ac8b31da3add3f42e2db6d33bd4155c3c9e34c0e0d8bdec9ebec2aee2d34

let DockerBuildJob =
      ../jobs/DockerBuild.dhall sha256:c7fb5c22101c47af7907cabf6ed1ad872586f8082cf55880f7b3b0a3a7fd40e9

let HadolintJob =
      ../jobs/Hadolint.dhall sha256:ac75784c8630531bbbba3e6e42e488cb3b4bb7d852106d1c3a77c8d1d64bd87a

let Worklflow =
      λ ( args
        : { name : Text
          , jobs : List { mapKey : Text, mapValue : GithubActions.types.Job }
          }
        ) →
        GithubActions.Workflow::{
        , name = args.name
        , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
        , jobs =
              toMap
                { lint = HadolintJob args.name
                , build = DockerBuildJob args.name
                , container_test = ContainerTestJob { package = args.name }
                , security_scan = GithubActions.Job::{
                  , name = Some "Vulnerability Scanner"
                  , needs = Some [ "Build" ]
                  , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
                  , steps =
                    [ GithubActions.steps.actions/checkout
                    , GithubActions.Step::{
                      , run = Some
                          "docker pull ghcr.io/socialgouv/docker/${args.name}:sha-\${{ github.sha }}"
                      }
                    ,   trivy-action.`0.0.14`
                          trivy-action.Input::{
                          , format = Some "template"
                          , image-ref =
                              "ghcr.io/socialgouv/docker/${args.name}:sha-\${{ github.sha }}"
                          , output = Some "trivy-results.sarif"
                          , template = Some "@/contrib/sarif.tpl"
                          }
                      ⫽ { name = Some "Run Trivy vulnerability scanner" }
                    , GithubActions.Step::{
                      , name = Some "Change hardcoded Dockerfile path"
                      , run = Some
                          (     "sed -i"
                            ++  " 's/\"uri\": \"Dockerfile\"/\"uri\": \"${args.name}\\/Dockerfile\"/'"
                            ++  " trivy-results.sarif"
                          )
                      }
                    ,   upload-sarif.codeql-bundle-20210421
                          upload-sarif.Input::{
                          , sarif_file = Some "trivy-results.sarif"
                          }
                      ⫽ { continue-on-error = Some True }
                    ]
                  }
                }
            # args.jobs
        }

in  { Worklflow }
