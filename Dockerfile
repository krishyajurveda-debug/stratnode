FROM quay.io/keycloak/keycloak:latest
# Only include non-sensitive build logic here
RUN /opt/keycloak/bin/kc.sh build
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--hostname-strict=false"]
