ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.5
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION

LABEL io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Daniel Mesa <support@wiredoor.net>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Wiredoor" \
    org.opencontainers.image.authors="Daniel Mesa <support@wiredoor.net>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://www.wiredoor.net" \
    org.opencontainers.image.source="https://github.com/wiredoor/home-assistant-wiredoor-addon" \
    org.opencontainers.image.documentation="https://github.com/wiredoor/home-assistant-wiredoor-addon/blob/main/README.md" \
    org.opencontainers.image.version=${BUILD_VERSION}

COPY run.sh /

RUN apk add --update curl jq iptables wireguard-tools tcpdump dnsmasq iproute2 \
  && ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf \
  && chmod a+x /run.sh \
  && curl -s https://www.wiredoor.net/install-wiredoor-cli.sh | sh

CMD [ "/run.sh" ]
