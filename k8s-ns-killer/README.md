# K8S Namespace Killer :gun:

> Remove K8S namespaces that have a `git/branch` annotation and an existing branch on the git repository.

The killer has 2 modes.
- _"global"_ :gun: to remove any namespace in the cluster with `git/branch` and `git/remote` annotations
- _"local"_ :gun: to remove grep matching namespaces with a `git/branch` annotation

## Usage (global mode)

```sh
$ k8s-ns-killer
# And tones of namespaces fall...
```

By default the script will target `git/branch` and `git/remote` annotations on namespaces.  
You can change it by setting `BRANCH_ANNOTATION`.

```sh
$ export BRANCH_ANNOTATION="my/git/branch"
$ export REMOTE_ANNOTATION="my/git/remote"
#
$ sh -x ./bin/k8s-ns-killer my-feature-
```

## Usage (local mode)

### Gitlab

```yaml
Delete useless k8s namespaces:
  stage: Notify Finished Deployment
  dependencies: []
  allow_failure: true
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/k8s-ns-killer:0.12.0
  environment: fabrique-dev
  script:
    - git remote set-url origin https://github.com/${CI_PROJECT_PATH}.git
    - k8s-ns-killer foo-feature-
    # Debug mode
    # - sh -x /bin/k8s-ns-killer foo-feature-
  only:
    - master
```

### Docker

```sh
$ docker run --rm k8s-ns-killer:<version> <namespace filter>

# Example :
$ docker run --rm k8s-ns-killer:<version> foo-feature-
Will check all the namespace that match (grep) `foo-feature-`
```

## Requirement

Your namespaces must have an `git/branch` annotation with the branch name as value.

```yaml
# On GitLab we run
Create Namespace:
  # [...]
  script:
    # Skip the job if the namespace exists
    - "[[ $(kubectl get namespace ${K8S_NAMESPACE}) ]] && exit ${CI_JOB_SKIP_EXIT_CODE:-0}"

    - kubectl create namespace ${K8S_NAMESPACE}
    - kubectl annotate namespace ${K8S_NAMESPACE} field.cattle.io/projectId=${RANCHER_PROJECT_ID}
    - kubectl annotate namespace ${K8S_NAMESPACE} git/remote=${REMOTE_URL}
    - kubectl annotate namespace ${K8S_NAMESPACE} git/branch=${CI_COMMIT_REF_NAME}
```

## Launch

```sh
# ensure to have `refs/remotes/origin`s
$ git fetch origin
$ ./bin/k8s-ns-killer foo-feature-
# Or in debug mode
$ sh -x ./bin/k8s-ns-killer foo-feature-
```

By default the script will target `git/branch` annotations on namespaces.  
You can change it by setting `BRANCH_ANNOTATION`.

```sh
$ export BRANCH_ANNOTATION="my/git/branch"
$ sh -x ./bin/k8s-ns-killer my-feature-
```

By default the script will use `git remote get-url origin` as repository.  
You can change it by setting `REPOSITORY`.

```sh
$ export REPOSITORY="git@github.com:SocialGouv/docker.git"
$ sh -x ./bin/k8s-ns-killer my-feature-
```


## With Docker image 

