import json 
import re 
import numpy as np 
import matplotlib.pyplot as plt 
import seaborn as sns  

#read in the dictionary from the massive file 
mydict = json.load(open("ConcatDiffs.json")) 

#filter out zero values 
mydict = {k: v for k, v in mydict.items() if v != [0,0]}  

#plot a specific culture, where 'culture' is a string of the form \d\d, \d\d indicating which biculture it is. 
#For instance, culture='78' means we want to plot 78. 
def plotBiculture(culture):
    regex = re.compile("^"+culture+"NODE")
    newDict = {}     
    for k,v in mydict.items():
        found = regex.findall(k)
        if found:
            newDict[k] = v
            
        data = {"x": [], "y": [], "label": []}
        for label, coord in newDict.items():
            data["x"].append(coord[0])
            data["y"].append(coord[1])
            data["label"].append(label)
            
        data['x'] = np.array(data['x'])
        data['y'] = np.array(data['y'])
                
        sns.jointplot(x=data['x'], y=data['y'], kind='hex')
        plt.ylabel('y')
        plt.xlabel('x')
        plt.show()      
                
    # the variation heatplot from plt. I'm VERY VERY skeptical of this package because     
    # it gives the same exact results for all samples. ??????????? don't use this shit.      

    # heatmap, xedges, yedges = np.histogram2d(data['x'], data['x'], bins=50)
    # extent = [xedges[0], xedges[-1], yedges[0], yedges[-1]]
    #     
    # plt.clf()
    # plt.imshow(heatmap.T, extent=extent)
    # plt.show()  
    
plotBiculture("45")
