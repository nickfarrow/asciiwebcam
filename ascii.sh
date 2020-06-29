#! /bin/bash
trap 'kill $BGPID; exit' INT

#-q:v 1
ffmpeg -loglevel warning -y -f video4linux2 -i /dev/video0 -update 1 -r 10/1 test.bmp &
BGPID=$!

while true; do
	printf "\033c"
	convert test.bmp test.jpg
	( sleep 0.4 & jp2a --background=light -f -i test.jpg; wait )
done
sleep 1000
