#!/bin/bash
wget -O radarmap.gif "https://api.buienradar.nl/image/1.0/RadarMapNL?w=600&h=600"
# clip the edges
convert -crop 320x480+120+0 +repage radarmap.gif radarmap2.gif
# get timer
convert -crop 200x60+0+0 +repage radarmap.gif timer.gif
# combine images
convert radarmap2.gif null: timer.gif -layers Composite radarmap_final.gif
killall gifview
gifview -a --window root radarmap_final.gif &
