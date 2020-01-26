CREATE or replace VIEW MojiLetovi AS
SELECT ALL
    TRNaz as "TipRakete",DeId as "Destinacija",MDatPoc as "Datum pocetka misije"
FROM Upravlja 
join rakete_sa_tr_sa_misijama_sa_tm ON Upravlja.RaId=rakete_sa_tr_sa_misijama_sa_tm.RaId 
join Misija ON Misija.MId=rakete_sa_tr_sa_misijama_sa_tm.MId
join raketa on raketa.raid=rakete_sa_tr_sa_misijama_sa_tm.raid
join tip_rakete on tip_rakete.trid=raketa.trid
join zaposleni on zaposleni.zapid=upravlja.zapid
join leti_na on leti_na.mid=upravlja.mid
WHERE zapime='Tamara' and zapprez='Lazarevic'
ORDER BY MdatPoc DESC;