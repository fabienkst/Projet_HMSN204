#!/usr/bin/env python3

from Bio import SeqIO
from Bio import Entrez

import ssl
ssl._create_default_https_context = ssl._create_unverified_context
import requests, os, sys

print ('donner le numéro d_accession du gène mutant voulu')
print ('note: le mutant pgm a pour numéro AB010074')
gene=""
recherche=""
gene=input()
recherche=gene+"[Accession] AND Arabidopsis thaliana[orgn]"

Entrez.email = "quentin.bouvier01@etu.umontpellier.fr"
maseq = Entrez.esearch(db="nucleotide", term = recherche, retmax = 10)
monres = Entrez.read(maseq)
print(monres["Count"])
print(monres["IdList"])
maseq.close()

list_id = monres["IdList"]
fichierseq = Entrez.efetch(db="nucleotide", id=list_id, rettype = "gb")
messeq = SeqIO.parse(fichierseq, "gb")

SeqIO.write(messeq,"out_mutant.fasta", "fasta")

fichierseq.close()
