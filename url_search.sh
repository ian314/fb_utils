#!/bin/bash
set -e
# This script performs a search and replace of a code base to replace urls

# CLI
while getopts p:s:r: option
do
 case "${option}"
 in
	p) PTH=${OPTARG};;
	s) SRCH=${OPTARG};;
	r) RPLS=${OPTARG};;
 esac
done

# sanitize forwards slashes
SRCH=$(echo "$SRCH" | sed 's/\//\\\//g')
RPLS=$(echo "$RPLS" | sed 's/\//\\\//g')
echo "################"
echo $PTH
echo $SRCH
echo $RPLS
echo "################"

# search and replace cmd only php files
find $PTH  -type f -name "*.php" -print0 | xargs -0 sed -i '' -e "s/$SRCH/$RPLS/g"

