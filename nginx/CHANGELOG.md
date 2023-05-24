# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## [8.0.1](https://github.com/SocialGouv/docker/compare/nginx@8.0.0...nginx@8.0.1) (2023-05-24)


### Bug Fixes

* **deps:** update nginxinc/nginx-unprivileged:1.23-alpine docker digest to 3b46341 ([#1012](https://github.com/SocialGouv/docker/issues/1012)) ([0f1eed4](https://github.com/SocialGouv/docker/commit/0f1eed4d4f6b6a2ce22a216ebb66fac22a3aa379))





# 8.0.0 (2023-05-22)


### Bug Fixes

* charset explicit utf8 ([#969](https://github.com/SocialGouv/docker/issues/969)) ([ff400bd](https://github.com/SocialGouv/docker/commit/ff400bd30cd2b874acee166f6445397d6b0a7176))
* **deps:** update nginxinc/nginx-unprivileged:1.23-alpine docker digest to ae94ea4 ([#1001](https://github.com/SocialGouv/docker/issues/1001)) ([a304e99](https://github.com/SocialGouv/docker/commit/a304e99f66e1b89af311b1c1e9807f5fade6fbf0))
* **dhall:** deactivate container_test ([#963](https://github.com/SocialGouv/docker/issues/963)) ([730dedc](https://github.com/SocialGouv/docker/commit/730dedc867620de68d50e069514e7b7ed7e657f9))
* handle next.js 404/index.html ([#855](https://github.com/SocialGouv/docker/issues/855)) ([b6caffd](https://github.com/SocialGouv/docker/commit/b6caffd67ec1e05e7c47e6a8bcc6431b51aec53b))
* **nginx:** allow skip envsubst ([#946](https://github.com/SocialGouv/docker/issues/946)) ([d4e43ea](https://github.com/SocialGouv/docker/commit/d4e43ea79880e6bb8679c693d38224df0473acad))
* **nginx:** hide nginx version in folders ([#971](https://github.com/SocialGouv/docker/issues/971)) ([76ef24e](https://github.com/SocialGouv/docker/commit/76ef24e98b1dcc725920ca2cb07c100de6e4b037))
* **nginx:** set nginx user permissions ([#930](https://github.com/SocialGouv/docker/issues/930)) ([7643c98](https://github.com/SocialGouv/docker/commit/7643c9816be9c025294c59589f9bdfcbc3b34ca8))
* **nginx:** static next.js friendly fallback ([#868](https://github.com/SocialGouv/docker/issues/868)) ([329aa63](https://github.com/SocialGouv/docker/commit/329aa630b2bebb492f0c3dd04c96f58b33afc53b))
* **secu:** upgrade nginx image ([#972](https://github.com/SocialGouv/docker/issues/972)) ([5d9d5aa](https://github.com/SocialGouv/docker/commit/5d9d5aa6e91db827c13ee415499a90e56d5a16b8))
* try upgrade ([#992](https://github.com/SocialGouv/docker/issues/992)) ([b03a3b9](https://github.com/SocialGouv/docker/commit/b03a3b9da685ccb43037989018e7df2bd4bef0ac))


### Features

* **deps:** update gcr.io/gcp-runtimes/container-structure-test docker tag to v1.11.0 ([#899](https://github.com/SocialGouv/docker/issues/899)) ([62317e4](https://github.com/SocialGouv/docker/commit/62317e49e4aad5e51b32d0a4b5f0c06e7ede1be6))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.7.0 ([#804](https://github.com/SocialGouv/docker/issues/804)) ([9e5fe94](https://github.com/SocialGouv/docker/commit/9e5fe949ccada4798905af4e7d41b5804c3fdfd6))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.8.0 ([#893](https://github.com/SocialGouv/docker/issues/893)) ([38d6f60](https://github.com/SocialGouv/docker/commit/38d6f6021de41ff02a508e092ab3b7502a96e9e4))
* **nginx:** enable custom 404.html ([#854](https://github.com/SocialGouv/docker/issues/854)) ([255235a](https://github.com/SocialGouv/docker/commit/255235a1dcad1087e08f1b962775ad4c4becf557))
* **nginx:** nginx image ([#765](https://github.com/SocialGouv/docker/issues/765)) ([3516776](https://github.com/SocialGouv/docker/commit/351677647cca56914350cf57d641ac2f605faef8))
* **nginx:** Use unpriviledged docker images ([#956](https://github.com/SocialGouv/docker/issues/956)) ([764247c](https://github.com/SocialGouv/docker/commit/764247c6acf7ea4abeef423e8119b890ea1a35b7))


### BREAKING CHANGES

* **nginx:** port needs to be changed in projects using these images





## [7.6.2-alpha.22](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.21...nginx@7.6.2-alpha.22) (2023-05-16)


### Bug Fixes

* clean test wget output ([857a18f](https://github.com/SocialGouv/docker/commit/857a18f98735dcb9249c3b5dcb228eff46e4e5bb))





## [7.6.2-alpha.21](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.20...nginx@7.6.2-alpha.21) (2023-05-16)


### Bug Fixes

* wip ([c83c8d8](https://github.com/SocialGouv/docker/commit/c83c8d818eab38ddce0266c7d8feb77e68d9d6ba))





## [7.6.2-alpha.20](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.19...nginx@7.6.2-alpha.20) (2023-05-16)


### Bug Fixes

* wip ([8881499](https://github.com/SocialGouv/docker/commit/8881499b6b828d368b7af3a74dcad4605cbd943f))





## [7.6.2-alpha.19](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.18...nginx@7.6.2-alpha.19) (2023-05-16)


### Bug Fixes

* wip ([4c533f0](https://github.com/SocialGouv/docker/commit/4c533f0156fab9f2ad0da0cfc0fe9ed9e1da8591))





## [7.6.2-alpha.18](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.17...nginx@7.6.2-alpha.18) (2023-05-16)


### Bug Fixes

* wip ([ef35385](https://github.com/SocialGouv/docker/commit/ef353850d4aee1b37cb3035991967d3b6cfd2031))





## [7.6.2-alpha.17](https://github.com/SocialGouv/docker/compare/nginx@7.6.2-alpha.16...nginx@7.6.2-alpha.17) (2023-05-16)


### Bug Fixes

* wip ([896ce79](https://github.com/SocialGouv/docker/commit/896ce7988eba5b9e15083eb9deb7503d2990ac90))
