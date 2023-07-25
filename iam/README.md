## Viettel Cloud Identity Management System (based on Keycloak)

### Build and Push image

```
NEXUS_CREDS=username:password bash build.sh
```

### Development mode

Use the docker compose environment inside `aio/` directory to setup the dev environment.

Differences from product environment:
1. Use native keycloak image to run container
1. Mount spi jar files from local filesystem to container
1. Mount custom themes from local filesystem to container (and enable theme caching)
1. Use self-signed certificate

Any changes in SPI's or themes should be reflected immediately in your dev container.
