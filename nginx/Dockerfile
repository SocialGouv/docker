FROM nginxinc/nginx-unprivileged:1.23-alpine@sha256:3b4634121543135d725a307727843f47026344cd2a092b293616b6bc65cf1298

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./404.html /usr/share/nginx/errors/

## adjust permissions
USER root
RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx

RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER 101

ENTRYPOINT ["/entrypoint.sh"]
