let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall sha256:45f912b1325c2b38e21743facd9d475ef94ba8fdb90e209521be866af13725be

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall sha256:65a7d0afb9febb7af474404b75696831c58e9fe7008b8643fd82b543e37b5a21

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let name = "kubectl"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "kubectl version --client=true" } ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
