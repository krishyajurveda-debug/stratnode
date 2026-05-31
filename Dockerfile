FROM quay.io/keycloak/keycloak:latest

ENV KC_DB=postgres

# Only use RUN for commands that must happen DURING the build
RUN /opt/keycloak/bin/kc.sh build

# ENTRYPOINT is for commands that happen WHEN THE CONTAINER STARTS
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-enabled=true", "--proxy-headers=xforwarded", "--hostname-strict=false", "--cache=local"]
