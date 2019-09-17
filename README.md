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
<br>

## Usage

```sh
$ docker pull registry.gitlab.factory.social.gouv.fr/socialgouv/docker/<image>:<version>
# or
$ docker pull docker.pkg.github.com/socialgouv/docker/<image>:<version>
```

## Images

| Project    | Image                                                                                      | Links                                                                                                                               |
| ---------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| **git-deploy** | [`socialgouv/docker/git-deploy`](./git-deploy) | [![README](https://img.shields.io/badge/README--green.svg)](./charts/webapp/README.md) |
| **helm** | [`socialgouv/docker/helm`](./helm) | [![README](https://img.shields.io/badge/README--green.svg)](./charts/webapp/README.md) |
| **k8s-ns-killer** | [`socialgouv/docker/k8s-ns-killer`](./k8s-ns-killer) | [![README](https://img.shields.io/badge/README--green.svg)](./charts/webapp/README.md) |
| **kubectl** | [`socialgouv/docker/kubectl`](./kubectl) | [![README](https://img.shields.io/badge/README--green.svg)](./charts/webapp/README.md) |
