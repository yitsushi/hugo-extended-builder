FROM alpine:3.13

LABEL maintainer="Balazs Nadasdi <efertone@pm.me>"

ENV VERSION "0.83.1"

RUN apk add --no-cache curl git py-pygments libc6-compat libstdc++ && \
      curl -sL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz \
            -o /tmp/hugo.tar.gz && \
      tar -xzf /tmp/hugo.tar.gz -C /tmp && \
      mv /tmp/hugo /usr/bin/hugo && \
      rm -rf /tmp/* && \
      apk del curl

CMD ["hugo"]
