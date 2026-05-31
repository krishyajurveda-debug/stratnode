FROM quay.io/keycloak/keycloak:latest

# Build the optimized Keycloak instance
RUN /opt/keycloak/bin/kc.sh build

# Set the entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--hostname-strict=false"]
