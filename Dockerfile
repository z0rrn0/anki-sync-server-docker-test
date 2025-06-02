FROM docker.io/library/alpine:latest

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

# For linux/arm64 and all others $TARGETVARIANT is empty but for linux/arm/v7 it is v7
COPY --chmod=755 target/anki-sync-server-$TARGETOS-$TARGETARCH$TARGETVARIANT/anki-sync-server /usr/local/bin/anki-sync-server

ENV \
    # Stores data in /config (VOLUME for persistence)
    SYNC_BASE="/config" \
    # Set default port
    SYNC_PORT="27701"

# Don't forget to set at least SYNC_USER1
CMD [ "/usr/local/bin/anki-sync-server" ]
