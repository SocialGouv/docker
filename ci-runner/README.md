# ci-runner

> Generic toolbox for CI runner, for example on github action

## Use it in github actions

```yaml
jobs:
  my-cool-job:
    name: The Cool Job
    runs-on: ghcr.io/socialgouv/docker/ci-runner
    steps:
    - name: Apply manifest
      run: kubectl apply -f ${{ github.action_path }}
```

```sh
$ docker run --rm ghcr.io/socialgouv/docker/ci-runner
```
