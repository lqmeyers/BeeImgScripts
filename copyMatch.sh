\#!/bin/bash/

sum=0
for f in ~/paintDetect/data/images/training/*; do
	if [[ -f "./${f:48:-4}.pl.Thorax.png" ]]; then
		echo "File ./${f:48:-4}.pl.png exists. Performing action..."
	# Perform your action here
	cp ./${f:48:-4}.pl.Thorax.png /home/lqmeyers/paintDetect/data/thorax_only_masks/training/${f:48:-4}.Thorax.png
	sum=$((sum+1))
	else
		echo "File ./${f:48:-4}.png not found. Skipping action."
	fi
done
echo "Number of matches = "$sum
