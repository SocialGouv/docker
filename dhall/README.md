# Dhall

> [The Dhall configuration language](https://dhall-lang.org/)  
> Maintainable configuration files

Expose `dhall`, `dhall-to-json`, `dhall-to-yaml` binaries.

## Meta

- No-root image
  - User : `socialgouv`
  - HOME : `/home/socialgouv`

## Usage

**Note** : We recommande mounting the `/home/socialgouv/.cache` folder to preserve the dhall cache :

```sh
$ docker run --rm -it --volume "$(pwd)/.cache":"/home/socialgouv/.cache" socialgouv/docker/dhall <cmd>
```

#### Local

```sh
# Runs a shell inside the dhall image
$ docker run --rm -it --volume "$(pwd)/":"/home/socialgouv/" socialgouv/docker/dhall
~ $ dhall freeze --inplace ./dhall/.github/ci.dhall

#

# Runs a dhall throught the image
$ docker run --rm --volume "$(pwd)/":"/home/socialgouv/" socialgouv/docker/dhall \
  dhall freeze --inplace ./dhall/.github/ci.dhall
#

# Convert a github workflow from dhall to yaml
$ docker run --rm --volume "$(pwd)/":"/home/socialgouv/" socialgouv/docker/dhall \
  dhall-to-yaml --file ./dhall/.github/ci.dhall --output .github/workflows/dhall.ci.yaml
```
