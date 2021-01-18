# FROM alpine:edge
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/puppeteer:3.1.0

USER root

# Installs latest Chromium (77) package.
# RUN apk add --no-cache \
#   chromium=~86 \
#   nss=~3 \
#   freetype=~2 \
#   freetype-dev=~2 \
#   harfbuzz=~2 \
#   ca-certificates=~20191127 \
#   ttf-freefont=~20120503 \
#   nodejs=~14 \
#   yarn=~1 \
#   npm=~14 \
#   curl=~7

# RUN apk add --no-cache mongodb-tools=~4
RUN apk add --no-cache mongodb-tools=~4 \
  npm=~14 \
  curl=~7

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ postgresql=10.12-r0

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Add user so we don't need --no-sandbox.
# RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
#     && mkdir -p /home/pptruser/Downloads /app \
#     && chown -R pptruser:pptruser /home/pptruser \
#     && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser
