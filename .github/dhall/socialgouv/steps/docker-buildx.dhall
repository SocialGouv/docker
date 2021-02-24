let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let setup-buildx-action =
      ../../steps/docker/setup-buildx-action/package.dhall sha256:51888a4770a70f02659b978e7eb1706e6b72abc406cde615098167bd51e65227

let socialgouv/docker-buildx =
          setup-buildx-action.`v1.1.2` setup-buildx-action.Input::{=}
      //  { name = Some "Set up Docker Buildx" }

let __test__foo =
        assert
      :     socialgouv/docker-buildx
        ===  GithubActions.Step::{
             , name = Some "Set up Docker Buildx"
             , uses = Some
                 "docker/setup-buildx-action@2a4b53665e15ce7d7049afb11ff1f70ff1610609"
             , `with` = Some ([] : List { mapKey : Text, mapValue : Text })
             }

in  socialgouv/docker-buildx
