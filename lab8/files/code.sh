#!/bin/bash


mkdir -p ./jpegFolder
mkdir -p ./pngFolder
mkdir -p ./mp3Folder
mkdir -p ./txtFolder


for file in *; do
  if test -f "$file"; then

        echo "$file"
        x="$(xxd "$file" | head -c 30)"


        png_mc="00000000: 8950 4e47 0d0a 1a0a "
        mp3_mc="00000000: 4944 3303 0000 0000 "
        jpeg_mc="00000000: ffd8 ffe0 0010 4a46 "
        asci_tx_mc="00000000: 7879 7a             "


        if [ "$x" == "$png_mc" ]; then
	   cp "$file" ./pngFolder
           echo "it is png file, and it is copied to pngFolder"
           echo "${png_mc}"
        elif [ "$x" == "$mp3_mc" ]; then
	   cp "$file" ./mp3Folder
	   echo "it is mp3 file, and it is copied to mp3Folder"
	   echo "${mp3_mc}"
        elif [ "$x" == "$jpeg_mc" ]; then
	   cp "$file" ./jpegFolder
           echo "it is jpeg file, and it is copied to jpegFolder"
	   echo "${jpg_mc}"
        elif [ "$x" == "$asci_tx_mc" ]; then
	   cp "$file" ./txtFolder
           echo "it is  ascii text/plain file, and it is copied to txtFolder"
           echo "${asci_tx_mc}"
	fi


        echo "${x}"
        echo -e "\n"


  fi
done
exit
