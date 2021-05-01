##Nombre de plantes dans une boîte 


SELECT IDplate, count(id) as Nbr 
FROM Plant 
Group by IDplate 


##Nombre de plantes en moyenne dans les boîtes


SELECT avg(cnt.c) as Moyenne
FROM (SELECT IDplate, count(id) c FROM Plant Group by IDplate ) cnt;


##Nombre de boîtes par milieu 


SELECT IDmedium as Milieu ,count(distinct  IDplate) as Nbr 
FROM Plant, Plate 
WHERE Plant.IDplate=Plate.ID 
GROUP BY Plate.IDmedium; 


##Nombre de boîtes par génotype 

SELECT IDgen as Genotype ,count(distinct IDplate) AS nBR 
FROM Plant 
GROUP BY IDgen; 



##Nombre de boîtes par génotype et par milieu 

SELECT IDgen as Genotype, IDmedium as Milieu ,count(distinct IDplate) as Nbr 
FROM Plant, Plate 
WHERE Plant.IDplate=Plate.ID 
GROUP BY Plant.IDgen, Plate.IDmedium; 



