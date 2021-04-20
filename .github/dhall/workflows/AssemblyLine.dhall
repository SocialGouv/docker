let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let DockerBuildJob =
      ../jobs/DockerBuild.dhall sha256:5ab5d99a8946f09b292164170b6e870b26678f9f1dc96db6efb27c2cf2ef3e3e

let HadolintJob =
      ../jobs/Hadolint.dhall sha256:ca8c9ba040b31d16e878791b5c9abcfbfb42386f55845043f54c24b4181e99f3

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
                }
            # args.jobs
        }

in  { Worklflow }
