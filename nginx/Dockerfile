FROM nginx:1.21-alpine

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./envsub.sh /envsub.sh
COPY ./404.html /usr/share/nginx/errors/

ENTRYPOINT ["/entrypoint.sh"]
