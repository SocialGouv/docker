let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let {- renovate: datasource=docker depName=hadolint/hadolint -}
    HADOLINT_VERSION =
      "v1.23.0"

let HadolintJob =
      λ(package : Text) →
        GithubActions.Job::{
        , name = Some "Lint"
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , container = Some "hadolint/hadolint:${HADOLINT_VERSION}"
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
          , container = Some "hadolint/hadolint:${HADOLINT_VERSION}"
          , steps =
            [ GithubActions.steps.actions/checkout
            , GithubActions.Step::{
              , run = Some "hadolint ./Dockerfile"
              , working-directory = Some "foo"
              }
            ]
          }

in  HadolintJob
