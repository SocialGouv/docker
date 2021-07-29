let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/459c92208a2cc494e25a64e1fd3e95f742246c08/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let InceptionJob =
      λ(args_0 : { package : Text }) →
      λ(args_1 : { name : Text, steps : List GithubActions.types.Step }) →
        GithubActions.Job::{
        , name = Some args_1.name
        , needs = Some [ "Build" ]
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , container = Some
            "docker://ghcr.io/socialgouv/docker/${args_0.package}:sha-\${{ github.sha }}"
        , steps = args_1.steps
        }

let __test__foo =
        assert
      :   InceptionJob
            { package = "foo" }
            { name = "Test foo version"
            , steps = [ GithubActions.Step::{ run = Some "foo --version" } ]
            }
        ≡ GithubActions.Job::{
          , name = Some "Test foo version"
          , needs = Some [ "Build" ]
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , container = Some
              "docker://ghcr.io/socialgouv/docker/foo:sha-\${{ github.sha }}"
          , steps = [ GithubActions.Step::{ run = Some "foo --version" } ]
          }

in  InceptionJob
