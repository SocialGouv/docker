# wait-for-http

> Wait for some URL to return 200

## With Docker image

```sh
$ docker run --rm registry.gitlab.factory.social.gouv.fr/socialgouv/docker/wait-for-http:<version> http://my.app
```

| Key               | Value | Usage                                     |
| ----------------- | ----- | ----------------------------------------- |
| WAIT_FOR_RETRIES  | 120   | number of retries                         |
| WAIT_FOR_INTERVAL | 5     | wait between retries (seconds)            |
| WAIT_FOR_URL      |  $1   | url to test, as env var or first argument |
