let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let ContainerTestJob =
      ../jobs/ContainerTest.dhall sha256:bc34ac8b31da3add3f42e2db6d33bd4155c3c9e34c0e0d8bdec9ebec2aee2d34

let DockerBuildJob =
      ../jobs/DockerBuild.dhall sha256:c7fb5c22101c47af7907cabf6ed1ad872586f8082cf55880f7b3b0a3a7fd40e9

let HadolintJob =
      ../jobs/Hadolint.dhall sha256:ca8c9ba040b31d16e878791b5c9abcfbfb42386f55845043f54c24b4181e99f3

let TrivyJob =
      ../jobs/Trivy.dhall sha256:9c13540f9e7aa2c1670714fb0ff875cf24682cb78c8d970d69f05add6c85c936

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
                , security_scan =
                    ( TrivyJob
                        "ghcr.io/\${{ github.repository }}/${args.name}:sha-\${{ github.sha }}"
                    )
                  with needs = Some [ "Build" ]
                }
            # args.jobs
        }

in  { Worklflow }
