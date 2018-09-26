#!/bin/sh
set -e

echo "Initializing folders..."
mkdir -p ${LOG_DIR}
chmod -R 755 ${LOG_DIR}
mkdir -p ${CACHE_DIR}

echo "Initializing cache..."
$(which squid) -N -f /etc/squid/squid.conf -z

echo "Starting squid..."
exec $(which squid) -f /etc/squid/squid.conf -NYCd 1 ${EXTRA_ARGS}
