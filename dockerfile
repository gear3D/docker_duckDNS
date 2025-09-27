FROM alpine:latest

# Install curl, cronie (better cron) and tini
RUN apk add --no-cache curl cronie tini

# Add crontab
COPY crontab.txt /etc/crontabs/root

# tini becomes PID 1, so crond doesn’t complain
ENTRYPOINT ["/sbin/tini", "--"]

# Run crond in foreground, send logs to stderr
CMD ["crond", "-n", "-s", "-x", "sch"]
