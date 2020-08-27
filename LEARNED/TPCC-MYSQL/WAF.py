import numpy as np
import matplotlib.pyplot as plt
# NAND Writes in GiB = Change in Wear Leveling Count (Raw) * Physical Capacity in GiB (256)
# Host Writes in GiB = Change in Total LBAs Written * 512(one sector)
#                                   1024^3

#Write Amplification Factor (WAF) =
#					NAND Writes in GiB
#					Host Writes in GiB

fileLBA = open('/home/song/results/LBA.txt')
LBAlist = fileLBA.readlines()
LBAfloatlist=[]
LBAdiff=[]
for LBA in LBAlist:
	LBAfloatlist.append(float(LBA))
for i in range(1,len(LBAfloatlist)):
	LBAdiff.append(LBAfloatlist[i]-LBAfloatlist[i-1])

HostWrites=[]
for LBA in LBAdiff:
	HostWrites.append(float(LBA*512/pow(1024,3)))
print(HostWrites)


fileWearLeveling = open('/home/song/results/WEAR.txt')
PhysicalCapacity=256
WEARlist = fileWearLeveling.readlines()
WEARfloatlist=[]
WEARdiff=[]
for WEAR in WEARlist:
	WEARfloatlist.append(float(WEAR))
for i in range(1,len(WEARfloatlist)):
	WEARdiff.append(WEARfloatlist[i]-WEARfloatlist[i-1])
NANDwrites=[]
for WEAR in WEARdiff:
	NANDwrites.append(float(WEAR*PhysicalCapacity))
print(NANDwrites)
WAF=[]
if len(NANDwrites)!=len(HostWrites) :
	print("length is not same")
for i in range(len(NANDwrites)) :
	WAF.append(round(NANDwrites[i]/HostWrites[i],3))

print(WAF)

x=np.arange(0,len(WAF))
x=x*10
y=np.float64(WAF)
plt.bar(x,y,width=7.0)
for i,v in enumerate(x):
	plt.text(v,y[i],y[i],fontsize=9,color='black',horizontalalignment='center',verticalalignment='bottom')
plt.savefig('fig1.png', dpi=300)
plt.show()
WAFfile=open("/home/song/results/WAF.txt","w")
for run_WAF in WAF :
	WAFfile.write(str(run_WAF)+"\n")
WAFfile.close()
