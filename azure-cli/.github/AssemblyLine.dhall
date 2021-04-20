let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:7e4f1be360523c21c571e8eea198c5d9023ec31773cc770bf7e6a1b7d9302cce

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let version_test =
      GithubActions.Job::{
      , name = Some "Container structure test..."
      , needs = Some [ "Build" ]
      , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
      , steps =
        [ GithubActions.Step::{
          , run = Some "make test_structure"
          , working-directory = Some "azure-cli"
          }
        ]
      }

in  AssemblyLine.Worklflow { name = "azure-cli", jobs = toMap { version_test } }
