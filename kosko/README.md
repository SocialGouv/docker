# Kosko

> [Kosko](https://github.com/tommy351/kosko) image

## Usage

### Docker

```sh
$ docker run --rm ghcr.io/socialgouv/docker/kosko kosko --version
```

### Gitlab

```yaml
Deploy:
  stage: Deploy
  dependencies: []
  image: ghcr.io/socialgouv/docker/kosko
  script:
    - kosko generate --env prod | kubectl apply -f -
```
