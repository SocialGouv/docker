## [0.11.2](https://github.com/SocialGouv/docker/compare/v0.11.1...v0.11.2) (2019-11-07)


### Bug Fixes

* **kubectl:** update bash ([cea4553](https://github.com/SocialGouv/docker/commit/cea4553391ca69f3e80a4b671804af7326776d1a))

## [0.11.1](https://github.com/SocialGouv/docker/compare/v0.11.0...v0.11.1) (2019-10-30)


### Bug Fixes

* **helm:** add missing helm dependencies ([a67ae2b](https://github.com/SocialGouv/docker/commit/a67ae2bcedab7e466eb73ff6debe43c50d6ceb4e))

# [0.11.0](https://github.com/SocialGouv/docker/compare/v0.10.0...v0.11.0) (2019-10-30)


### Features

* **helm:** allow sudo ([106f7d4](https://github.com/SocialGouv/docker/commit/106f7d4be86bdb63c4925d23e6f5c548d2867e5f))

# [0.10.0](https://github.com/SocialGouv/docker/compare/v0.9.1...v0.10.0) (2019-10-30)


### Features

* **helm:** add su-exec ([fe736c5](https://github.com/SocialGouv/docker/commit/fe736c52347b9318569c71a8df8eeefcc1df10ff))

## [0.9.1](https://github.com/SocialGouv/docker/compare/v0.9.0...v0.9.1) (2019-10-28)


### Bug Fixes

* **gitlab:** add missing curl gitlab config in man gitlab file ([f58d073](https://github.com/SocialGouv/docker/commit/f58d073fae706f29ae0896ae36ce27650efbf534))

# [0.9.0](https://github.com/SocialGouv/docker/compare/v0.8.1...v0.9.0) (2019-10-28)


### Features

* **curl:** update curl image ([86caf1a](https://github.com/SocialGouv/docker/commit/86caf1aa9824a4671b18fd855ca17b9689ad7f3d))

## [0.8.1](https://github.com/SocialGouv/docker/compare/v0.8.0...v0.8.1) (2019-10-23)


### Reverts

* chore(deps): update alpine/helm docker tag to v2.15.0 ([#17](https://github.com/SocialGouv/docker/issues/17)) ([8459d2d](https://github.com/SocialGouv/docker/commit/8459d2d76b4975c864b483e0ec8044adf603f681))
* ci(gitlab): run jobs based on modified files ([a9e51c7](https://github.com/SocialGouv/docker/commit/a9e51c74e94a8e1a4832fd7bda4f38eb04cf3274))

# [0.8.0](https://github.com/SocialGouv/docker/compare/v0.7.2...v0.8.0) (2019-10-23)


### Features

* **helm:** update to kubctl 1.16.2 ([5c88253](https://github.com/SocialGouv/docker/commit/5c88253f7af6fc595b6a9f792f38bdb92df70abc))

## [0.7.2](https://github.com/SocialGouv/docker/compare/v0.7.1...v0.7.2) (2019-09-25)


### Bug Fixes

* **k8s-ns-killer:** change git branch exist check ([#15](https://github.com/SocialGouv/docker/issues/15)) ([e5da3d8](https://github.com/SocialGouv/docker/commit/e5da3d8))

## [0.7.1](https://github.com/SocialGouv/docker/compare/v0.7.0...v0.7.1) (2019-09-18)


### Bug Fixes

* **k8s-ns-killer:** test branch on remotes/origin ([eb3520d](https://github.com/SocialGouv/docker/commit/eb3520d))

# [0.7.0](https://github.com/SocialGouv/docker/compare/v0.6.0...v0.7.0) (2019-09-17)


### Features

* **kubectl:** add to depoly process ([db4131c](https://github.com/SocialGouv/docker/commit/db4131c))

# [0.6.0](https://github.com/SocialGouv/docker/compare/v0.5.2...v0.6.0) (2019-09-17)


### Features

* **kubectl:** update kubectl version to 1.15.3 ([5e8c071](https://github.com/SocialGouv/docker/commit/5e8c071))

## [0.5.2](https://github.com/SocialGouv/docker/compare/v0.5.1...v0.5.2) (2019-09-13)


### Bug Fixes

* **k8s-ns-killer:** check branch exists before the kill ([ef0b0ae](https://github.com/SocialGouv/docker/commit/ef0b0ae))

## [0.5.1](https://github.com/SocialGouv/docker/compare/v0.5.0...v0.5.1) (2019-09-13)


### Bug Fixes

* **k8s-ns-killer:** correctly check if the branch exists before k… ([#10](https://github.com/SocialGouv/docker/issues/10)) ([2b67bb6](https://github.com/SocialGouv/docker/commit/2b67bb6))

# [0.5.0](https://github.com/SocialGouv/docker/compare/v0.4.0...v0.5.0) (2019-09-12)


### Features

* **k8s-ns-killer:** add k8s-ns-killer image ([#8](https://github.com/SocialGouv/docker/issues/8)) ([2dd3cbd](https://github.com/SocialGouv/docker/commit/2dd3cbd))
* **k8s-ns-killer:** pass namespaces as script args ([9118b29](https://github.com/SocialGouv/docker/commit/9118b29))

# [0.4.0](https://github.com/SocialGouv/docker/compare/v0.3.0...v0.4.0) (2019-09-12)


### Features

* **helm:** update kubectl version in the image ([96480a1](https://github.com/SocialGouv/docker/commit/96480a1))

# [0.3.0](https://github.com/SocialGouv/docker/compare/v0.2.3...v0.3.0) (2019-09-06)


### Bug Fixes

* **publish:** allow publish to github registry to fail ([99bd3d7](https://github.com/SocialGouv/docker/commit/99bd3d7))


### Features

* **helm:** add to release process ([#7](https://github.com/SocialGouv/docker/issues/7)) ([5a4ee6f](https://github.com/SocialGouv/docker/commit/5a4ee6f))

## [0.2.3](https://github.com/SocialGouv/docker/compare/v0.2.2...v0.2.3) (2019-09-05)


### Bug Fixes

* **publish:** explicit tag from local image ([9ea5ea3](https://github.com/SocialGouv/docker/commit/9ea5ea3))

## [0.2.2](https://github.com/SocialGouv/docker/compare/v0.2.1...v0.2.2) (2019-09-05)


### Bug Fixes

* **publish:** explicit image name ([a736d53](https://github.com/SocialGouv/docker/commit/a736d53))

## [0.2.1](https://github.com/SocialGouv/docker/compare/v0.2.0...v0.2.1) (2019-09-05)


### Bug Fixes

* **publish:** explicit github registry ([d815f28](https://github.com/SocialGouv/docker/commit/d815f28))

# [0.2.0](https://github.com/SocialGouv/docker/compare/v0.1.0...v0.2.0) (2019-09-05)


### Features

* add github registry publish ([0371032](https://github.com/SocialGouv/docker/commit/0371032))
