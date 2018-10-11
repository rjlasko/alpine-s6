FROM alpine:3.8
MAINTAINER rjlasko

ENV S6_OVERLAY_VERSION "1.21.7.0"

COPY fsroot /
RUN /bin/sh /tmp/build.sh && \
	rm -rf /tmp/*

ENTRYPOINT ["/init"]