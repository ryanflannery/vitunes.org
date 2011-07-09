#!/bin/sh

# header logo
convert -size 500x500 xc:transparent -fill "black" -font "mom.ttf" -pointsize 64 -gravity center -stroke none -strokewidth 3 -annotate +0+0 "vitunes" -trim +repage logo.png

# footer logo
convert -size 500x500 xc:transparent -fill "black" -font "mom.ttf" -pointsize 64 -gravity center -stroke none -strokewidth 3 -annotate +0+0 ":q!" -trim +repage end.png

# hr
convert -size 500x500 xc:transparent -fill "black" -font "mom.ttf" -pointsize 24 -gravity center -stroke none -strokewidth 3 -annotate +0+0 ". . . nom nom . . . nom nom . . ." -trim +repage hr.png

# slogan
convert -size 500x500 xc:transparent -fill "black" -font "mom.ttf" -pointsize 18 -gravity center -stroke none -strokewidth 3 -annotate +0+0 "play yer tunes ... without the fluff" -trim +repage slogan.png

