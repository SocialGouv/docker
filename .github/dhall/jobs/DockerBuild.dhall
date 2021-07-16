let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall
        sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/socialgouv/steps.dhall
        sha256:4428b6517f7b8677a4b93205111c25ae9c2010428677c1b198d5d690216f28e5

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
        , GithubActions.steps.actions/cache
            { path = "/tmp/.buildx-cache"
            , key = "${package}-buildx"
            , hashFiles = [ "${package}/Dockerfile" ]
            }
        ,   SocailGouvSteps.docker-build-push
              { cache_path = "/tmp/.buildx-cache"
              , context = package
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
