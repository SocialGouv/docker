let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/069d0a96b7428e9e8daa952f2edad8d0aaef40c5/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

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
