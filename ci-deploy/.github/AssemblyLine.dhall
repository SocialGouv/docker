let AssemblyLine =
      ../../.github/dhall/workflows/AssemblyLine.dhall
        sha256:bee4dff3d273e31e153040cb1f18824a67c4676785583b018f8d2f4147ebfd45

let InceptionJob =
      ../../.github/dhall/jobs/Inception.dhall
        sha256:037f4c6e58bcec39375d74afb5ded6db30caa1e372b399bf7f30da1d6c1cdc4f

let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let name = "ci-deploy"

let version_test =
      InceptionJob
        { package = name }
        { name = "Test Version"
        , steps =
          [ GithubActions.Step::{ run = Some "kubectl version --client=true" } ]
        }

in  AssemblyLine.Worklflow { name, jobs = toMap { version_test } }
