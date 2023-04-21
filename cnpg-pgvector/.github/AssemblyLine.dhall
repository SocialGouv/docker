let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall
        sha256:4ca95f89add8e1413b10df462f06085c4062ab20031553c5973337e673a42c97

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall
        sha256:037f4c6e58bcec39375d74afb5ded6db30caa1e372b399bf7f30da1d6c1cdc4f

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/9fe59f60d6a941dd76df40d67b3428fdf85865aa/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let name = "cnpg-pgvector"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test files"
        , steps =
          [ GithubActions.Step::{ run = Some "psql --version" }
          , GithubActions.Step::{ run = Some "which pg_dump" }
          , GithubActions.Step::{ run = Some "which pg_restore" }
          , GithubActions.Step::{ run = Some "ls /usr/share/postgresql/15/extension/vector.control" }
          ]
        }


in  AssemblyLine.Worklflow
      { name, jobs = toMap {  version_test } }
