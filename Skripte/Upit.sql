CREATE VIEW MojiLetovi AS
SELECT ALL
    TRNaz,MisDatPoc as "Naziv, Datum pocetka"
FROM Upravlja join R_SA_TR_SA_M_SA_TM 
ON Upravlja.RaId=R_SA_TR_SA_M_SA_TM.RaId 
join Misija ON Misija.MId=R_SA_TR_SA_M_SA_TM.MId;