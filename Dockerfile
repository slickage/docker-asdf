FROM alpine:3.7

LABEL maintainer="James Wang <jw@slickage.com>"

RUN apk add --update
RUN apk add --virtual .asdf-deps --no-cache bash curl file git tzdata vim wget

SHELL ["/bin/bash", "-l", "-c"]
RUN adduser -s /bin/bash -h /app -D app
ENV PATH="${PATH}:/app/.asdf/shims:/app/.asdf/bin"
USER app
WORKDIR /app

RUN git clone --depth 1 --branch v0.4.0 https://github.com/asdf-vm/asdf $HOME/.asdf
COPY .profile .
COPY .bashrc .
