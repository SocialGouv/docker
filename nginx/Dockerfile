FROM nginxinc/nginx-unprivileged:1.25-alpine@sha256:bddf6a61f1b8609652c60f77fbe011e0465547e58bd9c1e771a1662c94d87126

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
