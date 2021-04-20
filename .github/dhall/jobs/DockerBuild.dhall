let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let SocailGouvSteps =
      ../socialgouv/steps.dhall sha256:5dede8dddb03e722e277e3b9b644e7331fdaec83b86b791b50b2f6f2792b5b73

in  λ(package : Text) →
      GithubActions.Job::{
      , name = Some "Build"
      , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
      , needs = Some [ "Lint" ]
      , outputs = Some
          (toMap { digest = "\${{ steps.docker_meta.outputs.version }}" })
      , steps =
        [ GithubActions.steps.actions/checkout
        ,   SocailGouvSteps.docker-meta { image_name = package }
          ⫽ { id = Some "docker_meta" }
        , SocailGouvSteps.docker-buildx ⫽ { id = Some "docker_buildx" }
        , SocailGouvSteps.docker-login
        , GithubActions.steps.actions/cache
            { path = "/tmp/.buildx-cache"
            , key = "buildx"
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
        , GithubActions.Step::{
          , name = Some "Container structure test"
          , uses = Some
              "docker://gcr.io/gcp-runtimes/container-structure-test:v1.10.0"
          , `with` = Some
              ( toMap
                  { args =
                          "test"
                      ++  " --pull"
                      ++  " --image ghcr.io/socialgouv/docker/${package}:sha-\${{ github.sha }}"
                      ++  " --config ${package}/tests/container-structure-test.yml -v debug"
                  }
              )
          }
        ]
      }
