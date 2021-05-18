let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let Push =
      { default =
          GithubActions.Push.default ⫽ { branches-ignore = None (List Text) }
      , Type =
          GithubActions.Push.Type ⩓ { branches-ignore : Optional (List Text) }
      }

let On =
      { default = GithubActions.On.default ⫽ { push = Some Push.default }
      , Type =
          { push : Optional Push.Type
          , pull_request : Optional GithubActions.PullRequest.Type
          , delete : Optional GithubActions.Delete.Type
          , schedule : Optional (List GithubActions.Schedule.Type)
          , workflow_dispatch : Optional GithubActions.WorkflowDispatch.Type
          }
      }

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
        On::{
        , push = Some Push::{
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
            On::{
            , push = Some Push::{
              , branches = Some releases_branches
              , tags = Some [ "v*" ]
              }
            }
      }

let match = λ(event : Event) → merge handled_events event

in  { Event, match }
