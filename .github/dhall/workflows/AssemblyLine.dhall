let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let ContainerTestJob =
      ../jobs/ContainerTest.dhall sha256:bbc48a65f0d848528c05ac1b2cd88a585d66eab196a88a333377c6efc3942f85

let DockerBuildJob =
      ../jobs/DockerBuild.dhall sha256:8482bfbd94685ec84f1b4a14f58a19055f0d474f48e62710e61f254fdf8a092b

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
                , container_test = ContainerTestJob { package = args.name }
                }
            # args.jobs
        }

in  { Worklflow }
