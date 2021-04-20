let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:5a59da419d6fc18f6500bbb0cdd20045f6ba5cc7b726d2a67e9cb93effd31171

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let name = "bats"

let integration_test =
      GithubActions.Job::{
      , name = Some "Integration test"
      , needs = Some [ "Build" ]
      , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
      , services = Some
          ( toMap
              { postgres = GithubActions.Service::{
                , image = "postgres:13"
                , ports = Some [ "5432:5432" ]
                }
              }
          )
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

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps = [ GithubActions.Step::{ run = Some "bats --version" } ]
        }

in  AssemblyLine.Worklflow
      { name, jobs = toMap { integration_test, version_test } }
