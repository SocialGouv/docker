let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:855b25954f47d0c861af3aee7d31ff6f4aaac9954773991e8b107dfeef85f280

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let name = "kosko"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps = [ GithubActions.Step::{ run = Some "kosko --version" } ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
