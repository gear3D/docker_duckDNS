#!/bin/sh
# Run DuckDNS update once at startup
echo "$(date): (startup) $(curl -s "https://www.duckdns.org/update?domains=$DUCKDNS_DOMAIN&token=$DUCKDNS_TOKEN&ip=")"

# Start cron in foreground
exec crond -n -s
