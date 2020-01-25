
CREATE TABLE Drzava
	(
	 DId integer not null,
	DNaz varchar(30) not null,
	CONSTRAINT DRZAVA_U UNIQUE (DNaz),
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


CREATE TABLE CentriIPostrojenja
	(
	 CPId integer not null,
	CPAdr varchar(30) not null,
	CPTel varchar(30) not null,
	GRId integer not null,
	DId integer not null,
	CONSTRAINT CentriIPostrojenja_PK PRIMARY KEY (CPId),
	CONSTRAINT CentriIPostrojenja_G_FK FOREIGN KEY (GRId) REFERENCES Grad (GRId),
	CONSTRAINT v_D_FK FOREIGN KEY (DId) REFERENCES Drzava (DId)
	 
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



CREATE TABLE StranaAgencija(
	 AgId integer not null,
	 AgNaziv varchar(30) not null,
    	Did integer not null,	
	 CONSTRAINT StranaAgencija_PK PRIMARY KEY (AgId),
	 CONSTRAINT StranaAgencija_FK FOREIGN KEY (DId) REFERENCES Drzava (DId)
     	
);


CREATE TABLE Zaposleni
	(
	 ZapIme varchar(30) not null,
	 ZapPrez varchar(30) not null,
 	 ZapZan varchar(30) not null,
	 ZapId integer NOT NULL, 
     	CpID integer,
	 CONSTRAINT Zaposleni_CP_FK FOREIGN KEY (CPId) REFERENCES CentriIPostrojenja (CPId),
    CONSTRAINT Zaposleni_PK PRIMARY KEY (ZapId)
);

CREATE TABLE Astronaut
	(
	 ATip varchar(30) not null,
	 ZapId integer not null,
	AgId integer,
	CONSTRAINT ASTRONAUT_PK PRIMARY KEY (ZapId)
	CONSTRAINT ASTRONAUT_Z_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	CONSTRAINT ASTRONAUT_A_FK FOREIGN KEY (AgId) REFERENCES StranaAgencija (AgId)
);

CREATE TABLE Pilot
	(
	 ZapId integer not null,	
	CONSTRAINT PILOT_PK PRIMARY KEY (ZapId)
);

CREATE TABLE TipMisije 
	(
	 TMNaz varchar(30) not null,
	 TMId integer not null,
	CONSTRAINT TIPMISIJE_PK PRIMARY KEY(TMId)
);

CREATE TABLE TipRakete 
	(
	 TRId integer not null,
	 TRNaz varchar(30) not null,
	 TRPonIs varchar(20) not null,
	 TRLCena decimal (20,2) not null,
	 TRKapTer decimal (20,2) not null,
	 CONSTRAINT TIPRAKETE_PK PRIMARY KEY (TRId)
);

CREATE TABLE Raketa
	(
	 RaId integer not null,
	 RaDatPro date not null,
	 TRId integer not null,
	CONSTRAINT RAKETA_PK PRIMARY KEY (RaId),
	CONSTRAINT RAKETA_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId)
);

CREATE TABLE Misija
	(
	 MId number not null,
	 MNaz varchar(30) not null,
	 MStat varchar(20) not null,
	 MDatPoc date not null,
	MDatZav date not null,
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
	 CONSTRAINT PILOITIPRAK_TR_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
	 CONSTRAINT PILOIIPRAK_Z_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	 CONSTRAINT PILOITIPRAK_PK  PRIMARY KEY (TRId,ZapId)
);

CREATE TABLE AstroiTipMis
	(
	 ZapId integer not null,
	 TMId integer not null,
	 CONSTRAINT ASTROITIPRAKT_M_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	 CONSTRAINT ASTROIIPRAK_Z_FK FOREIGN KEY (ZapId) REFERENCES Zaposleni (ZapId),
	 CONSTRAINT ASTROIIPRAK_PK  PRIMARY KEY (TMId,ZapId) 	 
);

CREATE TABLE TRGorivo
	(
	 TRId integer not null,
	 GId integer not null,
	 CONSTRAINT TRGORIVO_TR_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId),
	 CONSTRAINT TRGORIVO_G_FK FOREIGN KEY (GId) REFERENCES Gorivo (GId),
	 CONSTRAINT TRGORIVO_PK  PRIMARY KEY (TMId,GId)	 
);


CREATE TABLE MisDest
	(
	DeId integer not null,
	MId integer not null,
	CONSTRAINT MISDEST_D_FK FOREIGN KEY (DeId) REFERENCES Destinacija (DeId),
	CONSTRAINT MISTEST_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
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
	CONSTRAINT MISPIS_CP_FK FOREIGN KEY (CPId) REFERENCES CentriIPostrojenja (CpId)
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

CREATE TABLE KoristiSe
	(
	RaId integer,
	TMId integer not null,
	MId integer not null,
	CONSTRAINT KORISTISE_PK PRIMARY KEY (RaId,TMId,MId),
	CONSTRAINT KORISTISE_R_FK FOREIGN KEY (RaId) REFERENCES Raketa (RaId),
	CONSTRAINT KORISTISE_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT KORISTISE_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId)	
);

CREATE TABLE Ucesnik
	(
	 ZapId integer,
	 TMId integer,
	 MId integer,
	CONSTRAINT UCESNIK_PK PRIMARY KEY (ZapId,TMId,MId),
	CONSTRAINT UCESNIK_Z_FK FOREIGN KEY (Zap) REFERENCES Zaposleni (ZapId),
	CONSTRAINT UCESNIK_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT UCESNIK_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId)
		 
);

CREATE TABLE PiloMis
	(
	 
	 ZapId integer,
	TRId integer,
	RaId integer,
	TMId integer,
	 MId integer,
	CONSTRAINT PILOMIS_PK PRIMARY KEY (ZapId,TMId,MId,TRId,RaId),
	CONSTRAINT PILOMIS_Z_FK FOREIGN KEY (Zap) REFERENCES Zaposleni (ZapId),
	CONSTRAINT PILOMIS_TM_FK FOREIGN KEY (TMId) REFERENCES TipMisije (TMId),
	CONSTRAINT PILOMIS_M_FK FOREIGN KEY (MId) REFERENCES Misija (MId),
	CONSTRAINT PILOMIS_R_FK FOREIGN KEY (RaId) REFERENCES Raketa (RaId),
	CONSTRAINT PILOMIS_TR_FK FOREIGN KEY (TRId) REFERENCES TipRakete (TRId)
);