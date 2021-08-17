let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/069d0a96b7428e9e8daa952f2edad8d0aaef40c5/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let releases_branches =
      [ "master"
      , "next"
      , "next-major"
      , "beta"
      , "alpha"
      , "+([0-9])?(.{+([0-9]),x}).x"
      ]

let feature_branches =
      λ(path : Text) →
        GithubActions.On::{
        , push = Some GithubActions.Push::{
          , branches-ignore = Some releases_branches
          , paths = Some
            [ "${path}/**", ".github/workflows/${path}.branches.workflow.yaml" ]
          }
        }

let Event = < ReleasesBranches | FeatureBranches >

let handled_events =
      { FeatureBranches = λ(path : Text) → feature_branches path
      , ReleasesBranches =
          λ(_ : Text) →
            GithubActions.On::{
            , push = Some GithubActions.Push::{
              , branches = Some releases_branches
              , tags = Some [ "v*" ]
              }
            }
      }

let match = λ(event : Event) → merge handled_events event

in  { Event, match }
