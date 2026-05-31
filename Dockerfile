FROM quay.io/keycloak/keycloak:latest

ENV KC_DB=postgres
RUN /opt/keycloak/bin/kc.sh build

# IMPORTANT: Remove any extra flags here if you are using environment variables to control it
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-enabled=true", "--proxy-headers=xforwarded", "--hostname-strict=false"]
