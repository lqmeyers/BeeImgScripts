#!/bin/bash
#set -x

eval "$(conda shell.bash hook)"
conda activate sleap
echo 'sleap enabled'


for f in ../Bee_vids/2022_06_28_vids/f*.mp4; do
	echo "$f"
	sleap-track $f \
		-m ../models/230205_235215.centroid.n=266 \
		-m ../models/230205_235215.centroid.n=266/230205_235215.centered_instance \
		--tracking.tracker simple \ 
	sleap-convert --format analysis -o "${f:0:${#f}}.predictions.analysis.h5.h" "$f.predictions.slp"
	python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/photoExtract.py "$f.predictions.analysis.h5.h" "$f"
done

