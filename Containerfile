# kics-scan disable=6b376af8-cfe8-49ab-a08d-f32de23661a4 - WORKDIR Path Not Absolute
FROM docker.io/ruby:3.3.4-alpine3.20@sha256:9fc2d9dd146a47fddcf2b69e3174d92ee1a654fbbe73f97b858505394748ac6e

#
# build arguments
#

ARG USERNAME="jekyll"
ARG GROUPNAME="jekyll"
ARG UID="1000"
ARG GID="1000"
ARG JEKYLL_WORKDIR="/srv/jekyll"

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

# create user and group
RUN set -eux; \
    addgroup \
      --gid "${GID}" \
      --system \
      "${GROUPNAME}" \
    && \
    adduser \
      --home "${JEKYLL_WORKDIR}" \
      --ingroup "${GROUPNAME}" \
      --system \
      --uid "${UID}" \
      "${USERNAME}"

# prepare workdir
COPY "Gemfile"* "${JEKYLL_WORKDIR}/"
RUN chown "${USERNAME}":"${GROUPNAME}" "${JEKYLL_WORKDIR}/Gemfile"*

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

USER "${USERNAME}"
WORKDIR "${JEKYLL_WORKDIR}"

# install bundler
RUN set -eux; \
    gem install bundler -v "${BUNDLER_VERSION}"

# install gems defined in the Gemfile
RUN set -eux; \
    bundler install

# remove build dependencies
USER "root"
RUN set -eux; \
    apk del --no-cache build-deps

# clean up
RUN set -eux; \
    rm -rf \
      /usr/gem/cache \
      "${JEKYLL_WORKDIR}/.bundle/cache" \
      "${JEKYLL_WORKDIR}/.cache" \
      "${JEKYLL_WORKDIR}/Gemfile"* \
    ;

# ensure files are owned by the correct user and group
RUN chown -R "${USERNAME}":"${GROUPNAME}" "${JEKYLL_WORKDIR}"

USER "${USERNAME}"
WORKDIR "${JEKYLL_WORKDIR}"
EXPOSE 4000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bundler", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
