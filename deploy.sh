#!/bin/sh

last_modify="0"

while true; do
	new_modify=`stat -c %Y projector/index.html`
	echo "I see a modification time of $new_modify, last I saw was $last_modify"
	if [ "$new_modify" -gt "$last_modify" ]; then
		echo "We're gonna deploy now!"
		url=`now-win --public`
		now-win alias $url calcubeclub
	fi
	last_modify=$new_modify
	sleep 1
done
