

file = open('/home/song/results/readwrite.txt','r')

lines= file.readlines()
read=[]
write=[]
for string in lines :
	readwrite = string.split()
	read.append(float(readwrite[0]))
	write.append(float(readwrite[1]))



avg1 = sum(read)/len(read)
avg2 = sum(write)/len(write)
print(avg1)
print(avg2)
