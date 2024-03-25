FROM nginxinc/nginx-unprivileged:1.25-alpine@sha256:7c1d415090a45370177a2c35283e8fc99c557c9cdcddc66d53ce6610a7eb9827

COPY ./nginx.conf ./ready_response.conf /etc/nginx/
COPY ./entrypoint.sh ./pre-stop.sh /
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
