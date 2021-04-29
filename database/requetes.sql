##Nombre de plantes dans une boîte 


SELECT IDgen as Genotype, IDmedium as Milieu, plate, count(id) as Nbr
FROM Plant
Group by IDgen,IDmedium,plate ;


##Nombre de plantes en moyenne dans les boîtes


SELECT avg(cnt.c) 
FROM (SELECT count(ID) c FROM Plant Group by IDgen,IDmedium,plate ) cnt;


##Nombre de boîtes par milieu ca marche pas encore


SELECT IDMedium, sum(cnt.c)
FROM Plant 
WHERE (SELECT IDmedium,IDgen, count(distinct plate) c FROM Plant Group by IDmedium,IDgen;) cnt
Group by IDmedium;


SELECT sum(cnt.c)
FROM (SELECT IDmedium,IDgen, count(distinct plate) c FROM Plant Group by IDmedium,IDgen;) cnt
Group by IDmedium;

SELECT IDmedium,IDgen, count(distinct plate)
FROM Plant
Group by IDmedium,IDgen;



SELECT IDmedium, count(distinct plate) c FROM Plant Group by IDmedium,IDgen HAVING IDmedium;

SELECT IDmedium, count(distinct plate) c FROM Plant Group by IDmedium;
