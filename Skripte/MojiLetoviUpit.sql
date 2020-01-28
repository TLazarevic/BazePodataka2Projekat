
CREATE OR REPLACE FORCE VIEW "MOJILETOVI" AS 
select tip_rakete.trnaz as "Naziv tipa rakete",misija.makr "Akronim misije", tip_misije.tmnaz as "Tip misije",destinacija.denaz as "Destinacija", misija.mstat as "Status misije", misija.mdatpoc as "Datum pocetka misije"
from upravlja natural join pilot natural join zaposleni natural join tip_rakete natural join tip_misije natural join misija
natural join leti_na natural join destinacija
where zaposleni.zapime='Tamara' and zaposleni.zapprez='Lazarevic'
order by misija.mdatpoc DESC;