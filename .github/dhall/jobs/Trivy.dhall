let GithubActions =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/github-actions/package.dhall sha256:327d499ebf1ec63e5c3b0b0d5285b78a07be4ad1a941556eb35f67547004545f

let trivy-action =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/steps/aquasecurity/trivy-action/package.dhall sha256:a2c55b1dd91dca7feebb01f125631e1d4cfa9c84a9985822609d44f65e31eada

let upload-sarif =
      https://raw.githubusercontent.com/SocialGouv/.github/master/dhall/steps/github/codeql-action/upload-sarif/package.dhall sha256:e96a4a49e32c41420b99afd427f0549038b2b33d399ec1a66295e19e6cd9bf1a

let TrivyJob =
      λ(image-ref : Text) →
        GithubActions.Job::{
        , name = Some "Vulnerability Scanner"
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , steps =
          [ GithubActions.steps.actions/checkout
          ,   trivy-action.`0.0.14`
                trivy-action.Input::{
                , format = Some "template"
                , image-ref
                , output = Some "trivy-results.sarif"
                , template = Some "@/contrib/sarif.tpl"
                }
            ⫽ { name = Some "Run Trivy vulnerability scanner" }
          , upload-sarif.codeql-bundle-20210421
              upload-sarif.Input::{ sarif_file = Some "trivy-results.sarif" }
          ]
        }

let __test__foo =
        assert
      :   TrivyJob
            "ghcr.io/\${{ github.repository }}/foo:sha-\${{ github.sha }}"
        ≡ GithubActions.Job::{
          , name = Some "Vulnerability Scanner"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
            [ GithubActions.steps.actions/checkout
            ,   trivy-action.`0.0.14`
                  trivy-action.Input::{
                  , format = Some "template"
                  , image-ref =
                      "ghcr.io/\${{ github.repository }}/foo:sha-\${{ github.sha }}"
                  , template = Some "@/contrib/sarif.tpl"
                  , output = Some "trivy-results.sarif"
                  }
              ⫽ { name = Some "Run Trivy vulnerability scanner" }
            , upload-sarif.codeql-bundle-20210421
                upload-sarif.Input::{ sarif_file = Some "trivy-results.sarif" }
            ]
          }

in  TrivyJob
