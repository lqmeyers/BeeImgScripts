#!/bin/bash/

sum=0
for f in ~/CNN_dev/paintDetect/images/testing/*; do
	if [[ -f "./${f:50:-4}.png" ]]; then
		echo "File ./${f:50:-4}.png exists. Performing action..."
	# Perform your action here
	cp ./${f:50:-4}.Paint.png ~/CNN_dev/paintDetect/masks/testing/${f:50:-4}.Paint.png
	sum=$((sum+1))
	else
		echo "File ./${f:50:-4}.png not found. Skipping action."
	fi
done
echo "Number of matches = "$sum
