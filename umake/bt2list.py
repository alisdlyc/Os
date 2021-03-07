import sys

btfile = open(sys.argv[1], "rt")
listfile = open(sys.argv[2], "wt")
#btfile.readline()
#linelist=btfile.readlines()
#linelist.reverse()
for line in btfile.readlines():
    line = line.replace("\n", "")
    line = line.replace('"',"'")
    line = line.replace('\\',"-")
    line = line.replace('%','-')
    if line[-1]!=')':
        listfile.write('printf "----------------------------------------\\n"\n')
        listfile.write('printf "'+line+'\\n"\n')
    linelist = line.split(' ')  
    if linelist[-1]!="()" and linelist[-1]!="stack?)":
        listfile.write('list '+linelist[-1]+'\n')
btfile.close()
listfile.close()