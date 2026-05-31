FROM quay.io/keycloak/keycloak:latest

ENV KC_DB=postgres
RUN /opt/keycloak/bin/kc.sh build

# Add this to your ENTRYPOINT
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", \
            "--import-realm", \
            "--http-enabled=true", \
            "--proxy-headers=xforwarded", \
            "--hostname-strict=false", \
            "--cache=local"]
