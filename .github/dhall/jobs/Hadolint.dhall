let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/da727fb4ff4a98aa30d3c0581edea86bd1f7bb47/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

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
