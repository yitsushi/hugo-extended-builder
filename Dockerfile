FROM alpine:3.8

LABEL maintainer="Balazs Nadasdi <yitsushi@protonmail.ch>"

ENV VERSION "0.46"

RUN apk add --no-cache curl git py-pygments && \
      curl -sL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz \
            -o /tmp/hugo.tar.gz && \
      tar -xzf /tmp/hugo.tar.gz -C /tmp && \
      mv /tmp/hugo /usr/bin/hugo && \
      rm -rf /tmp/* && \
      apk del curl

CMD ["hugo"]
