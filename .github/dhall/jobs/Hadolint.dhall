let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let {- renovate: datasource=docker depName=ghcr.io/hadolint/hadolint -}
    HADOLINT_VERSION =
      "2.4.0@sha256:ed22c9de9b884383094edb8930696a256c4450335945c68153d8fc8fbb27bf03"

let HadolintJob =
      λ(package : Text) →
        GithubActions.Job::{
        , name = Some "Lint"
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , steps =
          [ GithubActions.steps.actions/checkout
          , GithubActions.Step::{
            , uses = Some
                "docker://ghcr.io/hadolint/hadolint:${HADOLINT_VERSION}"
            , `with` = Some (toMap { args = "./${package}/Dockerfile" })
            }
          ]
        }

let __test__foo =
        assert
      :   HadolintJob "foo"
        ≡ GithubActions.Job::{
          , name = Some "Lint"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
            [ GithubActions.steps.actions/checkout
            , GithubActions.Step::{
              , uses = Some
                  "docker://ghcr.io/hadolint/hadolint:${HADOLINT_VERSION}"
              , `with` = Some (toMap { args = "./foo/Dockerfile" })
              }
            ]
          }

in  HadolintJob
