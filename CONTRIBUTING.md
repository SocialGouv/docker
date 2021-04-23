# Contributing to SocialGouv/docker

## DevExp

We use nodejs tools to help developing, testing the images.

```sh
# Install all with
$ yarn
```

**NOTE**: You might need to manualy install `dhall` and `postgres-client` on your computeur for now...

We use `Makefile` to orchestrator the whole monorepo.

```sh
$ make
# Will deal with all the workflow

$ cd <package>
$ make
# Will deal with one package build and tests
```

## Create a new image

1. Create a folder with the image name (example: foo)

```bash
$ mkdir foo
```

1. Add a `README.md`  
   Ensure to add a documentation right from the start with a `README.md`.  
   You can follow the [`wait-for-postgres/README.md` as model](./wait-for-postgres/README.md).
1. Add the image to the table in the [root `README.md`](./README.md).  
   Keep alpha sorted plz ;)
1. Add a `Makefile` to specify how to make the image  
   You can follow the [`wait-for-postgres/Makefile` as model](./wait-for-postgres/Makefile).
1. Add a `Makefile` to specify how to make the image  
   You can follow the [`wait-for-postgres/Makefile` as model](./wait-for-postgres/Makefile).
1. Add a `docker-compose.yml` with a `.env` handle docker configurations  
   We name the service with the distro used as from for the image  
   You can follow the [`wait-for-postgres/docker-compose.yml` as model](./wait-for-postgres/docker-compose.yml) and[`wait-for-postgres/.env` as model](./wait-for-postgres/.env).  
   Note that there is an additional service `postgres` used for tests here
1. Add [container structure test](https://github.com/GoogleContainerTools/container-structure-test/)  
   We ensure that the built image is well made :)  
   You can follow the [`wait-for-postgres/tests/container-structure-test.yml` as model](./wait-for-postgres/tests/container-structure-test.yml)
1. Add [bats](https://github.com/bats-core/bats-core) integration test  
   Additional config and binaries can be tested with bats files in the `tests` folder  
   You can follow the [`wait-for-postgres/docker-compose.yml` as model](./wait-for-postgres/docker-compose.yml) and[`wait-for-postgres/.env` as model](./wait-for-postgres/.env).  
   Note that there is an additional service `postgres` used for tests here
1. Add a `.github` folder with the dhall config to generate the workflow
   Ensure to build your image on the main branches to be release friendly.  
   Over branches can only focus on what you changed.  
   You can follow the [`wait-for-postgres/.github` as model](./wait-for-postgres/.github).

## Test

### Lint Dockerfiles

```sh
$ docker run --rm -i hadolint/hadolint < ./<image>/Dockerfile
# example
$ docker run --rm -i hadolint/hadolint < ./helm/Dockerfile
```

## Generate GitLab Workflow

### Lint Dockerfiles

```sh
$ rm -rf .cache && export XDG_CACHE_HOME="$(pwd)/.cache"
$ dhall freeze --transitive curl/.github/main.workflow.dhall --all
$ dhall-to-yaml --file curl/.github/main.workflow.dhall --output .github/workflows/azure-cli.main.workflow.yaml
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
