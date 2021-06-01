FROM bash
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION
ARG USER_EMAIL="jack.crosnier@w6d.io"
ARG USER_NAME="Jack CROSNIER"
LABEL maintainer="${USER_NAME} <${USER_EMAIL}>" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/w6d-io/docker-bash" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION

ENV DESIRED_VERSION $DESIRED_VERSION
RUN echo y | apk add --no-cache curl git
COPY scripts/* /usr/local/bin/