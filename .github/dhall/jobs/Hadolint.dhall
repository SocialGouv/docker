let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/211846b3b69689831f78d16dcd5c63ae34dea7a0/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

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
            , `with` = Some
                (toMap { args = "hadolint ./${package}/Dockerfile" })
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
              , `with` = Some (toMap { args = "hadolint ./foo/Dockerfile" })
              }
            ]
          }

in  HadolintJob
