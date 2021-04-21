let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:65d3d56c7697681828874e0dbe93f9e711605e13bd66f0688c33c785b25aef2b

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let name = "azure-cli"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps = [ GithubActions.Step::{ run = Some "az --version" } ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
