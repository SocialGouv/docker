let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall
        sha256:bee4dff3d273e31e153040cb1f18824a67c4676785583b018f8d2f4147ebfd45

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall
        sha256:037f4c6e58bcec39375d74afb5ded6db30caa1e372b399bf7f30da1d6c1cdc4f

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/9fe59f60d6a941dd76df40d67b3428fdf85865aa/dhall/github-actions/package.dhall
        sha256:61e7d862f54e9514379feaadbc80a85b7bd870dad5e31e2e83d8b3dd9eda8e1b

let name = "no-k8s"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{
            , run = Some "cat package.json"
            , working-directory = Some "/k8s/.k8s"
            }
          ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
