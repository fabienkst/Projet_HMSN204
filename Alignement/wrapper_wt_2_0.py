#!/usr/bin/env python3

from Bio import SeqIO
from Bio import Entrez

import ssl
ssl._create_default_https_context = ssl._create_unverified_context
import requests, os, sys

#os.system("clear")

print ('donner l_acronyme en majuscule du gène voulu')
gene=""
recherche=""
gene=input()
recherche=gene+"[gene name] AND Arabidopsis thaliana[orgn] AND biomol_mrna[prop] AND phosphoglucomutase[title] AND srcdb_refseq[prop]"

Entrez.email = "quentin.bouvier01@etu.umontpellier.fr"
#maseq = Entrez.esearch(db="protein", term = "PGM[gene] AND Arabidopsis thaliana[orgn]", retmax = 10)
maseq = Entrez.esearch(db="nucleotide", term = recherche, retmax = 10)
monres = Entrez.read(maseq)
print(monres["Count"])
print(monres["IdList"])
maseq.close()

list_id = monres["IdList"]
fichierseq = Entrez.efetch(db="nucleotide", id=list_id, rettype = "gb")
messeq = SeqIO.parse(fichierseq, "gb")

SeqIO.write(messeq,"out_2.fasta", "fasta")

fichierseq.close()

