DROP TABLE Mesure;
DROP TABLE Define;
DROP TABLE Feature;
DROP TABLE Associate;
DROP TABLE Gene;
DROP TABLE Term;
DROP TABLE Vocabular;
DROP TABLE Plant;
DROP TABLE Genotype;
DROP TABLE Medium;


CREATE table Medium(
	ID varchar(9) primary key,
	libelle varchar(100),
	caracteristique varchar(100)
);


CREATE table Genotype(
	ID varchar(5) primary key,
	Def varchar(15)
);


CREATE TABLE Plant( 
	ID varchar(5) primary key,
	group varchar(10),
	pg INT NOT NULL,
	plate varchar(8),
	IDgen varchar(5),
	IDmedium varchar(9),
	FOREIGN KEY (IDgen)
		REFERENCES Genotype(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY(IDmedium) 
		REFERENCES Medium(ID)
		ON UPDATE CASCADE
);


CREATE table Vocabular(
	ID varchar(15) primary key,
	def varchar(100)
);


CREATE table Term(
	ID varchar(15) primary key,
	define varchar(100),
	IDvoc varchar(15),
	FOREIGN KEY (IDvoc)
		REFERENCES Vocabular(ID)
		ON UPDATE CASCADE
);


CREATE table Gene(
	ID varchar(10) primary key,
	name varchar (100)
);


CREATE TABLE Associate(
	geneID varchar(100),
	genotypeID varchar(100),
	primary key (genotypeID,geneID),
	FOREIGN KEY (geneID)
		REFERENCES Gene(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY (genotypeID)
		REFERENCES Genotype(ID)
		ON UPDATE CASCADE
);


CREATE table Feature( 
	ID varchar(5) primary key,
	IDterm varchar(5),
	intitule varchar(100),
	FOREIGN KEY(IDterm)
		REFERENCES Term(ID)
		ON UPDATE CASCADE
);


CREATE TABLE Mesure(
	IDfeature varchar(100),
	IDplant varchar(5),
	value INT NOT NULL,
	primary key(IDfeature,IDplant),
	FOREIGN KEY (IDplant)
		REFERENCES Plant(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY (IDfeature)
		REFERENCES Feature(ID)
		ON UPDATE CASCADE
);


CREATE TABLE Define(
	IDgene varchar(10),
	IDterm varchar(15),
	primary key(IDgene,IDterm),
	FOREIGN KEY (IDgene)
		REFERENCES Gene(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY (IDterm)
		REFERENCES Term(ID)
		ON UPDATE CASCADE
);
