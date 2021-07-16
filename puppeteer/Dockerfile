FROM alpine:3.14

RUN --mount=type=cache,target=/var/cache/apk \
  apk add --no-cache \
  # renovate: datasource=repology depName=alpine_3_14/ca-certificates versioning=loose
  ca-certificates=="20191127-r5" \
  # renovate: datasource=repology depName=alpine_3_14/chromium versioning=loose
  chromium=="91.0.4472.164-r0" \
  # renovate: datasource=repology depName=alpine_3_14/freetype-dev versioning=loose
  freetype-dev=="2.10.4-r1" \
  # renovate: datasource=repology depName=alpine_3_14/freetype versioning=loose
  freetype=="2.10.4-r1" \
  # renovate: datasource=repology depName=alpine_3_14/harfbuzz versioning=loose
  harfbuzz=="2.8.1-r0" \
  # renovate: datasource=repology depName=alpine_3_14/nodejs versioning=loose
  nodejs=="14.17.1-r0" \
  # renovate: datasource=repology depName=alpine_3_14/nss versioning=loose
  nss=="3.66-r0" \
  # renovate: datasource=repology depName=alpine_3_14/ttf-freefont versioning=loose
  ttf-freefont=="20120503-r1" \
  # renovate: datasource=repology depName=alpine_3_14/yarn versioning=loose
  yarn=="1.22.10-r0"

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
  && mkdir -p /home/pptruser/Downloads /app \
  && chown -R pptruser:pptruser /home/pptruser \
  && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser
