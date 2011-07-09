#!/bin/sh
rm *.thumb.png
for f in `ls *.png`
do
   thumbname=`echo $f | sed 's/.png/.thumb.png/'`
   echo "$f -> $thumbname"
   convert $f -resize 150x150 $thumbname
done
