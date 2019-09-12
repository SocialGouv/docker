# K8S Namespace Killer :gun:

> Remove K8S namespaces with 

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
    - kubectl annotate namespace ${K8S_NAMESPACE} git/branch=${CI_COMMIT_REF_NAME}
```

## Launch

```sh
$ NAMESPACES=foo-feature- sh -x ./bin/k8s-ns-killer
```

## With Docker image 

```sh
$ docker run --rm -it -e NAMESPACES=lol k8s-ns-killer:<version>
```
