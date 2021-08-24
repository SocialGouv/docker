let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/3dc188c64f4b3c14d686c959cf41e3a11a037942/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/3dc188c64f4b3c14d686c959cf41e3a11a037942/dhall/socialgouv/steps.dhall
        sha256:342a7b500f7200bbaff48cf069d5b9f9d20c1a434cbe0c679c58b0a848c4b3f1

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
