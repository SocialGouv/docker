let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/459c92208a2cc494e25a64e1fd3e95f742246c08/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/459c92208a2cc494e25a64e1fd3e95f742246c08/dhall/socialgouv/steps.dhall
        sha256:4428b6517f7b8677a4b93205111c25ae9c2010428677c1b198d5d690216f28e5

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
