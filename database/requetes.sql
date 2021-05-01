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




##taille moyenne des racines principales par boîte 
SELECT Plant.IDplate as boite, avg(Mesure.value) as taille_moyenne_racine_principale
FROM Plant, Mesure, Feature 
WHERE Plant.ID=Mesure.IDplant AND Mesure.IDfeature=Feature.ID AND Feature.label='PR length' 
GROUP BY Plant.IDplate; 

##taille moyenne des racines principales par génotype
SELECT Plant.IDgen as Genotype, avg(Mesure.value) as taille_moyenne_racine_principale
FROM Plant, Mesure, Feature 
WHERE Plant.ID=Mesure.IDplant AND Mesure.IDfeature=Feature.ID AND Feature.label='PR length' 
GROUP BY Plant.IDgen; 


##taille moyenne des racines principales par boîte et par génotype 

SELECT Plant.IDgen as Génotype, Plant.IDplate as Boite, avg(Mesure.value) as taille_moyenne_racine_principale
FROM Plant, Mesure, Feature 
WHERE Plant.ID=Mesure.IDplant AND Mesure.IDfeature=Feature.ID AND Feature.label='PR length'
GROUP BY Plant.IDplate, Plant.IDgen; 



##taille moyenne des racines principales par milieux
SELECT Plate.IDmedium as Milieu, avg(Mesure.value) as taille_moyenne_racine_principale
FROM Plant, Mesure, Feature ,Plate
WHERE Plant.ID=Mesure.IDplant AND Mesure.IDfeature=Feature.ID AND Plant.IDplate = Plate.ID AND Feature.label='PR length' 
GROUP BY Plate.IDmedium; 



##taille moyenne des racines principales par milieu et par génotype 
SELECT Plate.IDmedium as Milieu,Plant.IDgen as Genotype, avg(Mesure.value) as taille_moyenne_racine_principale
FROM Plant, Mesure, Feature ,Plate
WHERE Plant.ID=Mesure.IDplant AND Mesure.IDfeature=Feature.ID AND Plant.IDplate = Plate.ID AND Feature.label='PR length' 
GROUP BY Plate.IDmedium, Plant.IDgen;


#Les plantes qui ont la valeur en chlorphile la plus base

SELECT IDplant,value
FROM Mesure, Feature
WHERE Mesure.IDfeature = Feature.ID AND Feature.label = 'clorophyll' AND Mesure.value = (Select MIN(value) FROM Mesure,Feature WHERE Mesure.IDfeature = Feature.ID AND Feature.label = 'clorophyll');



##taille la plus élevée et la plus basse de distance racine primaire - hypocotyle tous milieux et génotypes confondus 

SELECT MIN(value), MAX(value)
FROM Mesure,Feature
WHERE Mesure.IDfeature = Feature.ID AND Feature.label = 'distanceFromHypocotyl';



##taille la plus élevée et la plus basse des racines principales tous milieux et génotypes confondus 

SELECT MIN(value), MAX(value)
FROM Mesure,Feature
WHERE Mesure.IDfeature = Feature.ID AND Feature.label = 'PR length';


##taille la plus élevée et la plus basse des racines principales par milieu 
SELECT IDmedium ,MIN(value), MAX(value)
FROM Mesure,Feature,Plant, Plate
WHERE Mesure.IDfeature = Feature.ID AND Mesure.IDplant = Plant.ID AND Plant.IDplate = Plate.ID AND Feature.label = 'PR length'
GROUP BY IDmedium;


##taille la plus élevée et la plus basse des racines principales par génotype 
SELECT IDgen,MIN(value), MAX(value)
FROM Mesure,Feature,Plant
WHERE Mesure.IDfeature = Feature.ID AND Mesure.IDplant = Plant.ID AND Feature.label = 'PR length'
GROUP BY IDgen;