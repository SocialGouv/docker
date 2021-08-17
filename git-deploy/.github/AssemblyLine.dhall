let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall
        sha256:bee4dff3d273e31e153040cb1f18824a67c4676785583b018f8d2f4147ebfd45

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall
        sha256:037f4c6e58bcec39375d74afb5ded6db30caa1e372b399bf7f30da1d6c1cdc4f

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/9fe59f60d6a941dd76df40d67b3428fdf85865aa/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let name = "git-deploy"

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

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "which create-deployment" } ]
        }

in  AssemblyLine.Worklflow
      { name, jobs = toMap { integration_test, version_test } }
