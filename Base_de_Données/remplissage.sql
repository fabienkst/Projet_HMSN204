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


INSERT INTO Vocabular(ID, def)
VALUES
('1', 'Plant Ontology'),
('2', 'Phenotype And Trait Ontology'),
('3', 'Flora Phenotype Ontology'),
('4', 'Plant Trait Ontology'),
('5', 'Brassica Ontology');


INSERT INTO Feature(ID,label,definition,unite)
VALUES
('4','PR length','longueur racine principale','cm'), 
('5','tortuosity','tortuosité racine primaire','none'), 
('6','RootArea','surface racinaire','cm2'), 
('7','LR length','longueur racines latérales','cm'), 
('10','distanceFromHypocotyl','distance racine primaire - hypocotyle','cm'), 
('11','ShootArea','surface foliaire','cm2'), 
('12','clorophyll','teneur en chlorophylle','au (arbitrary unit)'); 


INSERT INTO Term(ID, define,IDvoc)
VALUES
('PO_0009005','root','1'), 
('PO_0020127','primary root','1'),
('PO_0020121','lateral root','1'),
('PO 0025034','leaf','1'),
('PATO 0000122','length','2'),
('FLOPO_0009325','root length','3'),
('TO_0001013','lateral root number','4'),
('PATO_0001323','aera','2'),
('PO_0020100','hypocotyl','1'),
('CO_348:2100001','Primary root length','5'),
('CO_348:2100002','Lateral root length','5');



LOAD DATA LOCAL INFILE './table_plate.csv'
INTO TABLE Plate
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' (ID,IDmedium);


LOAD DATA LOCAL INFILE './table_plant.csv' 
INTO TABLE Plant
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' (ID,groupe,pg,IDplate,IDgen);



LOAD DATA LOCAL INFILE './table_mesure.csv' 
INTO TABLE Mesure
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' (IDfeature, IDplant, value);



INSERT INTO Define(IDfeature, IDterm)
VALUES
('4','PO_0009005'),
('4','PO_0020127'),
('4','PATO 0000122'),
('4','FLOPO_0009325'),
('4','CO_348:2100001'),
('6','PO_0009005'),
('6','PATO_0001323'),
('7','PO_0009005'),
('7','PO_0020121'),
('7','PATO 0000122'),
('7','FLOPO_0009325'),
('7','CO_348:2100002'),
('10','CO_348:2100001'),
('10','PO_0020100'),
('11','PATO_0001323');



INSERT INTO Gene(ID,name,def)
VALUES
('1', 'PGM','phosphoglucomutase'),
('2', 'SEX1','starch excess 1'),
('3', 'NRT2.5','high affinity nitrate transporter 2.5'),
('4', 'NRT2.6','High affinity nitrate transporter 2.6'),
('5', 'pgm','phosphoglucomutase mutant'),
('6', 'sex1','starch excess 1 mutant'),
('7', 'nrt2.5','high affinity nitrate transporter 2.5 mutant'),
('8', 'nrt2.6','High affinity nitrate transporter 2.6 mutant');



INSERT INTO Associate(geneID, genotypeID)
VALUES
('1','Col_0'),
('2','Col_0'),
('3','Col_0'),
('4','Col_0'),
('1','nrt'),
('2','nrt'),
('7','nrt'),
('8','nrt'),
('1','sex1'),
('6','sex1'),
('3','sex1'),
('4','sex1'),
('5','pgm'),
('2','pgm'),
('3','pgm'),
('4','pgm');
