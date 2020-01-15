FROM alpine:3.11.2

LABEL maintainer="James Wang <jw@slickage.com>"

RUN apk add --update
RUN apk add --virtual .asdf-deps --no-cache bash curl file git patch tzdata vim wget

# note: default tz is Pacific/Honolulu
# run again in application Dockerfile to change default tz
RUN cp /usr/share/zoneinfo/Pacific/Honolulu /etc/localtime

SHELL ["/bin/bash", "-l", "-c"]
RUN adduser -s /bin/bash -h /app -D app
ENV PATH="${PATH}:/app/.asdf/shims:/app/.asdf/bin"
COPY .profile /app/.profile
COPY .bashrc /app/.bashrc
RUN chown app:app /app/.profile
RUN chown app:app /app/.bashrc

USER app
WORKDIR /app

RUN git clone --depth 1 --branch v0.7.6 https://github.com/asdf-vm/asdf $HOME/.asdf
