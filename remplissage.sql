LOAD DATA LOCAL INFILE './table_mesure.csv' 
INTO TABLE Mesure
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' (IDfeature, IDplant, value);



LOAD DATA LOCAL INFILE './table_plant.csv' 
INTO TABLE Plant
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' (ID,IDgen,groupe,pg,IDmedium,IDmedium);



INSERT INTO Feature(ID,label,definition,unite,IDterm)
VALUES
('0','PR length','longueur racine principale','cm',''), 
('1','tortuosity','tortuosité racine primaire','none',''), 
('2','RootArea','surface racinaire','cm2',''), 
('3','LR length','longueur racines latérales','cm',''), 
('4','distanceFromHypocotyl','distance racine primaire - hypocotyle','cm',''), 
('5','ShootArea','surface foliaire','cm2',''), 
('6','clorophyll','teneur en chlorophylle','au (arbitrary unit)',''); 




INSERT INTO Genotype(ID,Def)
VALUES
('Col_0','Plante sauvage'),
('nrt','NRT2.x : High-affinity nitrate transporters'),
('sex1','SEX1 : Starch Excess Pyruvate phosphate dikinase'),
('pgm','PGM : Phosphoglucomutase');



INSERT INTO Medium(ID,Libelle, caracteristique)
VALUES
('Milieu_1','Carence Azote','0.5 mMNO3-'),
('Milieu_2','Carence Azote/Carbone','0.5 mMNO3- + 1% saccharose (p/v)'),
('Milieu_3','Standard','2.5 mMNO3-'),
('Milieu_4','Saccharose','Standard + 1% saccharose (p/v)'),
('Milieu_5','Microorganisme (PGPR)','Standard + microorganisme');
