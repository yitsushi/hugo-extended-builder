FROM alpine:3.14

LABEL maintainer="Balazs Nadasdi <yitsushi@protonmail.ch>"

ENV VERSION "0.87.0"

RUN apk add --no-cache curl git py-pygments libstdc++ libgcc libc6-compat && \
      curl -sL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz \
            -o /tmp/hugo.tar.gz && \
      tar -xzf /tmp/hugo.tar.gz -C /tmp && \
      mv /tmp/hugo /usr/bin/hugo && \
      chmod +x /usr/bin/hugo && \
      rm -rf /var/cache/apk/* /tmp/*

CMD ["hugo"]
