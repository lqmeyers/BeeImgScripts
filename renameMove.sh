#!/bin/bash
int=0
for f in ./*.jpg; do
	cp $f ~/CNN_dev/paintTestData/unet/data/beePaint/train/image/$int.png;
	int=$((int+1))
done
