#!/bin/bash

# uses the speedtest CLI to run a test and either create or append to a csv file
# if no path is specified on the command line, use a file in the current dir.

OUTPUT_FILE=""

if [ -z "$1" ]
then
    OUTPUT_FILE="speedtests.csv"
else 
	OUTPUT_FILE="$1"
fi


if [ -f "$OUTPUT_FILE" ]; 
then
	speedtest --progress=no --format=csv >> "$OUTPUT_FILE"
else
	speedtest --progress=no --output-header --format=csv >> "$OUTPUT_FILE.tmp"
	# add date header to end of first line and set that new content as the file content
	#https://stackoverflow.com/questions/26958327/bash-script-append-text-to-first-line-of-a-file#26958397
	sed '1 s/$/,date/' "$OUTPUT_FILE.tmp" > "$OUTPUT_FILE"

	rm "$OUTPUT_FILE.tmp"

fi

# remove the last newline
# https://superuser.com/questions/1332947/append-to-end-to-line-without-newline
truncate -s-1 "$OUTPUT_FILE"


# add the current timestamp	to the end
# https://timestamp.online/article/how-to-get-current-timestamp-in-bash

echo ",\"$(date +"%s")\"" >> "$OUTPUT_FILE"

