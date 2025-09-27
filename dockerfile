FROM alpine:latest

RUN apk add --no-cache curl cronie tini

# Copy crontab and fix permissions
COPY crontab.txt /etc/crontabs/root
RUN chmod 0644 /etc/crontabs/root && chown root:root /etc/crontabs/root

# tini becomes PID 1
ENTRYPOINT ["/sbin/tini", "--"]

# Run cron in foreground
CMD ["crond", "-n", "-s"]
