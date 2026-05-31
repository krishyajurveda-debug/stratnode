#Narasimham Devarakonda
FROM quay.io/keycloak/keycloak:latest

# Bake the DB type into the build
ENV KC_DB=postgres

# Build the optimized Keycloak instance
RUN /opt/keycloak/bin/kc.sh build

# Add --http-enabled=true and --proxy-headers=xforwarded
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-enabled=true", "--proxy-headers=xforwarded", "--hostname-strict=false"]
