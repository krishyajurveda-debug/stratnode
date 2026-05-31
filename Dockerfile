FROM quay.io/keycloak/keycloak:latest

# Bake the DB type into the build so it persists
ENV KC_DB=postgres

# Build the optimized Keycloak instance
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--hostname-strict=false"]
