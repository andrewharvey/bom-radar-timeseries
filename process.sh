#!/bin/sh

mkdir -p radar_PNG24 radar_singleBand
for f in radar/IDR*.png; do
    b=`basename $f .png`
    pct2rgb.py -of PNG -rgba $f radar_PNG24/$b.png
    rgb2pct.py -pct IDR.vrt radar_PNG24/$b.png radar_singleBand/$b.tiff
done

rio polyencode radar_singleBand/* radar_polyencode.tiff
