FROM ubuntu
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
RUN apt update
RUN apt -y install git && git --version
RUN apt -y install curl
RUN apt -y install wget
RUN apt -y install tar
RUN wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/local
RUN ls /usr/local
RUN ls /usr/local/go
RUN echo $PATH
ENV PATH="${PATH}:/usr/local/go/bin"
RUN echo $PATH
RUN ls -la ~/
RUN /bin/bash -c "source ~/.profile"
RUN go version