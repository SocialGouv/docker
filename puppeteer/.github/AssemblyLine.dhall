let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:d6bde52ed9b7bce48e35008fa71a8267f14073877602195723c47224dd61e05f

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let name = "puppeteer"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "node --version" }
          , GithubActions.Step::{ run = Some "chromium-browser --version" }
          ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
