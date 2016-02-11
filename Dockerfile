FROM alpine:3.3
MAINTAINER Mike Clarke <michaelclarkecs@gmail.com>

RUN addgroup www && adduser -G www -s /bin/ash -D www
RUN apk add --update lighttpd && rm -rf /var/cache/apk/*
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME ["/data"]

EXPOSE 80

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
