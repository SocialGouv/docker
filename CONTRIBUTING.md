# Contributing to SocialGouv/docker

## DevExp

We use nodejs tools to help developing, testing the images.

### install

```sh
yarn
```

### build

#### one image
```sh
yarn workspace <package> build
```

#### all images
```sh
yarn build
```

### test

you must build image before running tests on it

#### one image

```sh
yarn workspace <package> test
```

#### all images

```sh
yarn workspace test
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
1. Add [bats](https://github.com/bats-core/bats-core) integration test  
   Additional config and binaries can be tested with bats files in the `tests` folder  

## Test

### Lint Dockerfiles

```sh
$ docker run --rm -i ghcr.io/hadolint/hadolint < ./<image>/Dockerfile
# example
$ docker run --rm -i ghcr.io/hadolint/hadolint < ./helm/Dockerfile
```
