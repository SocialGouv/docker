let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let HadolintJob =
      λ(package : Text) →
        GithubActions.Job::{
        , name = Some "Lint"
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , container = Some "hadolint/hadolint:v1.22.1-alpine"
        , steps =
          [ GithubActions.steps.actions/checkout
          , GithubActions.Step::{
            , run = Some "hadolint ./Dockerfile"
            , working-directory = Some package
            }
          ]
        }

let __test__foo =
        assert
      :   HadolintJob "foo"
        ≡ GithubActions.Job::{
          , name = Some "Lint"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , container = Some "hadolint/hadolint:v1.22.1-alpine"
          , steps =
            [ GithubActions.steps.actions/checkout
            , GithubActions.Step::{
              , run = Some "hadolint ./Dockerfile"
              , working-directory = Some "foo"
              }
            ]
          }

in  HadolintJob
