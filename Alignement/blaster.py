#!/usr/bin/env python3

from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

allhsp=[]
final0=[]
final1=[]

maSeq = SeqIO.read('out_2.fasta',"fasta")
blastSeq=maSeq
blastresult = NCBIWWW.qblast('blastn','nt',blastSeq.format('fasta'))
	
blast_record = NCBIXML.read(blastresult)
list_hsp=list(blast_record.descriptions)
final0.append(list_hsp[0].title)
#final.append(list_hsp[0].score)
#final.append(list_hsp[0].evalue)

final1.append(list_hsp[1].title)
#final.append(list_hsp[1].score)
#final.append(list_hsp[1].evalue)

blastresult.close()
print ('meilleur alignement (attention, il s_agit surement de la même séquence)')
print(final0)
print ('\n'+'deuxième meilleur alignement')
print(final1)
print ('done')

