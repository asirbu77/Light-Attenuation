import re
infile = open("2_C_Data_Lab2_Kate.txt", "r")
outfile = open("2_C_Data_Lab2_CSV_convertible_Kate", "w")
line = infile.readline()
timeList = []
voltageList = []
while line != "":
    splitInput = re.split(':| -> ', line)
    timeList.append(splitInput[2])
    voltageList.append(splitInput[3])
    line = infile.readline()
infile.close()
for i in range(0, len(timeList)-1):
    outfile.write(timeList[i])
    outfile.write("\n")
for i in range(0, len(voltageList)-1):
    outfile.write(voltageList[i])
outfile.close()
