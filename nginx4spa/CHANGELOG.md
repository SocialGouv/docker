# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## [8.0.2](https://github.com/SocialGouv/docker/compare/nginx4spa@8.0.1...nginx4spa@8.0.2) (2023-06-01)


### Bug Fixes

* **deps:** update nginxinc/nginx-unprivileged:1.23-alpine docker digest to 2db1d9e ([#1018](https://github.com/SocialGouv/docker/issues/1018)) ([0ac8831](https://github.com/SocialGouv/docker/commit/0ac88315d0111e374797213de242046c68390290))





## [8.0.1](https://github.com/SocialGouv/docker/compare/nginx4spa@8.0.0...nginx4spa@8.0.1) (2023-05-24)


### Bug Fixes

* **deps:** update nginxinc/nginx-unprivileged:1.23-alpine docker digest to 3b46341 ([#1012](https://github.com/SocialGouv/docker/issues/1012)) ([0f1eed4](https://github.com/SocialGouv/docker/commit/0f1eed4d4f6b6a2ce22a216ebb66fac22a3aa379))





# 8.0.0 (2023-05-22)


### Bug Fixes

* charset explicit utf8 ([#969](https://github.com/SocialGouv/docker/issues/969)) ([ff400bd](https://github.com/SocialGouv/docker/commit/ff400bd30cd2b874acee166f6445397d6b0a7176))
* **deps:** update all dependencies docker tags ([#480](https://github.com/SocialGouv/docker/issues/480)) ([7fa4622](https://github.com/SocialGouv/docker/commit/7fa4622197b27efe444b6d5a44acd487a3606098))
* **deps:** update all dependencies docker tags (patch) ([#481](https://github.com/SocialGouv/docker/issues/481)) ([3e53f08](https://github.com/SocialGouv/docker/commit/3e53f0857fad653f03e68bf2d222239ad6456d59))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.4.1 ([#656](https://github.com/SocialGouv/docker/issues/656)) ([f190150](https://github.com/SocialGouv/docker/commit/f1901509a6af7e8463f6fafd2ec8e407a758386c))
* **deps:** update hadolint/hadolint docker tag to v1.17.7 ([#307](https://github.com/SocialGouv/docker/issues/307)) ([a9b0272](https://github.com/SocialGouv/docker/commit/a9b027225ed426041f4abf29a72bbcd173d77676))
* **deps:** update nginxinc/nginx-unprivileged:1.23-alpine docker digest to ae94ea4 ([#1001](https://github.com/SocialGouv/docker/issues/1001)) ([a304e99](https://github.com/SocialGouv/docker/commit/a304e99f66e1b89af311b1c1e9807f5fade6fbf0))
* **dhall:** deactivate container_test ([#963](https://github.com/SocialGouv/docker/issues/963)) ([730dedc](https://github.com/SocialGouv/docker/commit/730dedc867620de68d50e069514e7b7ed7e657f9))
* **gitlab:** add rules.change ([#247](https://github.com/SocialGouv/docker/issues/247)) ([d26347b](https://github.com/SocialGouv/docker/commit/d26347b9436f9c8ce585c887b6f767ba0ab8e785))
* **nginx4spa:** fix $uri/ order ([#476](https://github.com/SocialGouv/docker/issues/476)) ([552abd5](https://github.com/SocialGouv/docker/commit/552abd5b2ea80e2c1637da16b3d0e23253113e7f))
* **nginx4spa:** handle next.js static urls ([#474](https://github.com/SocialGouv/docker/issues/474)) ([c9df933](https://github.com/SocialGouv/docker/commit/c9df933f622d8d57ff45275200075537fbc46b4d))
* **nginx4spa:** use non-root user ([630cd5c](https://github.com/SocialGouv/docker/commit/630cd5c5bd3e2baba40cbd72186ecf511ee52d66))
* **nginx4spa:** use upstream nginx image ([#1006](https://github.com/SocialGouv/docker/issues/1006)) ([4949939](https://github.com/SocialGouv/docker/commit/494993940c8ef7098c82c72160d49b47a4398f55))
* **nginx:** allow skip envsubst ([#946](https://github.com/SocialGouv/docker/issues/946)) ([d4e43ea](https://github.com/SocialGouv/docker/commit/d4e43ea79880e6bb8679c693d38224df0473acad))
* **nginx:** hide nginx version in folders ([#971](https://github.com/SocialGouv/docker/issues/971)) ([76ef24e](https://github.com/SocialGouv/docker/commit/76ef24e98b1dcc725920ca2cb07c100de6e4b037))
* **secu:** upgrade nginx image ([#972](https://github.com/SocialGouv/docker/issues/972)) ([5d9d5aa](https://github.com/SocialGouv/docker/commit/5d9d5aa6e91db827c13ee415499a90e56d5a16b8))


### Features

* add hadolint ([#40](https://github.com/SocialGouv/docker/issues/40)) ([7bc8b83](https://github.com/SocialGouv/docker/commit/7bc8b830604e39892c24d35c5a168704e5e0913c))
* add nginx security headers to default config ([#681](https://github.com/SocialGouv/docker/issues/681)) ([b9f3f09](https://github.com/SocialGouv/docker/commit/b9f3f0947484874460f9739d53ae06def1ece8f9))
* **deps:** update all non-major dependencies docker tags (minor) ([#494](https://github.com/SocialGouv/docker/issues/494)) ([f553c0b](https://github.com/SocialGouv/docker/commit/f553c0b3e6c0cc93d133d24a73bb0662a251e3fc))
* **deps:** update gcr.io/gcp-runtimes/container-structure-test docker tag to v1.11.0 ([#899](https://github.com/SocialGouv/docker/issues/899)) ([62317e4](https://github.com/SocialGouv/docker/commit/62317e49e4aad5e51b32d0a4b5f0c06e7ede1be6))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.5.0 ([#685](https://github.com/SocialGouv/docker/issues/685)) ([f072b93](https://github.com/SocialGouv/docker/commit/f072b930c7e5db61caea8991436adf73d4ef0169))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.6.0 ([#705](https://github.com/SocialGouv/docker/issues/705)) ([5fb2155](https://github.com/SocialGouv/docker/commit/5fb215559b69a73ecfd2351062fa0e64ffc37eae))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.7.0 ([#804](https://github.com/SocialGouv/docker/issues/804)) ([9e5fe94](https://github.com/SocialGouv/docker/commit/9e5fe949ccada4798905af4e7d41b5804c3fdfd6))
* **deps:** update ghcr.io/hadolint/hadolint docker tag to v2.8.0 ([#893](https://github.com/SocialGouv/docker/issues/893)) ([38d6f60](https://github.com/SocialGouv/docker/commit/38d6f6021de41ff02a508e092ab3b7502a96e9e4))
* **deps:** update hadolint/hadolint docker tag to v1.18.0 ([#312](https://github.com/SocialGouv/docker/issues/312)) ([a77a0bc](https://github.com/SocialGouv/docker/commit/a77a0bc5138ded9f2efeb4403ac233b844ba7a12))
* **deps:** update hadolint/hadolint docker tag to v1.23.0 ([#566](https://github.com/SocialGouv/docker/issues/566)) ([acd6329](https://github.com/SocialGouv/docker/commit/acd6329e5a24186c566b57c642c1ac1490cbc3b8))
* **deps:** update hadolint/hadolint docker tag to v1.23.0 ([#614](https://github.com/SocialGouv/docker/issues/614)) ([9c84026](https://github.com/SocialGouv/docker/commit/9c84026f5445ac7504985c85741db2bb4920a266))
* **deps:** update hadolint/hadolint docker tag to v2 ([#617](https://github.com/SocialGouv/docker/issues/617)) ([c065987](https://github.com/SocialGouv/docker/commit/c0659873949b0d8cb703eee31cc9404db8aef7f3))
* **deps:** update nginx docker tag to v1.18 ([#220](https://github.com/SocialGouv/docker/issues/220)) ([1b82cfe](https://github.com/SocialGouv/docker/commit/1b82cfe0ee4b816ff45186e4abb34296a027f6e3))
* **deps:** update nginx docker tag to v1.19 ([#301](https://github.com/SocialGouv/docker/issues/301)) ([41763d0](https://github.com/SocialGouv/docker/commit/41763d04c6a1837555f386ec1d9ae93591e02940))
* **deps:** update nginx docker tag to v1.20 ([#616](https://github.com/SocialGouv/docker/issues/616)) ([0303d48](https://github.com/SocialGouv/docker/commit/0303d48c6178889d9500d6ed502701b53404791d))
* **deps:** update nginx docker tag to v1.21 ([#665](https://github.com/SocialGouv/docker/issues/665)) ([5f13390](https://github.com/SocialGouv/docker/commit/5f13390332f0c58309ab21ad6acb7599c91d8a96))
* **nginx4spa:** add spa nginx image ([#33](https://github.com/SocialGouv/docker/issues/33)) ([1bfd078](https://github.com/SocialGouv/docker/commit/1bfd078938823f924d7289653ce75a210de46cde))
* **nginx4spa:** configurable PORT ([#61](https://github.com/SocialGouv/docker/issues/61)) ([476fe97](https://github.com/SocialGouv/docker/commit/476fe97e5b56de81a1a3d8d031754e99938387f7))
* **nginx:** nginx image ([#765](https://github.com/SocialGouv/docker/issues/765)) ([3516776](https://github.com/SocialGouv/docker/commit/351677647cca56914350cf57d641ac2f605faef8))
* **nginx:** Use unpriviledged docker images ([#956](https://github.com/SocialGouv/docker/issues/956)) ([764247c](https://github.com/SocialGouv/docker/commit/764247c6acf7ea4abeef423e8119b890ea1a35b7))
* use partial pin to master version glob ([#55](https://github.com/SocialGouv/docker/issues/55)) ([28e9317](https://github.com/SocialGouv/docker/commit/28e9317d0d538c33d8ff5aac4cada653d7afd9a0))


### Performance Improvements

* **nginx4spa:** restrict envsub files type ([#521](https://github.com/SocialGouv/docker/issues/521)) ([1e41998](https://github.com/SocialGouv/docker/commit/1e419982079e43118f3601ecf131f9b764b620d2))


### BREAKING CHANGES

* **nginx:** port needs to be changed in projects using these images





## [7.6.2-alpha.22](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.21...nginx4spa@7.6.2-alpha.22) (2023-05-16)


### Bug Fixes

* clean test wget output ([857a18f](https://github.com/SocialGouv/docker/commit/857a18f98735dcb9249c3b5dcb228eff46e4e5bb))





## [7.6.2-alpha.21](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.20...nginx4spa@7.6.2-alpha.21) (2023-05-16)


### Bug Fixes

* wip ([c2f2dd4](https://github.com/SocialGouv/docker/commit/c2f2dd443dd465d58c974e33010011466159f2f0))





## [7.6.2-alpha.20](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.19...nginx4spa@7.6.2-alpha.20) (2023-05-16)


### Bug Fixes

* wip ([cdb0476](https://github.com/SocialGouv/docker/commit/cdb0476aed082f3e5fcc1fd6cd69a45df38fcfcf))
* wip ([c83c8d8](https://github.com/SocialGouv/docker/commit/c83c8d818eab38ddce0266c7d8feb77e68d9d6ba))





## [7.6.2-alpha.19](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.18...nginx4spa@7.6.2-alpha.19) (2023-05-16)


### Bug Fixes

* wip ([4c533f0](https://github.com/SocialGouv/docker/commit/4c533f0156fab9f2ad0da0cfc0fe9ed9e1da8591))





## [7.6.2-alpha.18](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.17...nginx4spa@7.6.2-alpha.18) (2023-05-16)


### Bug Fixes

* wip ([ef35385](https://github.com/SocialGouv/docker/commit/ef353850d4aee1b37cb3035991967d3b6cfd2031))





## [7.6.2-alpha.17](https://github.com/SocialGouv/docker/compare/nginx4spa@7.6.2-alpha.16...nginx4spa@7.6.2-alpha.17) (2023-05-16)


### Bug Fixes

* wip ([896ce79](https://github.com/SocialGouv/docker/commit/896ce7988eba5b9e15083eb9deb7503d2990ac90))
