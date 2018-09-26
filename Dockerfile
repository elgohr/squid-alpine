FROM alpine
LABEL maintainer="larsgohr@gmail.com"

ENV CACHE_DIR=/var/spool/squid \
    LOG_DIR=/var/log/squid

RUN apk add --no-cache squid

COPY entrypoint.sh /
EXPOSE 3128/tcp
ENTRYPOINT ["/entrypoint.sh"]
