FROM nginx:1.17-alpine

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./envsub.sh /envsub.sh

ENTRYPOINT ["/entrypoint.sh"]
