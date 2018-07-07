#!/bin/bash

# print usage

echo 'This script read the paths in <list_file> and move them to <destination_dir> '
echo 'while maintaining the path structure in list_file'
echo ''
echo 'Usage: ./mv_file_in_list.sh <list_file_path> <destination_dir_path>'
echo '' 

# accepting input parameters

LIST_FILE=$1
DEST_DIR=$2

echo "Using List File : $LIST_FILE"
echo "Using Dest Dir : $DEST_DIR"

# initializing ... 

echo "Initializing ... " 


NUM_PATHS=$(wc -l "$LIST_FILE" | cut -d ' ' -f 1)

echo "Number of paths in List File : $NUM_PATHS"

echo "Ininialization completes."

# working ... 

index=1
while read path ; do
	echo "Working on $index of $NUM_PATHS : $path ... "
	dir_path=$(dirname $path)
	file_name=$(basename $path)
	# debug echos
	#echo "Dir path : $dir_path"
	#echo "File name : $file_name"

	# making sure destination dir exists
	mkdir -p "$DEST_DIR/$dir_path"

	# moving ... 
	mv $path "$DEST_DIR/$dir_path/"

	index=$(($index+1))
done < $LIST_FILE

