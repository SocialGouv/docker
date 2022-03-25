# NGINX

> Nginx image for static web apps

- Serve static files from `/usr/share/nginx/html`
- Add some security-related headers :

```
add_header X-Frame-Options "deny";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";
```

> For a single-page-applications nginx image, see [../nginx4spa](../nginx4spa)


Notes:

- `PORT` is optional and default to `8080`

To override default configuration, make a local copy of `nginx.conf` and add it to docker build:

```dockerfile
FROM ghcr.io/socialgouv/docker/nginx:x.y.z

COPY ./custom-nginx.conf /etc/nginx/nginx.conf
COPY ./dist /usr/share/nginx/html
```

**Note**: follow security recommendations here: <https://socialgouv.github.io/support/#/securite>
