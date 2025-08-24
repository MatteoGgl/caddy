FROM caddy:2-alpine-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/hetzner \
    --with github.com/lucaslorentz/caddy-docker-proxy

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
