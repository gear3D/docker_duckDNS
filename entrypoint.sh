#!/bin/sh
# Fail early if variables not set
: "${DUCKDNS_DOMAIN:?Need to set DUCKDNS_DOMAIN}"
: "${DUCKDNS_TOKEN:?Need to set DUCKDNS_TOKEN}"

# Run DuckDNS update once at container start
echo "$(date): (startup) $(curl -s "https://www.duckdns.org/update?domains=$DUCKDNS_DOMAIN&token=$DUCKDNS_TOKEN&ip=")"

# Start cron in foreground
exec crond -n -s
