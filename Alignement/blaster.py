#!/usr/bin/env python3

from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

allhsp=[]
final=[]

maSeq = SeqIO.read('out_2.fasta',"fasta")
blastSeq=maSeq
blastresult = NCBIWWW.qblast('blastn','nt',blastSeq.format('fasta'))
	
blast_record = NCBIXML.read(blastresult)
list_hsp=list(blast_record.descriptions)
final.append(list_hsp[0].title)
final.append(list_hsp[0].score)
final.append(list_hsp[0].evalue)
print('hello')

blastresult.close()
print(final)
print ('done')

