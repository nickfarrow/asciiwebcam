#! /bin/bash
#Usage ./j2asc infile.jpg outfile.jpg
trap "kill $BGPID; exit" INT

#-q:v 1
ffmpeg -loglevel warning -y -f video4linux2 -i /dev/video0 -update 1 -r 1/1 test.jpg &
BGPID=$!

while true; do
	#jp2a --width=200 -i test.jpg
	printf "\033c"
	( sleep 0.4 & jp2a --background=light -f -i test.jpg; wait )#--output=test.txt
done

sleep 1000
