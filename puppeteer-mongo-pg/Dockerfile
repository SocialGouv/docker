FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/puppeteer:4.1.0

USER root

RUN apk add --no-cache mongodb-tools=~4 \
  npm=~14 \
  curl=~7

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ postgresql=10.12-r0

USER pptruser
