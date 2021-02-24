let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

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
