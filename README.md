<h1 align="center">
  <img src="https://github.com/SocialGouv/docker/raw/master/.github/docker.gif" width="250"/>
  <p align="center">Docker</p>
  <p align="center" style="font-size: 0.5em">Social Gouv Docker✨✨ 🐋</p>
</h1>

<p align="center">
  <a href="https://gitlab.factory.social.gouv.fr/SocialGouv/docker/pipelines"><img src="https://gitlab.factory.social.gouv.fr/SocialGouv/docker/badges/master/pipeline.svg" alt="Gitlab Master Build Status"></a>
  <a href="https://travis-ci.com/SocialGouv/docker"><img src="https://travis-ci.com/SocialGouv/docker.svg?branch=master" alt="Travis Build Status"></a>
  <a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache--2.0-yellow.svg" alt="License: Apache-2.0"></a>
  <a href="https://github.com/SocialGouv/docker/releases "><img alt="GitHub release (latest SemVer)" src="https://img.shields.io/github/v/release/SocialGouv/docker?sort=semver"></a>
</p>

<br>
<br>
<br>

## Usage

```sh
$ docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/<image>:<version>
# or
$ docker pull docker.pkg.github.com/socialgouv/docker/<image>:<version>
```

<br>
<br>
<br>
<br>

## Images

| Project               | Image                                                                                          | Links                                                                                      |
| --------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **azure-cli**         | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/azure-cli:6.0.0-beta.2`         | [![README](https://img.shields.io/badge/README--green.svg)](./azure-cli/README.md)         |
| **azure-db**          | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/azure-db:6.0.0-beta.2`          | [![README](https://img.shields.io/badge/README--green.svg)](./azure-db/README.md)          |
| **curl**              | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/curl:6.0.0-beta.2`              | [![README](https://img.shields.io/badge/README--green.svg)](./curl/README.md)              |
| **bats**              | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:6.0.0-beta.2`              | [![README](https://img.shields.io/badge/README--green.svg)](./bats/README.md)              |
| **dhall**             | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/dhall:6.0.0-beta.2`             | [![README](https://img.shields.io/badge/README--green.svg)](./dhall/README.md)             |
| **git-deploy**        | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/git-deploy:6.0.0-beta.2`        | [![README](https://img.shields.io/badge/README--green.svg)](./git-deploy/README.md)        |
| **kosko**             | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:6.0.0-beta.2`             | [![README](https://img.shields.io/badge/README--green.svg)](./kosko/README.md)             |
| **kubectl**           | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:6.0.0-beta.2`           | [![README](https://img.shields.io/badge/README--green.svg)](./kubectl/README.md)           |
| **nginx4spa**         | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/nginx4spa:6.0.0-beta.2`         | [![README](https://img.shields.io/badge/README--green.svg)](./nginx4spa/README.md)         |
| **no-k8s**            | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/no-k8s:6.0.0-beta.2`            | [![README](https://img.shields.io/badge/README--green.svg)](./no-k8s/README.md)            |
| **puppeteer**         | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/puppeteer:6.0.0-beta.2`         | [![README](https://img.shields.io/badge/README--green.svg)](./puppeteer/README.md)         |
| **wait-for-http**     | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/wait-for-http:6.0.0-beta.2`     | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-http/README.md)     |
| **wait-for-postgres** | `docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/wait-for-postgres:6.0.0-beta.2` | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-postgres/README.md) |

<br>
<br>
<br>
<br>

## Release policy

We mainly use [semantic-release](https://github.com/semantic-release/semantic-release) to generate our releases.
You need an [Github token](https://github.com/settings/tokens/new) to release.

```sh
$ export GITHUB_TOKEN=**********
$ yarn global add semantic-release @semantic-release/changelog @semantic-release/git
$ semantic-release
```

Our [semantic-release config](./.releaserc.yml) will do the heavy lifting ;)
