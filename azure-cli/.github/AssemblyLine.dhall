let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:7e4f1be360523c21c571e8eea198c5d9023ec31773cc770bf7e6a1b7d9302cce

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:fcb7d9f4a23103bd40219f4b92f7ac31d10566ff902d0cb731328d6d455b9ddb

let version_test =
      InceptionJob
        { package = "azure-cli" }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "azure-cli --version" }
          , GithubActions.Step::{ run = Some "azure-cli-to-json --version" }
          , GithubActions.Step::{ run = Some "azure-cli-to-yaml --version" }
          ]
        }

in  AssemblyLine.Worklflow { name = "azure-cli", jobs = toMap { version_test } }
