let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let ContainerTestJob =
      ../jobs/ContainerTest.dhall sha256:bc34ac8b31da3add3f42e2db6d33bd4155c3c9e34c0e0d8bdec9ebec2aee2d34

let DockerBuildJob =
      ../jobs/DockerBuild.dhall sha256:e3bf6f2874c4a12ef25d80fe852eefbced92d54ae602ff4ba1e69c579f483a97

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
