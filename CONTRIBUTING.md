# Contributing to SocialGouv/docker 

## Create a new image

1. Create a folder with the image name (example: foo)

```bash
$ mkdir foo
```

1. Add a `README.md`  
   Ensure to add a documentation right from the start with a `README.md`.  
   You can follow the [`k8s-ns-killer/README.md` as model](./k8s-ns-killer/README.md).

1. Add the image to the table in the [root `README.md`](./README.md).  
   Keep alpha sorted plz ;)

1. Add a `.gitlab-ci.yml` to specify the image tests  
   Ensure to add a test right from the start with in a local `.gitlab-ci.yml`.  
   You can follow the [`kubectl/.gitlab-ci.yml` as model](./kubectl/.gitlab-ci.yml).

1. Include this local `.gitlab-ci.yml` in the includes of [the root `.gitlab-ci.yml`](./.gitlab-ci.yml).

## Test

### Lint Dockerfiles

```sh
$ docker run --rm -i hadolint/hadolint < ./<image>/Dockerfile
# example
$ docker run --rm -i hadolint/hadolint < ./helm/Dockerfile
```

## Release policy

### One click semantic release !

[On a successful `master` branch pipeline click on trigger the `Release` job.](https://gitlab.factory.social.gouv.fr/SocialGouv/docker/pipelines)

### Manual

We mainly use [semantic-release](https://github.com/semantic-release/semantic-release) to generate our release
You need an [Github token](https://github.com/settings/tokens/new) to release.

```sh
$ export GITHUB_TOKEN=**********
$ yarn global add semantic-release @semantic-release/changelog @semantic-release/exec @semantic-release/git
$ semantic-release
```

Our [semantic-release config](./.releaserc.yml) will do the heavy lifting ;)
