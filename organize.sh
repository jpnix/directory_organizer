#!/bin/bash

# Matt Permenter
# simple directory organizing script. finds certain file types in a directory and places them in associated directory
# to run this script as a command put file in usr/bin and chmod +x the script
# you could then just type 'organize.sh -d /directory'

#makes directory if it doesnt exist or just ignores command if it does exist
video=(mkdir -p ~/Videos)
music=(mkdir -p ~/Music)
doc=(mkdir -p ~/Documents)
pics=(mkdir -p ~/Pictures)

#this function lists the files and searches for some known filetypes and moves them to the appropriate directory
function organize
{

	for i in $(ls)
	do
    case ${i:(-3)} in
      zip | doc | obi | odt | iso | ocx | .gz | txt | pdf)echo "moving document file -- $doc"; mv $i ~/Documents;;
      jpg | jpeg | png | gif | xcf)echo "moving picture file -- $pics"; mv $i ~/Pictures;;
      mp3)echo "moving music file -- $music"; mv $i ~/Music;;
      mp4 | avi | ogv)echo "moving video file -- $video"; mv $i ~/Videos;;
    esac

	done
}

#this loop takes the appropriate flag and parameter to perform the function on
while getopts ":d:" opt; do
  case $opt in
    d)
      
      echo "Directory chosen was $OPTARG" >&2
      cd $OPTARG; 
      organize 
      ;;
    \?)
      echo "Invalid option -$OPTARG. Choose -d and specify directory to organize: " >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires the -d argument and a valid directory." >&2
      exit 1
      ;;
  esac
done



