FROM nginxinc/nginx-unprivileged:1.25-alpine@sha256:b7e3ed3f269c3cc87e04349a53183b4694fef3fa38666abe17a750432e846eb9

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
