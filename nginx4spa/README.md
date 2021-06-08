# NGINX for SPA

> Nginx image for single page application

As default, in every files in the "/usr/share/nginx/html" directory, the [`envsub.sh`](./envsub.sh) script replaces `%%KEY%%` by `VALUE` where `export KEY=VALUE` in the global env var.

So :

```sh
$ echo "VERSION=%%VERSION%%" > /www/version.txt
$ docker run \
    --env VERSION=x.y.z \
    --env PORT=4444 \
    --name nginx4spa_test \
    --publish 8888:4444 \
    --rm \
    --volume /www:/usr/share/nginx/html \
    ghcr.io/socialgouv/docker/nginx4spa
$ curl localhost:8888/version.txt
VERSION=x.y.z
```

Notes:

- `PORT` is optional and default to `80`

To override default configuration, make a local copy of `nginx.conf` and add it to docker build:

```dockerfile
FROM ghcr.io/socialgouv/docker/nginx4spa:x.y.z

COPY ./custom-nginx.conf /etc/nginx/nginx.conf
COPY ./dist /usr/share/nginx/html
```

**Note**: follow security recommendations here: <https://socialgouv.github.io/support/#/securite>
