FROM alpine:3.13.5

RUN --mount=type=cache,target=/var/cache/apk \
  apk add --no-cache \
  chromium=~86.0.4240.111-r0 \
  nss=~3.63-r1 \
  freetype=~2.10.4-r1 \
  freetype-dev=~2.10.4-r1 \
  harfbuzz=~2.7.4-r1 \
  ca-certificates=~20191127-r5 \
  ttf-freefont=~20120503-r1 \
  nodejs=~14.16.1-r1 \
  yarn=~1

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
  && mkdir -p /home/pptruser/Downloads /app \
  && chown -R pptruser:pptruser /home/pptruser \
  && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser
