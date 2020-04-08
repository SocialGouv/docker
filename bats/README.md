# Bats :bat:

> Launch Bash Tests.

This image uses [the official](https://github.com/bats-core/bats-core#running-bats-in-docker) [bats/bats](https://hub.docker.com/r/bats/bats) image in addition with some common [helper libraries](https://github.com/ztombol/bats-docs)

- [`bats-support`][bats-support] (formerly `bats-core`) - supporting
  library for test helpers
- [`bats-assert`][bats-assert] - common assertions
- [`bats-file`][bats-file] - filesystem related assertions

## Usage

### Gitlab

```yaml
Test:
  stage: Code Quality
  dependencies: []
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:<version>
  script:
    - bats -t test
```

### Docker

```sh
# To run your local test folder
$ docker run --rm -v "$(pwd):/app" registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:<version> /app/test
```


## Test 

```sh
# To run Bats' internal test suite (which is in the container image at /opt/bats/test):
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:<version> /opt/bats/test
# To run Bats assert' internal test suite (which is in the container image at /usr/lib/bats-assert/test):
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:<version> /usr/lib/bats-assert/test
# To run Bats file' internal test suite (which is in the container image at /usr/lib/bats-file/test):
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:<version> /usr/lib/bats-file/test
```


[bats-support]: https://github.com/ztombol/bats-support
[bats-assert]: https://github.com/ztombol/bats-assert
[bats-file]: https://github.com/ztombol/bats-file
