FROM quay.io/keycloak/keycloak:latest

ENV KC_DB=postgres
RUN /opt/keycloak/bin/kc.sh build

# Added --optimized and disabled clustering with --cache=dev (or simply omit clustering config)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", \
            "--http-enabled=true", \
            "--proxy-headers=xforwarded", \
            "--hostname-strict=false", \
            "--cache=local"]
