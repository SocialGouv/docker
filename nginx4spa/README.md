# NGINX for SPA

> Nginx image for single page application

- Serve static files from `/usr/share/nginx/html`
- Catch-all routing to `/index.html` for single-page-applications with client-side routing
- Add some security-related headers :

```
add_header X-Frame-Options "deny";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";
```

> For regular nginx image, see [../nginx](../nginx)

Notes:

- `PORT` is set to `8080`.

To override default configuration, make a local copy of `nginx.conf` and add it to docker build:

```dockerfile
FROM ghcr.io/socialgouv/docker/nginx4spa:x.y.z

COPY ./custom-nginx.conf /etc/nginx/nginx.conf
COPY ./dist /usr/share/nginx/html
```

**Note**: follow security recommendations here: <https://socialgouv.github.io/support/#/securite>


## kubernetes integration with zero-downtime

```yaml
spec:
  containers:
  - name: my-app
    image: ghcr.io/socialgouv/docker/nginx
    ports:
    - containerPort: 8080
    livenessProbe:
      httpGet:
        path: /live
        port: 8080
    readinessProbe:
      httpGet:
        path: /ready
        port: 8080
    lifecycle:
      preStop:
        exec:
          command: ["/pre-stop.sh"]
```
