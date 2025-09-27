FROM alpine:latest

# Install curl and cron
RUN apk add --no-cache curl cronie

# Copy crontab
COPY crontab.txt /etc/crontabs/root

# Run cron in foreground
CMD ["crond", "-f", "-l", "2", "-d", "8"]
