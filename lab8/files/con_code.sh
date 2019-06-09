#!/bin/bash

#create following directories if they don't exist
mkdir -p ./jpegFolder
mkdir -p ./pngFolder
mkdir -p ./mp3Folder
mkdir -p ./txtFolder


FilesMover(){
	#Loop files and folders in current folder
	for file in *; do

	  #Work only with files
	  if test -f "$file"; then

		

		#find magic number of the file and assign it to x
		x="$(xxd "$file" | head -c 30)"

		#Some magic numbers of spacific types
		png_mc="00000000: 8950 4e47 0d0a 1a0a "
		mp3_mc="00000000: 4944 3303 0000 0000 "
		jpeg_mc="00000000: ffd8 ffe0 0010 4a46 "
		asci_tx_mc="00000000: 7879 7a             "

		if [ "$x" == "$png_mc" ] && [ "$1" == png ] ; then
		   cp "$file" ./pngFolder
		   #print the name of the file
		   echo "$file"
		   echo "it is png file, and it is copied to pngFolder"
		   echo "${png_mc}"
		elif [ "$x" == "$mp3_mc" ] && [ "$1" == mp3 ] ; then
		   cp "$file" ./mp3Folder
		   #print the name of the file
		   echo "$file"
		   echo "it is mp3 file, and it is copied to mp3Folder"
		   echo "${mp3_mc}"
		elif [ "$x" == "$jpeg_mc" ] && [ "$1" == jpeg ] ; then
		   cp "$file" ./jpegFolder
		   #print the name of the file
		   echo "$file"
		   echo "it is jpeg file, and it is copied to jpegFolder"
		   echo "${jpeg_mc}"
		elif [ "$x" == "$asci_tx_mc" ] && [ "$1" == txt ] ; then
		   cp "$file" ./txtFolder
		   #print the name of the file
		   echo "$file"
		   echo "it is  ascii text/plain file, and it is copied to txtFolder"
		   echo "${asci_tx_mc}"
		fi


		#echo "${x}"
		echo -e "\n"


	  fi
	done
}
#Parallel execution by putting them in the background --> &
#Four calls of FilesMover with different arguments (stored in $1)
FilesMover png  &
FilesMover mp3  &
FilesMover jpeg &
FilesMover txt  &
#Wait until finishing all of them
wait
exit

