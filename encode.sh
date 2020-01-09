#!/bin/bash

# A script for encoding a bunch of ordered .jpg files as a DVD format movie.
# This will modify the images in-place, so make sure these are a copy, or you
# do not care about them.
#
# set OUTPUT filename before running

set -euo pipefail

# cleanup old file
rm -f "${OUTPUT}"

ffmpeg \
	-threads 4 \
	-y \
	-pattern_type glob \
	-i '*.jpg' \
	-framerate 24 \
	-c:v libx264 \
	-s 2650x1600 \
	"${OUTPUT}"
