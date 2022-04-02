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


if [ -f OUTPUT_FILE ]; 
then
	speedtest --progress=no --format=csv >> OUTPUT_FILE
else
	speedtest --progress=no --output-header --format=csv >> OUTPUT_FILE
fi


