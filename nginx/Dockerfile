FROM nginxinc/nginx-unprivileged:1.25-alpine@sha256:8265b1df5a89cc1a0a067e472bf47aca7cee52f0561c98a0dff91312dcdd8adb

COPY ./nginx.conf ./ready_response.conf /etc/nginx/
COPY ./entrypoint.sh ./pre-stop.sh /
COPY ./404.html /usr/share/nginx/errors/
COPY ./50x.html /usr/share/nginx/errors/

USER root
RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
  chown -R nginx:nginx /var/cache/nginx && \
  chown -R nginx:nginx /var/log/nginx && \
  chown -R nginx:nginx /etc/nginx

RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid

USER 101


ENTRYPOINT ["/entrypoint.sh"]
