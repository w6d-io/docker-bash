FROM alpine:3.13
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

RUN apk update
RUN apk add vim wget curl git build-base
RUN apk add bash gawk sed grep bc coreutils
RUN apk add --update nodejs nodejs-npm
RUN apk add --update npm
RUN apk add py3-pip
RUN pip3 install --no-cache --upgrade pip setuptools
# run the entrypoint (only when the image is instantiated into a container)
ENTRYPOINT ["/bin/bash", "-c"]
