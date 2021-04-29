#!/usr/bin/env python3

import sys

for f in sys.argv[1:len(sys.argv)]:
	file = open(f, 'r')
	name =f.split(".")[0]
	log = open(name+".log", 'w')
	out = open(name+".out", 'w')
	todo = open(name+".todo", 'w')
	ok=0
	obsolete=0
	strange=0
	data=file.readline().split(",")
	nbColObs=-1
	nbColLig=0
	for i in range(len(data)):
		log.write(str(i)+" : "+data[i]+"\n")
		if data[i]== "Obsolete":
			nbColObs=i
	if i==-1:
		log.write("Erreur pas de colonne obsolete dans le fichier"+name+"\n")
		exit(1)
	out.write(data[0]+";"+data[3]+";"+data[47]+";"+data[71]+"\n")
	for ligne in file.readlines():
		data=ligne.split(",")
		nbColLig+=len(data)
		if len(data)>nbColObs:
			valColObs=data[nbColObs]
			if valColObs=="true":
				#log.write(ligne)
				obsolete+=1
			elif valColObs=="false":
				out.write(data[0]+";"+data[3]+";"+data[47]+";"+data[71]+"\n")
				ok+=1
			else :
				#log.write(ligne)
				strange+=1
			if "TODO" in data[3]:
					todo.write(data[3]+"\n")
		else :
			#log.write(ligne)
			strange+=1
	log.write("Nombre de ligne gardées : "+str(ok)+"\nNombre ligne obsolètes : "+str(obsolete)+"\nNombre ligne bizarre :"+str(strange)+"\n")
	log.write("Nombre moyen de colonnes par ligne : "+str(nbColLig/(ok+obsolete+strange))+"\n")
	file.close()
	log.close()
	out.close()