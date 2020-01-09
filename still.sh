#!/bin/bash

# exists as /home/pi/still.sh
# assumes a big red hdd exists at /mnt/red

set -euo pipefail

# Compute the name of this picture
name="$(date +%Y-%m-%d_%H%M%S).jpg"

# Set the output directory
output="/mnt/red/stormy"

# Exposure mode options :
#   off,auto,night,nightpreview,backlight,spotlight,sports,snow,beach,verylong,fixedfps,antishake,fireworks

# AWB mode options :
#   off,auto,sun,cloud,shade,tungsten,fluorescent,incandescent,flash,horizon,greyworld

# Metering Mode options :
#   average,spot,backlit,matrix

# image sharpness (-100 to 100)
# image contrast (-100 to 100)
# image brightness (0 to 100)
# image saturation (-100 to 100)

file="${output}/${name}"
echo "take new pic into ${file}"

raspistill \
	--output "${file}" \
	--width 2650 \
	--height 1600 \
	--awb auto \
	--quality 100 \
	--rotation 180 \
	--sharpness 20 \
	--contrast 0 \
	--brightness 50 \
	--saturation 0 \
	--exposure auto \
	--metering average \
	--encoding jpg \
	--nopreview

if [ $? -ne 0 ]; then
	echo "failed at taking pic"
	rm -f "${file}"
	exit 1
fi
echo "done."

