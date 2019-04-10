FROM alpine:3.9.3
LABEL maintainer="larsgohr@gmail.com"

ENV CACHE_DIR=/var/spool/squid \
    LOG_DIR=/var/log/squid

RUN apk add --no-cache squid

RUN mkdir -p ${LOG_DIR} \
  && chmod -R 755 ${LOG_DIR} \
  && chown -R squid ${LOG_DIR} \
  && mkdir -p ${CACHE_DIR} \
  && chmod -R 755 ${LOG_DIR} \
  && chown -R squid ${CACHE_DIR} \
  && echo "pid_filename /var/run/squid/squid.pid" >> /etc/squid/squid.conf

COPY entrypoint.sh /home/squid/entrypoint.sh
EXPOSE 3128/tcp
USER squid
ENTRYPOINT ["/home/squid/entrypoint.sh"]
