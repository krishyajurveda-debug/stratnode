FROM quay.io/keycloak/keycloak:latest

ENV KC_DB=postgres
/opt/keycloak/bin/kc.sh export --dir /tmp --realm YOUR_REALM_NAME

# Add this to your ENTRYPOINT
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", \
            "--import-realm", \
            "--http-enabled=true", \
            "--proxy-headers=xforwarded", \
            "--hostname-strict=false", \
            "--cache=local"]
