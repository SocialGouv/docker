let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:7423db4cadf212e57d16940e6bcb2fc3649a698337fe6b95d25b5e97fd25f56a

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let name = "azure-db"

let version_test =
      InceptionJob
        { package = name }
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

let integration_test =
      GithubActions.Job::{
      , name = Some "Integration test"
      , needs = Some [ "Build" ]
      , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
      , steps =
        [ GithubActions.steps.actions/checkout
        , GithubActions.Step::{
          , run = Some "yarn --frozen-lockfile --prefer-offline"
          }
        , GithubActions.Step::{
          , run = Some "make e2e"
          , working-directory = Some name
          }
        ]
      }

in  AssemblyLine.Worklflow
      { name, jobs = toMap { integration_test, version_test } }
