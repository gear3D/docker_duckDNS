FROM alpine:latest

RUN apk add --no-cache curl cronie tini

# Copy crontab and fix permissions
COPY crontab.txt /etc/crontabs/root
RUN chmod 0644 /etc/crontabs/root && chown root:root /etc/crontabs/root

# tini becomes PID 1
ENTRYPOINT ["/sbin/tini", "--"]

# Run DuckDNS update once, then start cron in foreground
CMD sh -c 'echo "$(date): (startup) $(curl -s "https://www.duckdns.org/update?domains=YOUR_DOMAIN&token=YOUR_TOKEN&ip=")" && crond -n -s'
