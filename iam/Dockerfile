ARG BASE_VERSION=19.0.3
FROM 10.60.129.132:8890/cmp/keycloak:${BASE_VERSION} as builder

COPY keycloak/cache-ispn-jdbc-ping.xml /opt/keycloak/conf/cache-ispn-jdbc-ping.xml
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres
ENV KC_CACHE_CONFIG_FILE=cache-ispn-jdbc-ping.xml

ARG VIETTELCLOUD_SERVICES_VERSION=0.0.1
RUN curl http://10.60.129.132/repository/raw-repo/cmp/iam/viettelcloud-services-${VIETTELCLOUD_SERVICES_VERSION}-SNAPSHOT.jar \
      -o /opt/keycloak/providers/viettelcloud-services-${VIETTELCLOUD_SERVICES_VERSION}-SNAPSHOT.jar && \
    curl http://10.60.129.132/repository/raw-repo/cmp/iam/keycloak-metrics-spi-2.5.3.jar \
      -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar && \
    /opt/keycloak/bin/kc.sh build \
      --features token-exchange \
      --spi-locale-selector-provider=custom

FROM 10.60.129.132:8890/cmp/keycloak:${BASE_VERSION}
COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY ./keycloak/themes/viettelcloud-v2 /opt/keycloak/themes/viettelcloud-v2
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
