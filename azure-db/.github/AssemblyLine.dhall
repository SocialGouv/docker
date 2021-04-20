let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:b910dfb9e1d2c09a82be390f05c718e40cf7a75e8a8f4edfaa45a65dd8bc9a47

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let version_test =
      InceptionJob
        { package = "azure-db" }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "psql --version" }
          , GithubActions.Step::{ run = Some "az --version" }
          , GithubActions.Step::{ run = Some "jq --version" }
          , GithubActions.Step::{ run = Some "which create-db-user" }
          , GithubActions.Step::{ run = Some "which drop-db-user" }
          , GithubActions.Step::{ run = Some "which backup" }
          , GithubActions.Step::{ run = Some "which export_from_k8s_secret" }
          ]
        }

in  AssemblyLine.Worklflow { name = "azure-db", jobs = toMap { version_test } }
