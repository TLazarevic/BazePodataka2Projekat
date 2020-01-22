
CREATE TABLE Drzava
	(
	 DId integer not null,
	DNaziv varchar(30) not null,
	CONSTRAINT Drzava_PK PRIMARY KEY (DId)
	 
);

CREATE TABLE CentriIPostrojenja
	(
	 CPId integer not null,
	CONSTRAINT CentriIPostrojenja_PK PRIMARY KEY (CPId)
	 
);

CREATE TABLE StranaAgencija(
	 AgId integer not null,
	 AgNaziv varchar(30) not null,
    Did integer,	
	 CONSTRAINT StranaAgencija_PK PRIMARY KEY (AgId),
	 CONSTRAINT StranaAgencija_FK FOREIGN KEY (DId) REFERENCES Drzava (DId)
     	
);


CREATE TABLE Zaposleni
	(
	 ZapIme varchar(30) not null,
	 ZapPrez varchar(30) not null,
 	 ZapZan varchar(30) not null,
	 ZapId integer NOT NULL, 
     CpID integer not null,
	 CONSTRAINT Zaposleni_FK FOREIGN KEY (CPId) REFERENCES CentriIPostrojenja (CPId),
    CONSTRAINT Zaposleni_UK UNIQUE (ZapId)
);


