let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:105b04125d9b956816bed0d50854f5ca81f619535317f23c075f671e1e3bf4af

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let name = "wait-for-postgres"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "psql --version" }
          , GithubActions.Step::{ run = Some "which wait-for-postgres" }
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
          , name = Some "Install Psql utility"
          , run = Some
              ''
              sudo apt-get update
              sudo apt-get install --yes --no-install-recommends postgresql
              ''
          }
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
