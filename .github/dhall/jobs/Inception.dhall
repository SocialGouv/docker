let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/baf508eff47537540ec7208cc242f7414f09cad1/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

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
