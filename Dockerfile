# Stage 1: Build the optimized image
FROM quay.io/keycloak/keycloak:latest AS builder

# Configure database vendor
ENV KC_DB=postgres

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Build the optimized Keycloak instance
RUN /opt/keycloak/bin/kc.sh build

# Stage 2: Create the final production image
FROM quay.io/keycloak/keycloak:latest

# Copy the built configuration from the builder stage
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Set the entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--hostname-strict=false"]
