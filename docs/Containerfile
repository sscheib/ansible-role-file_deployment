FROM docker.io/ruby:3.3.4-alpine3.20@sha256:9fc2d9dd146a47fddcf2b69e3174d92ee1a654fbbe73f97b858505394748ac6e

#
# package definitions
#

# renovate: datasource=repology depName=alpine_3_20/build-base versioning=loose
ENV BUILD_BASE_VERSION="0.5-r3"

# renovate: datasource=repology depName=alpine_3_20/dumb-init versioning=loose
ENV DUMB_INIT_VERSION="1.2.5-r3"

# renovate: datasource=repology depName=alpine_3_20/zlib-dev versioning=loose
ENV ZLIB_DEV_VERSION="1.3.1-r1"

# renovate: datasource=rubygems depName=bundler
ENV BUNDLER_VERSION="2.5.17"

LABEL org.opencontainers.image.authors="Steffen Scheib <steffen@scheib.me>"
LABEL org.opencontainers.image.base.name="docker.io/ruby"
LABEL org.opencontainers.image.description="Build documentation using Jekyll"
LABEL org.opencontainers.image.documentation="https://file-deployment.ansible-role.scheib.me"
LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
LABEL org.opencontainers.image.title="jekyll-build"
LABEL org.opencontainers.image.url="https://github.com/sscheib/ansible-role-file_deployment"
LABEL org.opencontainers.image.vendor="Steffen Scheib <steffen@scheib.me>"


ENV SETUPDIR="/setup"
COPY "Gemfile"* "${SETUPDIR}/"
WORKDIR "${SETUPDIR}"

# install build dependencies
RUN set -eux; \
    apk add --no-cache --virtual build-deps \
      build-base="${BUILD_BASE_VERSION}" \
      zlib-dev="${ZLIB_DEV_VERSION}" \
    ;

# install dumb-init
RUN set -eux; \
    apk add --no-cache \
      dumb-init="${DUMB_INIT_VERSION}" \
    ;

# install bundler
RUN set -eux; \
    gem install bundler -v "${BUNDLER_VERSION}"

# install gems defined in the Gemfile
RUN set -eux; \
    bundler install

# remove build dependencies
RUN set -eux; \
    apk del --no-cache build-deps

# clean up
RUN set -eux; \
    rm -rf \
      "${SETUPDIR}" \
      /usr/gem/cache \
#      /root/.bundle/cache \
    ;

WORKDIR "/srv/jekyll"
EXPOSE 4000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bundler", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
