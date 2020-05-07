# Trivy

> [Trivy](https://github.com/aquasecurity/trivy) image

## Usage

### Docker

```sh
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/trivy:<version>
```

### Gitlab

```yaml
Vulnerability check:
  stage: Vulnerability check
  dependencies: []
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/trivy:<version>
  variables:
    GIT_STRATEGY: none
    IMAGE: "${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHA}"
    TRIVY_ARGS: >-
      --cache-dir .trivycache
      --no-progress
  script:
    # Build report
    - >-
      trivy -d --exit-code 0 ${TRIVY_ARGS}
        --format template 
        --template "@/tmp/contrib/gitlab.tpl"
        -o gl-container-scanning-report.json 
        ${IMAGE}
    # Print report
    - trivy -d --exit-code 0 ${TRIVY_ARGS} ${IMAGE}
    # Fail on high and critical vulnerabilities
    - trivy -d --exit-code 1 ${TRIVY_ARGS} ${IMAGE}
```
