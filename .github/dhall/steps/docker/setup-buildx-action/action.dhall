let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let Input =
      ./Input.dhall sha256:dc5902ae5261dcd968d3cd025c90001c50d2fbc2413dda62c4fd29b588be4db8

let utils =
      ../../utils.dhall sha256:52b53ac4f7bfc0ac42b2147a16166eea9b4ed92ab303c1e6ba255c450747d3da

let step
    : ∀(ref : Text) → ∀(opts : Input.Type) → GithubActions.Step.Type
    = λ(ref : Text) →
      λ(opts : Input.Type) →
        GithubActions.Step::{
        , uses = Some "docker/setup-buildx-action@${ref}"
        , `with` = Some (utils.unpackTextOptions (toMap opts))
        }

let __test__minimal =
        assert
      :   step "vX.Y.Z" Input::{=}
        ≡ GithubActions.Step::{
          , uses = Some "docker/setup-buildx-action@vX.Y.Z"
          , `with` = Some ([] : List { mapKey : Text, mapValue : Text })
          }

let __test__tags_options =
        assert
      :   step "vX.Y.Z" Input::{ install = Some "false" }
        ≡ GithubActions.Step::{
          , uses = Some "docker/setup-buildx-action@vX.Y.Z"
          , `with` = Some (toMap { install = "false" })
          }

let __test__step_id =
        assert
      :   step "vX.Y.Z" Input::{=} ⫽ { id = Some "buildx" }
        ≡ GithubActions.Step::{
          , id = Some "buildx"
          , uses = Some "docker/setup-buildx-action@vX.Y.Z"
          , `with` = Some ([] : List { mapKey : Text, mapValue : Text })
          }

let `v1.1.2` =
    {-
    This dhall is mapping a fixed version of the docker/setup-buildx-action
    https://github.com/docker/setup-buildx-action/tree/v1.1.2
    commit/2a4b53665e15ce7d7049afb11ff1f70ff1610609
    -}
      "2a4b53665e15ce7d7049afb11ff1f70ff1610609"

in  { `v1.1.2` = step `v1.1.2`, step }
