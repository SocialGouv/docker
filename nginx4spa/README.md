# NGINX for SPA

> Nginx image for single page application

- Serve static files from `/usr/share/nginx/html`
- Catch-all routing to `/index.html` for single-page-applications with client-side routing
- envsubst `%%VARIABLE%%` static files at startup (ex: builds)
- Add some security-related headers :

```
add_header X-Frame-Options "deny";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";
```

> For regular nginx image, see [../nginx](../nginx)

## Envsubst on startup

As default, in every files in the `/usr/share/nginx/html` directory, the [`envsub.sh`](./envsub.sh) script replaces `%%KEY%%` by `VALUE` where `export KEY=VALUE` in the global env var.

You can disable this by setting the `SKIP_ENVSUBST` environment variable.

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
