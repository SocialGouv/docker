let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall
        sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

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
