#!/bin/bash



for f in ../Bee_vids/2022_06_20_vids/*.h; do
	if [ "${f:30:1}" = "." ]
	then
           echo "$f"
	   echo "${f:0:47}"
	   python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/photoExtract.py "$f" "${f:0:47}"
	else
	   echo "$f"
           echo "${f:0:45}"
	   python /mnt/c/Users/lqmey/OneDrive/Desktop/Bee_Visit_Count/photoExtract.py "$f" "${f:0:45}"
	fi
done
echo 'saved'
