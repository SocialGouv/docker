let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/c79862cdf41524e522b467ccf3738f4b044b56d2/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/c79862cdf41524e522b467ccf3738f4b044b56d2/dhall/socialgouv/steps.dhall
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
