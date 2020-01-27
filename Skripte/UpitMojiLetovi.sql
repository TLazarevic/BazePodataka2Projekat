
CREATE OR REPLACE VIEW "MOJILETOVI" ("TipRakete", "Destinacija", "Datum pocetka misije","Status misije") AS 
SELECT tip_rakete.TRNaz as "TipRakete",leti_na.DeId as "Destinacija",Misija.MDatPoc as "Datum pocetka misije",Misija.MStat as "Status misije"
FROM Upravlja 
join Misija ON Misija.MId=upravlja.MId
join tip_rakete on tip_rakete.trid=upravlja.trid
join zaposleni on zaposleni.zapid=upravlja.zapid
join leti_na on leti_na.mid=upravlja.mid
join destinacija on destinacija.deid=leti_na.deid
WHERE zaposleni.zapime='Tamara' and zaposleni.zapprez='Lazarevic'
ORDER BY Misija.MDatPoc DESC;