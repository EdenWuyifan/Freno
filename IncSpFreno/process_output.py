import os, json, argparse

parser = argparse.ArgumentParser(description='argparse')
parser.add_argument('--database', '-d', help='database name', required=True)
parser.add_argument('--partition', '-p', type=int, help='num of workers', required=True)
parser.add_argument('--interval', '-i', help='interval', required=True)
args = parser.parse_args()

method = "distIncFreno"
dataset = args.database
partition = args.partition
interval = args.interval


#read nohup
res = {1:[0,0,0,0,0,0,0],11:[0,0,0,0,0,0,0],21:[0,0,0,0,0,0,0],31:[0,0,0,0,0,0,0],41:[0,0,0,0,0,0,0],51:[0,0,0,0,0,0,0]}
f = open("nohup.out", "r")
line = f.readline()


flag = 0
inner_loop = 0
sup = 1
remain = 0
incDir = "./incdatasets/interval_{0}_{1}".format(dataset,interval)
incLen = len(os.listdir(incDir))

while line:
    #print(line[37:39])
    if line[37:40] == "Job" and line[-2] == "s":
        print(line)
        if not flag:
            pos = line.find("took")
            res[sup][remain] += float(line[pos+5:len(line)-2])
        else:
            pos = line.find("took")
            res[sup][remain] += float(line[pos+5:len(line)-2])
            inner_loop += 1 
        
        flag = abs(1-flag)
        #print(res)
    line = f.readline()
    if remain == 7:
        remain = 0
        sup += 10
    if inner_loop == incLen:
        inner_loop = 0
        remain += 1
f.close()

print(res)
        

#save times
sv = []
for v in res.values():
    sv.append(",".join([str(k) for k in v])+"\n")

f = open("output_{0}_{1}_{2}_{3}.txt".format(method, dataset,interval,partition), "w")
f.writelines(sv)
f.close()


