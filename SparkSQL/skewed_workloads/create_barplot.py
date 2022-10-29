import numpy as np
import matplotlib.pyplot as plt
from scipy.stats.mstats import gmean
import matplotlib

matplotlib.use("pgf")
matplotlib.rcParams.update({
    "pgf.texsystem": "pdflatex",
    'font.family': 'serif',
    'text.usetex': True,
    'pgf.rcfonts': False,
})


# width of the bars
barWidth = 0.25

SparkSQL_WIM_FT = []
for t in ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22']:
    f=open('WIM+FT/TPCHQueriesExecTimes.txt',"r")
    lines=f.readlines()

    x=0
    query_times = 0
    for i in lines:
            if "Q"+t+"\t" in i and x==3:
                    seconds = float(i.split("Q"+t+"\t")[1])
                    query_times = query_times + seconds
            if "Q"+t+"\t" in i and x!=3:
                    x=x+1

    SparkSQL_WIM_FT.append(round(query_times/7.0,3))




SparkSQL_WIN_MEM = []

for t in ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22']:
    f=open('WIN+MEM/TPCHQueriesExecTimes.txt',"r")
    lines=f.readlines()

    x=0
    query_times = 0
    for i in lines:
            if "Q"+t+"\t" in i and x==3:
                    seconds = float(i.split("Q"+t+"\t")[1])
                    query_times = query_times + seconds
            if "Q"+t+"\t" in i and x!=3:
                    x=x+1

    SparkSQL_WIN_MEM.append(round(query_times/7.0,3))

speed_query_WIN=[]

for i in range(len(SparkSQL_WIM_FT)):
        speed_query_WIN.append(SparkSQL_WIM_FT[i]/SparkSQL_WIN_MEM[i])

# The x position of bars
r1 = np.arange(len(speed_query_WIN))
r2 = [x + barWidth for x in r1]
r3 = [x + barWidth*2 for x in r1]
r4 = [x + barWidth*3 for x in r1]


plt.rc('text', usetex=True)

plt.figure(figsize=(7,4))

# Create bars
plt.bar(r1, speed_query_WIN, width = barWidth, color = 'tomato', edgecolor = 'red', label='SparkSQL', fill=True, hatch='+')

plt.axhline(1, color='black',ls='--')

plt.ylim(ymin=0)
# general layout
plt.xticks([r + barWidth for r in range(len(speed_query_WIN))], ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '16', '17', '18', '19', '20', '21', '22'])
plt.xticks(fontfamily='sans-serif',fontweight='medium',fontsize=15,rotation=0)
plt.yticks([0,2,4,6,8,10],['0','2','4','6','8','10'],fontfamily='sans-serif',fontweight='medium',fontsize=16)
plt.ylabel('Speedup',fontfamily='sans-serif',fontweight='medium',fontsize=16)

plt.savefig('SparkSQL_skewed_workflows.pdf',bbox_inches='tight',dpi=6000,backend='pgf')



