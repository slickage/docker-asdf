FROM slickage/asdf:latest

USER root
# deps
RUN apk add --update
RUN apk add --no-cache \
    build-base \
    nodejs \
    linux-headers \
    libressl-dev \
    readline-dev \
    zlib-dev

USER app

RUN asdf plugin-add ruby
RUN asdf install ruby 2.4.2
RUN asdf global ruby 2.4.2
