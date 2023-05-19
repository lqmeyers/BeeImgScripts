import sys 
import os 
import shutil
import random

sourceFolder = sys.argv[2]
sinkFolder = sys.argv[3]
num = sys.argv[1]
num  = int(num)
sys.stdout = open(1,'w')

#path = "../Bee_imgs/2023_02_07_imgs/Multicolor/"
path = sourceFolder
#target = "../Bee_imgs/2023_02_07_imgs/CVAT_sample/"
target = sinkFolder
dir_list = os.walk(path)

folders = []

#--------for nested folders, picking from within them, uncomment below:
"""
for root, dirs, files in dir_list:
    #print(root)
    for d in dirs:
        folders.append(d)
    #for f in files: print(f)
    

#print(folders)

for f in folders: 
    #print(path+f+r'/')
    all_files = (os.listdir(path+f+r'/'))
    chosen = random.sample(all_files,k=num)
    #print(chosen)
    for fi in chosen: 
        #print(path+f+r'/'+fi)
        #print(target+fi)
        shutil.copy(path+f+r'/'+fi,target+fi)
"""



#----------for only selecting from a single non-nested folder, use below:
for root, dirs, files in dir_list:
	all_files = (os.listdir(path+r'/'))
	chosen = random.sample(all_files,k=num)
	print(chosen)
	print(len(chosen))
	for fi in chosen:
		print("copying "+str(path+fi)+" to "+str(target+fi))
		shutil.move(path+fi,target)
		#print(path+fi)
		#print(target+fi)
