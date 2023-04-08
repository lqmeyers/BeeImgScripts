import sys 
import os 
import shutil
import random
import cv2


"""
takes in a file that has color coded masks, and a label mask.txt file
and splits it into seperate files using labels in second file
"""

#maskFile = '/home/lqmeyers/CVAT/babyBees3perID/Pascal_VOC_1.1/SegmentationObject/f22x2022_06_28.mp4.track000067.frame004960.png'
#labelFile = '/home/lqmeyers/CVAT/babyBees3perID/Pascal_VOC_1.1/labelmap.txt'
maskFile = sys.argv[1]
labelFile = sys.argv[2]

sys.stdout = open(1,'w')

def getPath(file):
    '''uses a path string to get just the directoy of a file'''
    strOut = ''
    i = 1
    while file[-i] != '/':
        i = i + 1
        #print(file[-i])
    strOut = file[0:len(file)-(i-1)]
    return strOut

def getName(file):
    '''uses a path string to get the name of a file'''
    strOut = ''
    i = 1
    while file[-i] != '/':
        i = i + 1
        #print(file[-i])
    strOut = file[-(i-1):]
    return strOut


def parseLabels(file):
    '''a program to parse a labelmap.txt file'''
    keydict = {}
    with open(file) as f:
        data = f.read()
        for l in data.splitlines():
            #print(l)
            if l[0] != '#':
                key = ''
                colList = []
                for i in range(len(l)):
                    if l[i] == ':':
                        colList.append(i)
                l[colList[0]+1:colList[1]]
                keydict[l[0:colList[0]]] = l[colList[0]+1:colList[1]]
    return(keydict)       
               


def parseMasks(file,keys):
    """
    takes in a multicolor mask file, and seperates it into 
    seperate images based on colors and labels of labelmap file
    
    Parameters:
    file (str): a string of path to image.

    Returns:
    saves files at path.label.png 
    """
    img = cv2.imread(file)
    #print(file)
    for label in keys.keys():
        if label != "Wings":
            color = (keys[label])
            clist = []
            num = ''
            for l in color:
                if l != ',':
                    num = num + l 
                else:
                    clist.append(int(num))
                    num = ''
            clist.append(int(num))
            mask = cv2.inRange(img,tuple(clist),tuple(clist))
            cv2.imwrite( file[:-3]+label+".png",mask)
        

keydict = parseLabels(labelFile)
parseMasks(maskFile,keydict)

        

        

