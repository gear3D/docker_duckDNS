FROM alpine:latest
RUN apk add --no-cache curl cronie tini

COPY crontab.txt /etc/crontabs/root
RUN chmod 0644 /etc/crontabs/root && chown root:root /etc/crontabs/root

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]
