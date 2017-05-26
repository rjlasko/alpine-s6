FROM alpine:latest
MAINTAINER rjlasko

ENV S6_OVERLAY_VERSION "1.19.1.1"

COPY fsroot /
RUN /bin/sh /tmp/build.sh && \
	rm -rf /tmp/*

ENTRYPOINT ["/init"]