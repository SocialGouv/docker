let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/ede0146d6bb74edfc2a51d5599541c1f5c0518f5/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/ede0146d6bb74edfc2a51d5599541c1f5c0518f5/dhall/socialgouv/steps.dhall
        sha256:6ffe62d8333949f671269d748047671e1e20b55edd3944fe0ff2d862a68085dd

in  λ(package : Text) →
      GithubActions.Job::{
      , name = Some "Build"
      , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
      , needs = Some [ "Lint" ]
      , outputs = Some
          (toMap { digest = "\${{ steps.docker_push.outputs.digest }}" })
      , steps =
        [ GithubActions.steps.actions/checkout
        ,   SocailGouvSteps.docker-meta { image_name = package }
          ⫽ { id = Some "docker_meta" }
        , SocailGouvSteps.docker-buildx ⫽ { id = Some "docker_buildx" }
        , SocailGouvSteps.docker-login
        ,   SocailGouvSteps.docker-build-push
              { context = package
              , docker_buildx_step_id = "docker_buildx"
              , docker_meta_step_id = "docker_meta"
              }
          ⫽ { id = Some "docker_push" }
        , GithubActions.Step::{
          , name = Some "Image digest"
          , run = Some
              ''
              echo "''${{ steps.docker_push.outputs.digest }}"
              ''
          }
        ]
      }
