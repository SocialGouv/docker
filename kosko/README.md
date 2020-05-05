# Kosko

> [Kosko](https://github.com/tommy351/kosko) image

## Usage

### Docker

```sh
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:<version> kosko --version
```
### Gitlab

```yaml
Deploy:
  stage: Deploy
  dependencies: []
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:<version>
  script:
    - kosko generate --env prod | kubectl apply -f -
```
