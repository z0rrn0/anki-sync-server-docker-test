FROM docker.io/library/alpine:latest

ARG TARGETOS
ARG TARGETARCH

COPY --chmod=755 target/anki-sync-server-$TARGETOS-$(echo $TARGETARCH | tr '/' '-')/anki-sync-server /usr/local/bin/anki-sync-server

ENV \
    # stores data in /config (VOLUME for persistence)
    SYNC_BASE="/config" \
    # set default port
    SYNC_PORT="27701"

# don't forget to set at least SYNC_USER1
CMD [ "/usr/local/bin/anki-sync-server" ]
