let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let SocailGouvSteps =
      ../socialgouv/steps.dhall sha256:4428b6517f7b8677a4b93205111c25ae9c2010428677c1b198d5d690216f28e5

let ContainerTest =
      λ(args_0 : { package : Text }) →
        GithubActions.Job::{
        , name = Some "Container Test"
        , needs = Some [ "Build" ]
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , steps =
          [ GithubActions.steps.actions/checkout
          , SocailGouvSteps.container-structure-test.`v1.10.0`
              (     " "
                ++  " --config ${args_0.package}/tests/container-structure-test.yml -v debug"
                ++  " --image ghcr.io/socialgouv/docker/${args_0.package}@\${{ needs.Build.outputs.digest }}"
                ++  " --pull"
              )
          ]
        }

let __test__foo =
        assert
      :   ContainerTest { package = "foo" }
        ≡ GithubActions.Job::{
          , name = Some "Container Test"
          , needs = Some [ "Build" ]
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
            [ GithubActions.steps.actions/checkout
            , SocailGouvSteps.container-structure-test.`v1.10.0`
                (     " "
                  ++  " --config foo/tests/container-structure-test.yml -v debug"
                  ++  " --image ghcr.io/socialgouv/docker/foo@\${{ needs.Build.outputs.digest }}"
                  ++  " --pull"
                )
            ]
          }

in  ContainerTest
