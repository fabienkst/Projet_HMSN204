#!/usr/bin/env python3

from Bio.Seq import Seq
from Bio import SeqIO
import numpy as np


#################################declaration########################################

maSeq = SeqIO.read('out_2.fasta',"fasta")
maSeq2 = SeqIO.read('out_mutant.fasta',"fasta")

seq1=maSeq
seq2=maSeq2
n=len(seq1)
p=len(seq2)

ligne=0
column=0
g=3
s=3
t=0



############################const matrice##################################

matrice=np.zeros((n+1,p+1))

while ligne in range(0,p+1):
	matrice[0,ligne]=g*ligne
	ligne+=1
while column in range(0,n+1):
	matrice[column,0]=g*column
	column+=1

ligne=1
column=1



##################################remplissage###############################

for column in range(1,n+1):
	for ligne in range (1,p+1):
		if seq1[column-1]==seq2[ligne-1]:
			matrice[column,ligne]+=min(matrice[column-1,ligne-1]+t,matrice[column-1,ligne]+g,matrice[column,ligne-1]+g)
		else :
			matrice[column,ligne]+=min(matrice[column-1,ligne-1]+s,matrice[column-1,ligne]+g,matrice[column,ligne-1]+g)	
		ligne+=1
	column+=1
print (matrice)




print ('____________________________________'+'\n'+'Backtracking'+'\n'+'____________________________________'+'\n')


#############################init##################################

backseq1=""
sep=""
backseq2=""
column=n-1
ligne=p-1
backseq1+=seq1[column]
sep+='|'
backseq2+=seq2[ligne]



############################prendre l'alignement sens inverse##################################

while column in range(1,n) or ligne in range (1,p):
	if matrice[column-1,ligne-1]==min(matrice[column-1,ligne-1],matrice[column-1,ligne],matrice[column,ligne-1]):
		backseq1+=seq1[column-1]
		backseq2+=seq2[ligne-1]	
		column=column-1
		ligne=ligne-1
		if seq2[ligne]==seq1[column]:
			sep+='|'
		else : sep+=' '			
	else:
		if matrice[column-1,ligne]==min(matrice[column-1,ligne-1],matrice[column-1,ligne],matrice[column,ligne-1]):
			backseq1+=seq1[column-1]
			backseq2+='-'	
			column=column-1
			if seq2[ligne]==seq1[column]:
				sep+='|'
			else : sep+=' '	
		else:
			if matrice[column,ligne-1]==min(matrice[column-1,ligne-1],matrice[column-1,ligne],matrice[column,ligne-1]):
				backseq1+='-'
				backseq2+=seq2[ligne-1]	
				ligne=ligne-1
				if seq2[ligne]==seq1[column]:
					sep+='|'
				else : sep+=' '	


		######################################donner le bon alignement#################################"

r1=len(backseq1)
r2=len(backseq2)
finalseq1=""
finalseq2=""
finalsep=""


if r1==r2:
	finalseq1+=backseq1[::-1]
	finalsep+=sep[::-1]
	finalseq2+=backseq2[::-1]


exportseq=""

decoupseq1=""
decoupsep=""
decoupseq2=""
decoupseq1=finalseq1[0:79]
decoupsep=finalsep[0:79]
decoupseq2=finalseq2[0:79]
rest1=""
restsep=""
rest2=""
rest1=finalseq1[79:r1-80]
restsep=finalsep[79:r1-80]
rest2=finalseq2[79:r1-80]

i=1
while i in range(r1-80):
	decoupseq1=rest1[0:79]
	decoupsep=restsep[0:79]
	decoupseq2=rest2[0:79]
	i=i+80
	rest1=rest1[79:r1-80]
	restsep=restsep[79:r1-80]
	rest2=rest2[79:r1-80]
	exportseq+=decoupseq1+'\n'+decoupsep+'\n'+decoupseq2+'\n'+'\n'
	
print (exportseq)

alignSeq = open("./alignement_sequences",'w')
alignSeq.write(exportseq)
		
		



























			

