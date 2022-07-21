#!/usr/bin/env bash

###
# Pulled from: https://gist.github.com/clj/c8a3d74ae99e53792512f05f01832037
###

if [ -z "${1+set}" ]; then
  echo "Pass path to the inkscape command as first argument"
  exit 1
fi
if [ -z "${2+set}" ]; then
  echo "Pass svg file as second argument"
  exit 1
fi
if [ -z "${3+set}" ]; then
  echo "Pass output name (w/o .icns) as third argument"
  exit 1
fi

inkscape=$1
svg_file=$2
output_name=$3

set -e
mkdir $output_name.iconset
$inkscape -o "$PWD/$output_name.iconset/icon_16x16.png"      -w   16 -h   16 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_16x16@2x.png"   -w   32 -h   32 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_32x32.png"      -w   32 -h   32 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_32x32@2x.png"   -w   64 -h   64 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_128x128.png"    -w  128 -h  128 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_128x128@2x.png" -w  256 -h  256 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_256x256.png"    -w  256 -h  256 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_256x256@2x.png" -w  512 -h  512 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_512x512.png"    -w  512 -h  512 "$PWD/$svg_file"
$inkscape -o "$PWD/$output_name.iconset/icon_512x512@2x.png" -w 1024 -h 1024 "$PWD/$svg_file"
iconutil -c icns "$output_name.iconset"
rm -R "$output_name.iconset"
