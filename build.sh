#!/bin/sh
set -ex

# at the time of writing this file, s6-overlay contains the following binaries
# automatically included in all of their releases, with the exception of the
# 'nobin' package.

# ----------------------
# Needed dependency tree
# ----------------------
#	skalibs=2.4.0.2
#		execline=2.2.0.0
#			s6=2.4.0.0
#				s6-rc=0.1.0.0
#				s6-portable-utils=2.1.0.0

# ----------------------
# Unneeded binaries
# ----------------------
#	s6-linux-utils=2.2.0.0
#	s6-dns=2.1.0.0
#	s6-networking=2.2.1.0

# instead of having all install all of these via s6-overlay,
# this script will choose the bare minimum, and allow for more when desired
# this will also get all dependencies.
apk add --update --no-cache s6-rc s6-portable-utils

S6_OVERLAY_RELEASE="v1.19.1.1"

# Pull in the overlay binaries
apk add --update --no-cache curl
curl -L https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_RELEASE}/s6-overlay-nobin.tar.gz | tar zx -C /


# remove all installation-only packages
apk del curl
# and clear the apk cache
rm -rf /var/cache/apk/*