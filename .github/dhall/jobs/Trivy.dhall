let GithubActions =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/99ab4e7946350137caa8644b940161c3e67fcaf1/dhall/github-actions/package.dhall
        sha256:66b276bb67cca4cfcfd1027da45857cc8d53e75ea98433b15dade1e1e1ec22c8

let trivy-action =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/99ab4e7946350137caa8644b940161c3e67fcaf1/dhall/steps/aquasecurity/trivy-action/package.dhall
        sha256:aeeb75c894a6a7c51d0c83574310e58db4d11698cbe9b5f443beb3043931474d

let upload-sarif =
    {- renovate: currentValue=master -}
      https://raw.githubusercontent.com/SocialGouv/.github/99ab4e7946350137caa8644b940161c3e67fcaf1/dhall/steps/github/codeql-action/upload-sarif/package.dhall
        sha256:e96a4a49e32c41420b99afd427f0549038b2b33d399ec1a66295e19e6cd9bf1a

let job =
      λ(package : Text) →
        GithubActions.Job::{
        , name = Some "Vulnerability Scanner"
        , needs = Some [ "Build" ]
        , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
        , steps =
          [ GithubActions.steps.actions/checkout
          , GithubActions.Step::{
            , run = Some
                "docker pull ghcr.io/socialgouv/docker/${package}:sha-\${{ github.sha }}"
            }
          ,   trivy-action.`0.0.17`
                trivy-action.Input::{
                , image-ref =
                    "ghcr.io/socialgouv/docker/${package}:sha-\${{ github.sha }}"
                }
            ⫽ { name = Some "Run Trivy vulnerability scanner" }
          ,   trivy-action.`0.0.17`
                trivy-action.Input::{
                , format = Some "template"
                , image-ref =
                    "ghcr.io/socialgouv/docker/${package}:sha-\${{ github.sha }}"
                , template = Some "@/contrib/sarif.tpl"
                , output = Some "trivy-results.sarif"
                }
            ⫽ { name = Some "Export Trivy Results as sarif" }
          , GithubActions.Step::{
            , name = Some "Change hardcoded Dockerfile path"
            , run = Some
                (     "sed -i"
                  ++  " 's/\"uri\": \"Dockerfile\"/\"uri\": \"${package}\\/Dockerfile\"/'"
                  ++  " trivy-results.sarif"
                )
            }
          , upload-sarif.codeql-bundle-20210421
              upload-sarif.Input::{ sarif_file = Some "trivy-results.sarif" }
          ]
        }

let __test__foo =
        assert
      :   job "foo"
        ≡ GithubActions.Job::{
          , name = Some "Vulnerability Scanner"
          , needs = Some [ "Build" ]
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
            [ GithubActions.steps.actions/checkout
            , GithubActions.Step::{
              , run = Some
                  "docker pull ghcr.io/socialgouv/docker/foo:sha-\${{ github.sha }}"
              }
            ,   trivy-action.`0.0.17`
                  trivy-action.Input::{
                  , image-ref =
                      "ghcr.io/socialgouv/docker/foo:sha-\${{ github.sha }}"
                  }
              ⫽ { name = Some "Run Trivy vulnerability scanner" }
            ,   trivy-action.`0.0.17`
                  trivy-action.Input::{
                  , format = Some "template"
                  , image-ref =
                      "ghcr.io/socialgouv/docker/foo:sha-\${{ github.sha }}"
                  , template = Some "@/contrib/sarif.tpl"
                  , output = Some "trivy-results.sarif"
                  }
              ⫽ { name = Some "Export Trivy Results as sarif" }
            , GithubActions.Step::{
              , name = Some "Change hardcoded Dockerfile path"
              , run = Some
                  (     "sed -i"
                    ++  " 's/\"uri\": \"Dockerfile\"/\"uri\": \"foo\\/Dockerfile\"/'"
                    ++  " trivy-results.sarif"
                  )
              }
            , upload-sarif.codeql-bundle-20210421
                upload-sarif.Input::{ sarif_file = Some "trivy-results.sarif" }
            ]
          }

in  job
