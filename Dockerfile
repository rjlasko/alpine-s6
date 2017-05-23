FROM alpine:latest
MAINTAINER rjlasko

ENV S6_OVERLAY_RELEASE "v1.19.1.1"

COPY build.sh /tmp/

RUN /bin/sh /tmp/build.sh && rm -rf /tmp/*

ENTRYPOINT ["/init"]