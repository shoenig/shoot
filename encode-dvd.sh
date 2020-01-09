#!/bin/bash

# A script for encoding a bunch of ordered .jpg files as a DVD format movie.
# This will modify the images in-place, so make sure these are a copy, or you
# do not care about them.
#
# set OUTPUT filename

# todo: maybe set size with -s ?

set -euo pipefail

ffmpeg -threads 4 -y -pattern_type glob -i '*.jpg' -target "film-dvd" -r 24 "${OUTPUT}"
