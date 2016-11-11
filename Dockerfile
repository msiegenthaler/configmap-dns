FROM alpine:3.4

RUN apk --update add bind

RUN mkdir -m 0755 -p /var/run/named && chown -R root:named /var/run/named
RUN mkdir -m 0755 -p /var/cache/bind && touch /var/cache/bind/docker-init && \
    chown -R named:named /var/cache/bind

# Add Tini
ENV TINI_VERSION v0.13.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

COPY run.sh /
CMD ["/run.sh"]

VOLUME ["/etc/bind"]
VOLUME ["/var/cache/bind"]

EXPOSE 53