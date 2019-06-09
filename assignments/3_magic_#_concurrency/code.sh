#!/bin/bash

#Create following folders if they don't exist
mkdir -p ./jpegFolder
mkdir -p ./pngFolder
mkdir -p ./mp3Folder
mkdir -p ./txtFolder

#Loops on all of the files and folders in current directory
for file in *; do

  #Works only with files
  if test -f "$file"; then

	#print the name of the file
        echo "$file"

	#Find magic number and assign it to x
        x="$(xxd "$file" | head -c 30)"

	#Some magic numbers for spacific types
        png_mc="00000000: 8950 4e47 0d0a 1a0a "
        mp3_mc="00000000: 4944 3303 0000 0000 "
        jpeg_mc="00000000: ffd8 ffe0 0010 4a46 "
        asci_tx_mc="00000000: 7879 7a             "

	#Is the file .png typed
        if [ "$x" == "$png_mc" ]; then
	   cp "$file" ./pngFolder
           echo "it is png file, and it is copied to pngFolder"
           echo "${png_mc}"
	#Or is the file .mp3 typed
        elif [ "$x" == "$mp3_mc" ]; then
	   cp "$file" ./mp3Folder
	   echo "it is mp3 file, and it is copied to mp3Folder"
	   echo "${mp3_mc}"
	#Or is the file .jpeg typed
        elif [ "$x" == "$jpeg_mc" ]; then
	   cp "$file" ./jpegFolder
           echo "it is jpeg file, and it is copied to jpegFolder"
	   echo "${jpeg_mc}"
	#Or is the file asci .txt typed
        elif [ "$x" == "$asci_tx_mc" ]; then
	   cp "$file" ./txtFolder
           echo "it is  ascii text/plain file, and it is copied to txtFolder"
           echo "${asci_tx_mc}"
	fi

	#Print the magic number of the file
        echo "${x}"
	#new line 
        echo -e "\n"


  fi
done
exit
