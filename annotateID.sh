#!/bin/bash

cd ../Bee_imgs/
python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/initAnnJSON.py
cd -
for f in ../Bee_imgs/*.jpg; do
	echo "$f"
	python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/photoDisplay.py "$f"
	read -rsn1 input
	python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/annotateJSON.py "$f" "$input"
#	xdotool key q
	echo "$f assigned identity $input"
done

