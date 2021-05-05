/*DROP TABLE Associate;
DROP TABLE Mesure;
DROP TABLE Vocabular;
DROP TABLE Term;
DROP TABLE Gene;
DROP TABLE Mesure_Group;
DROP TABLE Feature;
DROP TABLE Medium;
DROP TABLE Plate;
DROP TABLE Groupe;
DROP TABLE Plant;
DROP TABLE Genotype;*/

CREATE table Medium(
	ID varchar(8),
	libelle varchar(100),
	caracteristique varchar(100),
	INDEX (ID)
);

CREATE table Genotype
( ID varchar(5) primary key,
INDEX (ID));

CREATE TABLE Plant( 
	ID varchar(5) primary key,
	g INT NOT NULL, /*groupe*/
	INDEX (g),
	INDEX (ID),
	FOREIGN KEY (ID)
		REFERENCES Genotype(ID)
		ON UPDATE CASCADE
);



CREATE table Plate
( ID varchar(7),
	FOREIGN KEY (ID)
		REFERENCES Medium(ID)
		ON UPDATE CASCADE
		);

CREATE table Groupe(
	ga INT NOT NULL,
	pg INT NOT NULL,
	ID varchar(10),
	INDEX(ID),
	INDEX(ga),
	FOREIGN KEY(ID) 
		REFERENCES Plate(ID)
		ON UPDATE CASCADE

);



CREATE table Feature( 
	ID varchar(100) primary key,
	intitule varchar(100),
	INDEX (intitule));

CREATE table Gene
( ID varchar(10),
name varchar (100),
INDEX (ID)
	);

CREATE table Term
(define varchar(100),
FOREIGN KEY (define)
	REFERENCES Vocabular(def)
	ON UPDATE CASCADE);

CREATE table Vocabular
(def varchar(100));

CREATE TABLE Mesure(
	mID varchar(5),
	intitule varchar(100),
	value INT NOT NULL,
	FOREIGN KEY (mID)
		REFERENCES Plant(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY (intitule)
		REFERENCES Feature(intitule)
		ON UPDATE CASCADE
		);

CREATE TABLE Mesure_Group(
	mg INT NOT NULL,
	intitule varchar(100),
	ID varchar(10),
	value INT NOT NULL,
	FOREIGN KEY (mg)
		REFERENCES Groupe(ga)
		ON UPDATE CASCADE,
	FOREIGN KEY (ID)
		REFERENCES Feature(ID)
		ON UPDATE CASCADE
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









































