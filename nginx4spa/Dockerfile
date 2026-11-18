FROM ghcr.io/nginx/nginx-unprivileged:1.30.7-alpine@sha256:0c53a1f2890c3526bfd201440f0fd3970e5b78f80630f58284aad0d34b5ec7bd

COPY ./nginx.conf ./ready_response.conf /etc/nginx/
COPY ./entrypoint.sh ./pre-stop.sh /

USER 0
RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
  chown -R nginx:nginx /var/cache/nginx && \
  chown -R nginx:nginx /var/log/nginx && \
  chown -R nginx:nginx /etc/nginx

RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid

USER 101

ENTRYPOINT ["/entrypoint.sh"]
