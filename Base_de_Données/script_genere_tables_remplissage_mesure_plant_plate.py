#!/usr/bin/env python3


import sys


if len(sys.argv) <=1 :#On vérifie qu'on a bien un paramètre.
	print("\t####################################")
	print("\tUn fichier au format csv est attendu en argument")
	print("\t####################################")
else:
	file = open(sys.argv[1], 'r')
	table_plant = open("table_plant.csv", 'w')
	table_mesure = open("table_mesure.csv", 'w')
	table_plate = open("table_plate.csv", 'w')
	file.readline()
	list_id_plate=list()
	for ligne in file.readlines():
		data=ligne.split(";")
		id_plate=data[0]+"-"+data[1]+"-"+data[2]
		if id_plate not in list_id_plate:
			list_id_plate.append(id_plate)
		table_plant.write(data[3]+";"+data[8]+";"+data[9]+";"+id_plate+";"+data[0]+";"+"\n")
		for i in [4,5,6,7,10,11]:
			table_mesure.write(str(i)+";"+data[3]+";"+data[i]+"\n")
		table_mesure.write(str(12)+";"+data[3]+";"+data[12])
	for id in list_id_plate:
		id_milieu=id.split("-")[1]
		table_plate.write(id+";"+id_milieu+"\n")
	file.close()
	table_plant.close()
	table_mesure.close()
	table_plate.close()
