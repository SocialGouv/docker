# K8S Object Cleaner :ocean:

> Remove K8S objects linked to a deleted branch on the git repository.

## Usage

### Gitlab

```yaml
Clean k8s objects:
  stage: Notify Finished Deployment
  dependencies: []
  allow_failure: true
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/k8s-object-cleaner
  environment: fabrique-dev2
  variables:
    GITHUB_REPOSITORY: https://github.com/${CI_PROJECT_PATH}.git
    K8S_NAMESPACE: ${K8S_NAMESPACE}
  script:
    - git remote set-url origin https://github.com/${CI_PROJECT_PATH}.git
    - k8s-object-cleaner
    # Debug mode
    # - node /bin/k8s-object-cleaner --dry-run
  only:
    - master
```

### Docker

```sh
$ docker run --rm k8s-object-cleaner:<version> <namespace filter> --env K8S_NAMESPACE=ns --env GITHUB_REPOSITORY=https://github.com/SocialGouv/docker

# Will check delete all remaining object linked to deleted branches in the namespace `ns`

```

## Launch

```sh
# ensure to have nodejs and a configured kubectl
# Using --dry-run to only print command
$ K8S_NAMESPACE=ns GITHUB_REPOSITORY=https://github.com/SocialGouv/docker k8s-object-cleaner --dry-run
# Or for real
$ K8S_NAMESPACE=ns GITHUB_REPOSITORY=https://github.com/SocialGouv/docker k8s-object-cleaner --dry-run
```
