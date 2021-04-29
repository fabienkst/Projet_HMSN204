##Nombre de plantes dans une boîte 


SELECT IDgen as Genotype, IDmedium as Milieu, plate, count(id) as Nbr
FROM Plant
Group by IDgen,IDmedium,plate ;


##Nombre de plantes en moyenne dans les boîtes


SELECT avg(cnt.c) 
FROM (SELECT count(ID) c FROM Plant Group by IDgen,IDmedium,plate ) cnt;


##Nombre de boîtes par milieu ca marche pas encore


SELECT IDmedium, sum( cnt.c)
FROM Plant, (SELECT count(distinct plate) c FROM Plant Group by IDmedium ) cnt
 Group by IDmedium;
