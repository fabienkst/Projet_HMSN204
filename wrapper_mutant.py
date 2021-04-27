#!/usr/bin/env python3

from Bio import SeqIO
from Bio import Entrez

import ssl
ssl._create_default_https_context = ssl._create_unverified_context
import requests, os, sys

os.system("clear")



Entrez.email = "quentin.bouvier01@etu.umontpellier.fr"
#maseq = Entrez.esearch(db="protein", term = "PGM[gene] AND Arabidopsis thaliana[orgn]", retmax = 10)
maseq = Entrez.esearch(db="nucleotide", term = "AB010074[Accession] AND Arabidopsis thaliana[orgn] AND MIO24[all fields]", retmax = 10)
monres = Entrez.read(maseq)
print(monres["Count"])
print(monres["IdList"])
maseq.close()

list_id = monres["IdList"]
fichierseq = Entrez.efetch(db="nucleotide", id=list_id, rettype = "gb")
messeq = SeqIO.parse(fichierseq, "gb")

SeqIO.write(messeq,"out_mutant.fasta", "fasta")

fichierseq.close()

