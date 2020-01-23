
CREATE TABLE Drzava
	(
	 DId integer not null,
	DNaz varchar(30) not null,
	CONSTRAINT Drzava_PK PRIMARY KEY (DId)
	 
);

CREATE TABLE Grad
	(
	 GRId integer not null,
	GNaz varchar(30) not null,
	DId varchar(30) not null,
	CONSTRAINT Grad_PK PRIMARY KEY (GRId),
	CONSTRAINT Grad_FK FOREIGN KEY (DId) REFERENCES Drzava (DId)
	 
);

CREATE TABLE Pista
	(
	 PId integer not null,
	CPId integer not null,
	CONSTRAINT PISTA_PK PRIMARY KEY (PId),
	CONSTRAINT PISTA_FK FOREIGN KEY (CPId) REFERENCES CentriIPostrojenja (CPId)
);

CREATE TABLE Gorivo
	(
	GNaz varchar(30) not null,
	GId integer not null,
	GCena decimal(20,2) not null,
	CONSTRAINT GORIVO_PK PRIMARY KEY (GId) 
);


CREATE TABLE CentriIPostrojenja
	(
	 CPId integer not null,
	CPAdr varchar(30) not null,
	CPTel varchar(30) not null,
	GRId integer not null,
	DId integer not null,
	CONSTRAINT CentriIPostrojenja_PK PRIMARY KEY (CPId),
	CONSTRAINT StranaAgencija_FK FOREIGN KEY (GRId) REFERENCES Grad (GRId),
	CONSTRAINT StranaAgencija_FK FOREIGN KEY (DId) REFERENCES Drzava (DId)
	 
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
	AgId integer not null,
	 CONSTRAINT Zaposleni_FK FOREIGN KEY (CPId) REFERENCES CentriIPostrojenja (CPId),
	CONSTRAINT Zaposleni_FK FOREIGN KEY (AgId) REFERENCES StranaAgencija (AgId),
    CONSTRAINT Zaposleni_PK PRIMARY KEY (ZapId)
);

CREATE TABLE Astronaut
	(
	 ATip varchar(30) not null,
	 ZapId integer not null,
	AgId integer not null,
	CONSTRAINT ASTRONAUT_PK PRIMARY KEY (ZapId)
	CONSTRAINT ASTRONAUT_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	CONSTRAINT ASTRONAUT_FK FOREIGN KEY (AgId) REFERENCES StranaAgencija (AgId)
);

CREATE TABLE Pilot
	(
	 ZapId integer not null,
);

CREATE TABLE TipMisije 
	(
	 TMNaz varchar(30) not null,
	 TMId number not null,
	CONSTRAINT TIPMISIJE_PK PRIMARY KEY(TMId)
);

CREATE TABLE TipRakete 
	(
	 TRId number not null,
	 TRNaz varchar(30) not null,
	 TRPonIs varchar(20) not null,
	 TRCena decimal (20,2) not null,
	 TRKapTer decimal (20,2) not null,
	 CONSTRAINT TIPRAKETE_PK PRIMARY KEY (TRId)
);

CREATE TABLE Raketa
	(
	 RaId number not null,
	 RaDatPro date not null,
	 TRId number not null,
	CONSTRAINT RAKETA_PK PRIMARY KEY (RaId),
	CONSTRAINT RAKETA_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId)
);

CREATE TABLE Misija
	(
	 MId number not null,
	 MNaz varchar(30) not null,
	 MStat varchar(20) not null,
	 MDatPol date not null,
	 MRez varchar(20) not null,
	 MBu decimal (20,2) not null,
	 MAkr varchar(20) not null,
	 CONSTRAINT MISIJA_PK PRIMARY KEY (MId)
);

CREATE TABLE Destinacija
	(
	 DeId number not null,
	 DeNaz varchar(30) not null, 
	 CONSTRAINT DESTINACIJA_PK PRIMARY KEY (DeId)
);

CREATE TABLE PiloTipRak
	(
	 TRId integer not null,
	 ZapId integer not null,
	 CONSTRAINT PILOITIPRAK_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
	 CONSTRAINT PILOIIPRAK_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	 CONSTRAINT PILOITIPRAK_PK  PRIMARY KEY (TRId,ZapId)
);

CREATE TABLE AstroiTipMis
	(
	 ZapId integer not null,
	 TMId integer not null,
	 CONSTRAINT ASTROITIPRAK_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	 CONSTRAINT ASTROIIPRAK_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	 CONSTRAINT ASTROIIPRAK_PK  PRIMARY KEY (TMId,ZapId) 
	 
);

CREATE TABLE TRGorivo
	(
	 TRId integer not null,
	 GId integer not null,
	 CONSTRAINT TRGORIVO_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
	 CONSTRAINT TRGORIVO_FK FOREIGN KEY (GId) REFERENCES Gorivo (GId),
	 CONSTRAINT TRGORIVO_PK  PRIMARY KEY (TMId,GId)	 
);


CREATE TABLE MisDest
	(
	DeId integer not null,
	MId integer not null,
	CONSTRAINT MISDEST_FK FOREIGN KEY (DeId) REFERENCES Destinacija (DeId),
	CONSTRAINT MISTEST_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
	CONSTRAINT MISTEST_PK PRIMARY KEY (DeId,MId)
);

CREATE TABLE TipMisTipRak
	(
	TMId integer not null,
	TRId integer not null,
	CONSTRAINT TIPMISTIPRAK_PK PRIMARY KEY (TMId,TRId),
	CONSTRAINT TIPMISTIPRAK_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT TIPMISTIPRAK_TR_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
);

CREATE TABLE MisTipMis
	(
	TMId integer not null,
	MId integer not null,
	ZapId integer not null,
	CONSTRAINT MISTIPMIS_PK PRIMARY KEY (TMId,MId),
	CONSTRAINT MISTIPMIS_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
	CONSTRAINT MISTIPMIS_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT MISTIPMIS_ZAP_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	
);

CREATE TABLE MisPis
	(
	MId integer not null,
	PId integer not null,
	CPId integer not null,
	CONSTRAINT MISPIS_PK PRIMARY KEY (CPId,MId),
	CONSTRAINT MISPIS_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
	CONSTRAINT MISPIS_P_FK FOREIGN KEY (PId) REFERENCES Pista (Pid),
	CONSTRAINT MISPIS_CP_FK FOREIGN KEY (CPId) REFERENCES CentriPostrojenja (CpId)
);

CREATE TABLE Opcija 
	(
	RaId integer not null,
	TMId integer not null,
	MId integer not null,
	TRId integer not null,
	CONSTRAINT OPCIJA_PK PRIMARY KEY (TMId,MId,RaId,TRId),
	CONSTRAINT OPCIJA_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
	CONSTRAINT OPCIJA_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT OPCIJA_TR_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
	CONSTRAINT OPCIJA_R_FK FOREIGN KEY (RId) REFERENCES TipRakete (RId),
);