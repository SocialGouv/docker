let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/0a77446eef818f9dd21f50a766cf28be2be24169/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let SocailGouvSteps =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/0a77446eef818f9dd21f50a766cf28be2be24169/dhall/socialgouv/steps.dhall
        sha256:e313adfeb0b8b6fb6510e0a7a3f1ee4edb41a7e296e5651b6cab56f1a84d17c0

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
