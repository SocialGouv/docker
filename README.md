<h1 align="center">
  <img src="https://github.com/SocialGouv/docker/raw/master/.github/docker.gif" width="250"/>
  <p align="center">Docker</p>
  <p align="center" style="font-size: 0.5em">SocialGouv Docker✨✨ 🐋</p>
</h1>

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache--2.0-yellow.svg" alt="License: Apache-2.0"></a>
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

## Images

| Project                  | Image                                                        | Links                                                                                         |
| ------------------------ | ------------------------------------------------------------ | --------------------------------------------------------------------------------------------- |
| **bats**                 | `docker pull ghcr.io/socialgouv/docker/bats`                 | [![README](https://img.shields.io/badge/README--green.svg)](./bats/README.md)                 |
| **check-cluster-images** | `docker pull ghcr.io/socialgouv/docker/check-cluster-images` | [![README](https://img.shields.io/badge/README--green.svg)](./check-cluster-images/README.md) |
| **cnpg-pgvector**        | `docker pull ghcr.io/socialgouv/docker/cnpg-pgvector`        | [![README](https://img.shields.io/badge/README--green.svg)](./cnpg-pgvector/README.md)        |
| **datasette**            | `docker pull ghcr.io/socialgouv/docker/datasette`            | [![README](https://img.shields.io/badge/README--green.svg)](./datasette/README.md)            |
| **git**                  | `docker pull ghcr.io/socialgouv/docker/git`                  | [![README](https://img.shields.io/badge/README--green.svg)](./git/README.md)                  |
| **nginx**                | `docker pull ghcr.io/socialgouv/docker/nginx`                | [![README](https://img.shields.io/badge/README--green.svg)](./nginx/README.md)                |
| **nginx4spa**            | `docker pull ghcr.io/socialgouv/docker/nginx4spa`            | [![README](https://img.shields.io/badge/README--green.svg)](./nginx4spa/README.md)            |
| **psql**                 | `docker pull ghcr.io/socialgouv/docker/psql`                 | [![README](https://img.shields.io/badge/README--green.svg)](./psql/README.md)                 |
| **s3-client**            | `docker pull ghcr.io/socialgouv/docker/s3-client`            | [![README](https://img.shields.io/badge/README--green.svg)](./s3-client/README.md)            |
| **wait-for-http**        | `docker pull ghcr.io/socialgouv/docker/wait-for-http`        | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-http/README.md)        |
| **wait-for-postgres**    | `docker pull ghcr.io/socialgouv/docker/wait-for-postgres`    | [![README](https://img.shields.io/badge/README--green.svg)](./wait-for-postgres/README.md)    |
| **greenmask**            | `docker pull ghcr.io/socialgouv/docker/greenmask`            | [![README](https://img.shields.io/badge/README--green.svg)](./greenmask/README.md)            |

<br>
<br>
<br>
<br>

## Release policy

We use [lerna](https://lerna.js.org/) to generate our releases.
You need an [Github token PAT](https://github.com/settings/tokens/new) to release.
