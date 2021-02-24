let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

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
          , paths = Some [ path ]
          }
        }

let Event = < ReleasesBranches | FeatureBranches >

let handled_events =
      { FeatureBranches = λ(path : Text) → feature_branches path
      , ReleasesBranches =
          λ(_ : Text) →
            On::{ push = Some Push::{ branches = Some releases_branches } }
      }

let match = λ(event : Event) → merge handled_events event

in  { Event, match }
