<h1 align="center">
  <img src="https://github.com/SocialGouv/docker/raw/master/.github/docker.gif" width="250"/>
  <p align="center">Docker</p>
  <p align="center" style="font-size: 0.5em">Social Gouv Docker✨✨ 🐋</p>
</h1>

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache--2.0-yellow.svg" alt="License: Apache-2.0"></a>
  <a href="https://github.com/SocialGouv/docker/releases "><img alt="GitHub release (latest SemVer)" src="https://img.shields.io/github/v/release/SocialGouv/docker?sort=semver"></a>
</p>

<br>
<br>
<br>

## Usage

```sh
$ docker pull ghcr.io/socialgouv/docker/<image>
```

<br>
<br>
<br>
<br>

## Images

| Project               | Image                                                            | Links                                                                                      |
| --------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **azure-cli**         | `docker pull ghcr.io/socialgouv/docker/azure-cli:7.1.1`         | [![README](https://img.shields.io/badge/README--green.svg)](./azure-cli/README.md)         |
| **azure-db**          | `docker pull ghcr.io/socialgouv/docker/azure-db:7.1.1`          | [![README](https://img.shields.io/badge/README--green.svg)](./azure-db/README.md)          |
| **bats**              | `docker pull ghcr.io/socialgouv/docker/bats:7.1.1`              | [![README](https://img.shields.io/badge/README--green.svg)](./bats/README.md)              |
| **dhall**             | `docker pull ghcr.io/socialgouv/docker/dhall:7.1.1`             | [![README](https://img.shields.io/badge/README--green.svg)](./dhall/README.md)             |
| **nginx**             | `docker pull ghcr.io/socialgouv/docker/nginx:7.1.1`             | [![README](https://img.shields.io/badge/README--green.svg)](./nginx/README.md)             |
| **nginx4spa**         | `docker pull ghcr.io/socialgouv/docker/nginx4spa:7.1.1`         | [![README](https://img.shields.io/badge/README--green.svg)](./nginx4spa/README.md)         |
| **psql**              | `docker pull ghcr.io/socialgouv/docker/psql:7.1.1`              | [![README](https://img.shields.io/badge/README--green.svg)](./psql/README.md)              |
| **wait-for-http**     | `docker pull ghcr.io/socialgouv/docker/wait-for-http:7.1.1`     | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-http/README.md)     |
| **wait-for-postgres** | `docker pull ghcr.io/socialgouv/docker/wait-for-postgres:7.1.1` | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-postgres/README.md) |

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
