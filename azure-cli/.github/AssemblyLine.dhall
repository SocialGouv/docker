let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:eb43aee5e588cbb17b85be2c3d7c9cbcbcfc6aa71e036a5e7eb3fe7260fa73ae

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let name = "azure-cli"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps = [ GithubActions.Step::{ run = Some "az --version" } ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
