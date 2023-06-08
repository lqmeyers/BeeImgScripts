#!/bin/bash/

#run this script in the local dir of images to be copied
#this means doing it both for baby bees and flowerpatch

#alter the target paths, filename modifications, and lens based on target dirs.
#remember to adjust start int of path slicing for len dif of testing vs training (currently 47 vs 48)
sum=0
for f in ~/paintDetect/data/images/testing/*; do
	if [[ -f "./${f:47:-4}.png" ]]; then
		echo "File ./${f:47:-4}.png exists. Performing action..."
	# Perform your action here
	cp ./${f:47:-4}.png /home/lqmeyers/paintDetect/data/full_masks/testing/${f:47:-4}.png
	sum=$((sum+1))
	else
		echo "File ./${f:47:-4}.png not found. Skipping action."
	fi
done
echo "Number of matches = "$sum
