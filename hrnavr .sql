--CREATE DATABASE Grupa11_hrnavr;

USE Grupa11_hrnavr
GO

/*
---- KREIRANJE TABELA ----


CREATE TABLE Placanje (
ID_placanje int PRIMARY KEY,
Datum_placanja date NOT NULL,
Metoda_placanja nvarchar(30) NULL,
Banka nvarchar(50) NULL,
Ukupan_iznos smallmoney NOT NULL
)

CREATE TABLE Narudzba(
ID_narudzba int PRIMARY KEY,
Datum_narucivanja date NOT NULL,
Vrijeme_narucivanja time NOT NULL,
Narudzba_status nvarchar(40) NOT NULL
) 

CREATE TABLE Jelo (
ID_jelo int PRIMARY KEY,
Naziv nvarchar(90) NOT NULL,
Velicina_porcije nvarchar(50) NULL
)

CREATE TABLE Restoran(
ID_restoran int PRIMARY KEY,
Naziv nvarchar(60) NOT NULL,
Email nvarchar(30) NULL,
Telefon varchar(15) NOT NULL,
Adresa nvarchar (60) NOT NULL,
Radno_vrijeme nvarchar(20) NULL
)

CREATE TABLE Kupac(
ID_kupac int PRIMARY KEY,
Ime nvarchar(20) NOT NULL,
Prezime nvarchar(35) NOT NULL,
Broj_telefona nvarchar(30) NOT NULL,
Mjesto nvarchar(30) NULL,
Ulica_broj nvarchar(50) NOT NULL
) 

ALTER TABLE Placanje
ADD ID_kupac INT NOT NULL REFERENCES Kupac(ID_kupac)

ALTER TABLE Placanje
ADD ID_narudzba INT NOT NULL REFERENCES Narudzba(ID_narudzba)

ALTER TABLE Narudzba
ADD ID_kupac INT NOT NULL REFERENCES Kupac(ID_kupac)


CREATE TABLE Recenzija (
ID_recenzija int PRIMARY KEY,
Naziv nvarchar(30)  NULL,
Ocjena int NULL,
Komentar nvarchar(90) NOT NULL,
Datum_podnosenja date NOT NULL
)

CREATE TABLE Grad (
ID_grad int PRIMARY KEY,
Naziv nvarchar(50) NOT NULL,
Pozivni_broj varchar(5) NULL
)

CREATE TABLE Dostava (
ID_dostava int PRIMARY KEY,
Vrijeme_dostavljanja time NOT NULL
)

ALTER TABLE Recenzija
ADD ID_kupac INT NOT NULL REFERENCES Kupac(ID_kupac)

ALTER TABLE Narudzba
ADD ID_restoran INT NOT NULL REFERENCES Restoran(ID_restoran)      

ALTER TABLE Kupac
ADD ID_grad INT NOT NULL REFERENCES Grad(ID_grad)


ALTER TABLE Dostava
ADD ID_kupac INT NOT NULL REFERENCES Kupac(ID_kupac)

CREATE TABLE Meni (
ID_jelo int NOT NULL,
ID_restoran int NOT NULL,
CONSTRAINT ID_meni PRIMARY KEY (ID_jelo, ID_restoran),
CONSTRAINT FK_jelo FOREIGN KEY (ID_jelo) REFERENCES Jelo(ID_jelo),
CONSTRAINT FK_restoran FOREIGN KEY (ID_restoran) REFERENCES Restoran(ID_restoran),
Opis nvarchar(100) NULL,
Cijena money NOT NULL,
)

CREATE TABLE Narudzba_stavke (
ID_narudzba_stavke int PRIMARY KEY,
ID_jelo int NOT NULL,
ID_restoran int NOT NULL,
Kolicina smallint NOT NULL,
CONSTRAINT FK_Meni FOREIGN KEY (ID_jelo, ID_restoran) REFERENCES Meni(ID_jelo, ID_restoran)
)


ALTER TABLE Narudzba
ADD ID_narudzba_stavke INT NOT NULL REFERENCES Narudzba_stavke(ID_narudzba_stavke)


ALTER TABLE Recenzija
ADD ID_restoran INT NOT NULL REFERENCES Restoran(ID_restoran)

ALTER TABLE Restoran
ADD ID_grad INT NOT NULL REFERENCES Grad(ID_grad)


ALTER TABLE Dostava
ADD ID_narudzba INT NOT NULL REFERENCES Narudzba(ID_narudzba)



---- UNOS PODATAKA U TABELE ----


--TABELA GRAD --
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (71000,'Sarajevo','033')
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (78103,'Banja Luka','051')
INSERT INTO Grad(ID_grad,Naziv)
VALUES (75000,'Tuzla')
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (88104,'Mostar','036')
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (73101,N'Goražde','038')
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (72270,'Travnik','030')
INSERT INTO Grad(ID_grad,Naziv)
VALUES (77230,N'Bihać')
INSERT INTO Grad(ID_grad,Naziv,Pozivni_broj)
VALUES (72000,'Zenica','032')


-- TABELA KUPAC --
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Mjesto,Ulica_broj,ID_grad)
VALUES (1,'Nejra','Drakovac',38762225883,'Butmir',N'Sjenička 10',71000)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Ulica_broj,ID_grad)
VALUES (2,'Fatima',N'Kendić',38762285562,'Zmaja od Bosne 56',71000)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Mjesto,Ulica_broj,ID_grad)
VALUES (3,'Amina',N'Vejselović',38762123456,'Otoka',N'Srđana Aleksića 100',71000)

INSERT INTO Grad(ID_grad,Naziv)
VALUES (88400,'Konjic')

INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Ulica_broj,ID_grad)
VALUES (4,'Aladin',N'Ramić',38762789456,N'Maršala Tita 50',88400)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Mjesto,Ulica_broj,ID_grad)
VALUES (5,'Fatih',N'Dizdarević',38761235683,'Otoka','Kraljice Jelene 35', 71000)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Ulica_broj,ID_grad)
VALUES (6,'Halid',N'Halidović',38761458683,N'Vojvodića put 15', 72000)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Mjesto,Ulica_broj,ID_grad)
VALUES (7,'Mujo',N'Mujić',38761835666,'Novi Travnik',N'Travnička 39', 72270)
INSERT INTO Kupac(ID_kupac,Ime,Prezime,Broj_telefona,Mjesto,Ulica_broj,ID_grad)
VALUES (8,'Srna',N'Hodžić',38762753951,'Mosnik',N'Zlatana Mešića 5', 75000)


-- TABELA JELO --
INSERT INTO Jelo(ID_jelo,Naziv,Velicina_porcije)
VALUES(1,N'Pileća maslenica','mala porcija')
INSERT INTO Jelo(ID_jelo,Naziv,Velicina_porcije)
VALUES(2,N'Pileća maslenica','srednja porcija')
INSERT INTO Jelo(ID_jelo,Naziv,Velicina_porcije)
VALUES(3,N'Pileća maslenica','velika porcija')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(4,'Capricciosa')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(5,N'Rižoto sa piletinom')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(6,'Margharita')
INSERT INTO Jelo(ID_jelo,Naziv,Velicina_porcije)
VALUES(7,'Piletina chilli','velika porcija')
INSERT INTO Jelo(ID_jelo,Naziv,Velicina_porcije)
VALUES(8,'Piletina chilli','mala porcija')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(9,'Hamburger')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(10,N'Begova čorba')
INSERT INTO Jelo(ID_jelo,Naziv)
VALUES(11,N'Palačinci')


-- TABELA RESTORAN--

INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,Radno_vrijeme,ID_grad)
VALUES (1,'Restoran Amerikanac','033210494','Branilaca Sarajeva 15','09-22',71000)
INSERT INTO Restoran(ID_restoran,Naziv,Email,Telefon,Adresa,Radno_vrijeme,ID_grad)
VALUES (2,'Klopa','klopa@gmail.com','033211454','Branilaca Sarajeva 5','08-22',71000)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,Radno_vrijeme,ID_grad)
VALUES (4,'Avlija','033444483','Avde Sumbula 2','10-22',71000)
INSERT INTO Restoran(ID_restoran,Naziv,Email,Telefon,Adresa,ID_grad)
VALUES (5,'Hidin Han','hidinhan@gmail.com','036581054','Jusovina 25',88104)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (6,N'Šadrvan','061891189','Jusovina 11',88104)
INSERT INTO Restoran(ID_restoran,Naziv,Email,Telefon,Adresa,ID_grad)
VALUES (7,'Konoba Taurus','konobataurus@gmail.com','061888549',N'Onešćukova 4',88104)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,Radno_vrijeme,ID_grad)
VALUES (8,'Europa restoran','036556730',N'Kujndžiluk 4','09-21',88104)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (9,'Limenka','035250800','Patriotske lige',75000)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (10,'Makedonka',035268114,'Armije BiH',75000)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (11,'Royal','035315666','Bosne Srebrene 23',75000)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad,Email)
VALUES (12,N'Lovački restoran','051312243','Slatinska 37',78103,'lovackirestoran@hotmail.com')
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (13,'Restoran Vrbas','051433852','Teodorska 12',78103)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad,Radno_vrijeme)
VALUES (14,'Kod Brke','051216006','Srpska 36',78103,'10-22')
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (15,'Mlin','061144200',N'Džemala Bijedića 2',77230)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon,Adresa,ID_grad)
VALUES (16,'Sofra','037223380','Bosanska 120',77230)
INSERT INTO Restoran(ID_restoran,Naziv,Telefon, Adresa,ID_grad)
VALUES (3,N'4 sobe gospođe Safije','033202745',N'Čekaluša 61',71000)


-- TABELA RECENZIJA --

INSERT INTO Recenzija(ID_recenzija,Naziv,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (1,'Primjedba','3',N'Piletina nije bila dovoljno pečena','2020-10-16',2,1)
INSERT INTO Recenzija(ID_recenzija,Naziv,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (2,'Pohvala','5',N'Izvrstan ukus, dovoljno začinjeno, odlično.','2020-05-23',1,1)
INSERT INTO Recenzija(ID_recenzija,Naziv,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (3,'Primjedba','4','Jelo nije bilo dovoljno slano, sve ostalo je uredu','2021-01-06',4,4)
INSERT INTO Recenzija(ID_recenzija,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (4,'Hrana izuzetno ukusna','2020-03-18',5,2)
INSERT INTO Recenzija(ID_recenzija,Naziv,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (5,'Pohvala',5,'Za medalju!!!!','2020-09-03',6,6)
INSERT INTO Recenzija(ID_recenzija,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (6,4,'Jelo je bilo solidno a cijena za ovu porciju je okej','2021-01-03',7,3)
INSERT INTO Recenzija(ID_recenzija,Naziv,Ocjena,Komentar,Datum_podnosenja,ID_kupac,ID_restoran)
VALUES (7,N'Lošina',3,'Bolje bih ja skuhala nego taj kuhar','2020-03-07',8,3)



--TABELA MENI--

INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (1,1,'Piletina, sir edamer, gljive, vrhnje','3.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (2,1,'Piletina, sir edamer, gljive, vrhnje','4.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (3,1,'Piletina, sir edamer, gljive, vrhnje','6.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (4,1,'7.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (6,1,'5.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (7,1,N'Pileće kockice, chili, grilovano povrće, maslinovo ulje','11.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (4,2,'8.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (6,2,'6.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (9,2,N'Mljeveno juneće meso 100 grama, kečap, senf, zelena salata, paradajz, luk','5.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (10,2,N'Pileće meso, mrkva, bamija, puter, začini','3.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (11,2,'4.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (1,3,'Piletina, vrhnje, sir i gljive','3.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (2,3,'Piletina, vrhnje, sir i gljive','5.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (3,3,'Piletina, vrhnje, sir i gljive','7.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (7,3,'10.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (8,3,'7.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (4,4,'6.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (5,4,'4.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (6,4,N'Basmati riža, piletina, povrće, puter, začini','7.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (5,5,'6.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (9,5,'80 grama mesa, kupus, paradajz, bijeli sos','5')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (10,5,'4.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (4,6,N'Paradajz sos, sir ementaler, pureća šunka, gljive','7.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (6,6,'Sir, paradajz sos','6.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (11,6,N'Nutella, vrući višnjin preljev, šlag','6.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (7,7,'7.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (8,7,'5.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (9,7,N'Domaće pecivo, juneće meso 100 grama, salata, kečap, majoneza','4.50')


INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (3,9,N'Piletina, gljive, vrhnje, začini','7.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (5,9,'Prilog, salata, pecivo','5.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (9,9,'3.50')


INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (9,11,'5.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (10,11,N'Povrće, pileće meso, 2 peciva iz krušne peći','4.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (11,11,N'Palačinci sa džemom','4.00')


INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (1,13,'Piletina, vrhnje, sir i gljive','3.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (2,13,'Piletina, vrhnje, sir i gljive','5.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Opis,Cijena)
VALUES (3,13,'Piletina, vrhnje, sir i gljive','6.50')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (9,13,'4.00')
INSERT INTO Meni(ID_jelo,ID_restoran,Cijena)
VALUES (10,13,'4.50')


--NARUDZBA STAVKE--

INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (1,3,1,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (2,6,1,2)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (3,9,2,3)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (4,10,2,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (5,11,2,2)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (6,2,3,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (7,7,3,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (8,6,4,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (9,10,5,2)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (10,6,6,1)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (11,5,9,2)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (12,9,9,3)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (13,3,13,2)
INSERT INTO Narudzba_stavke(ID_narudzba_stavke,ID_jelo,ID_restoran,Kolicina)
VALUES (14,9,13,1)


--NARUDZBA--

INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (1,'2020-05-23','12:55:07','U pripremi',1,1,1)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (2,'2020-10-16','15:30:53','U pripremi',2,2,1)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (3,'2020-03-18','10:41:25','U prevozu',5,3,2)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (4,'2020-06-23','18:15:45','U pripremi',6,4,2)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (5,'2020-01-30','19:27:16','U prevozu',3,5,2)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (6,'2021-01-03','20:45:23','U prevozu',7,6,3)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (7,'2021-01-06','09:21:37','U prevozu',4,8,4)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (8,'2020-03-07','13:45:13','U pripremi',8,7,3)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (9,'2020-09-03','16:43:57','U prevozu',6,10,6)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (10,'2020-03-13','14:05:31','U prevozu',3,11,9)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (11,'2021-01-05','15:23:35','U pripremi',5,9,5)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (12,'2020-12-13','11:46:19','U pripremi',2,12,9)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (13,'2020-11-04','17:33:41','U prevozu',8,14,13)
INSERT INTO Narudzba(ID_narudzba,Datum_narucivanja,Vrijeme_narucivanja,Narudzba_status,ID_kupac,ID_narudzba_stavke,ID_restoran)
VALUES (14,'2020-10-18','19:16:38','U prevozu',4,13,13)





--DOSTAVA--

INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (1,'13:15:53',1,1)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (2,'16:11:03',2,2)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (3,'10:55:42',5,3)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (4,'18:35:05',6,4)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (5,'19:42:31',3,5)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (6,'21:00:13',7,6)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (7,'9:45:34',4,7)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (8,'14:05:02',8,8)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (9,'17:02:23',6,9)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (10,'14:35:03',3,10)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (11,'15:47:13',5,11)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (12,'12:03:03',2,12)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (13,'17:55:16',8,13)
INSERT INTO Dostava(ID_dostava,Vrijeme_dostavljanja,ID_kupac,ID_narudzba)
VALUES (14,'19:38:18',4,14)


--PLACANJE--

INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (1,'2020-05-23',N'Pri pouzeću','6.50',1,1)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (2,'2020-10-16',N'Kartično','Unicredit banka','11.00',2,2)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (3,'2020-03-18',N'Kartično','Raiffeisen banka','16.50',5,3)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (4,'2020-06-23',N'Pri pouzeću','3.50',6,4)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (5,'2020-01-30',N'Pri pouzeću','8.00',3,5)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (6,'2021-01-03',N'Kartično','BBI banka','5.00',7,6)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (7,'2021-01-06',N'Pri pouzeću','7.00',4,7)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (8,'2020-03-07',N'Pri pouzeću','10.00',8,8)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (9,'2020-09-03',N'Kartično','Unicredit banka','6.00',6,9)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (10,'2020-03-13',N'Pri pouzeću','10.00',3,10)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (11,'2021-01-05',N'Pri pouzeću','8.00',5,11)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (12,'2020-12-13',N'Kartično','BBI banka','10.50',2,12)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (13,'2020-11-04',N'Kartično','BBI banka','4.00',8,13)
INSERT INTO Placanje(ID_placanje,Datum_placanja,Metoda_placanja,Banka,Ukupan_iznos,ID_kupac,ID_narudzba)
VALUES (14,'2020-10-18',N'Kartično','Raiffeisen banka','13.00',4,14)

*/

---- SELEKTIRANJE PODATAKA ----

SELECT * FROM Kupac
SELECT * FROM Restoran
SELECT * FROM Dostava
SELECT * FROM Grad
SELECT * FROM Jelo
SELECT * FROM Meni
SELECT * FROM Narudzba_stavke
SELECT * FROM Narudzba
SELECT * FROM Placanje
SELECT * FROM Recenzija


SELECT Naziv,Telefon,Adresa FROM Restoran

SELECT DISTINCT Komentar FROM Recenzija

SELECT TOP 5 Naziv,ID_grad
FROM Grad

---- SORTIRANJE PODATAKA ----

SELECT Naziv, ID_grad
FROM Restoran
ORDER BY Naziv


SELECT Datum_placanja, Metoda_placanja, ID_kupac
FROM Placanje
ORDER BY Datum_placanja ASC


SELECT Prezime + ' ' + Ime AS 'Prezime i ime kupca'
FROM Kupac
ORDER BY 'Prezime i ime kupca' DESC


SELECT Ime,Prezime
FROM Kupac
ORDER BY Ime DESC, Prezime ASC


---- FILTRIRANJE PODATAKA ----

SELECT * FROM Recenzija WHERE ID_restoran=3
SELECT * FROM Recenzija WHERE ID_restoran=1


SELECT * FROM Narudzba WHERE ID_restoran=2


SELECT Komentar,Ocjena FROM Recenzija WHERE Naziv='Pohvala'


SELECT ID_restoran,Cijena FROM Meni WHERE ID_jelo=9   --Prikazuje ID restorana i cijenu hamburgera u tom restoranu


SELECT ID_restoran,Naziv,Telefon FROM Restoran
WHERE ID_grad IN (71000)


SELECT Naziv,Adresa FROM Restoran
WHERE Telefon = '061888549' OR Email='konobataurus@gmail.com' 


SELECT ID_recenzija, Naziv, Komentar FROM Recenzija
WHERE ID_recenzija BETWEEN 1 AND 4


SELECT ID_recenzija, Naziv, Komentar,ID_kupac FROM Recenzija
WHERE Datum_podnosenja BETWEEN '2020-01-01'AND'2020-06-30'


SELECT ID_placanje,Metoda_placanja,Banka FROM Placanje
WHERE Datum_placanja BETWEEN '2020-01-01'AND'2020-08-31'


SELECT ID_restoran, Naziv FROM Restoran 
WHERE Naziv LIKE '%an%'


SELECT ID_jelo, Naziv FROM Jelo
WHERE Velicina_porcije IS NULL


SELECT Naziv, Velicina_porcije FROM Jelo
WHERE Velicina_porcije IS NOT NULL


SELECT 
AVG(Cijena) AS 'Prosječna cijena',
MIN(Cijena) AS 'Najmanja cijena',
MAX(Cijena) AS 'Najveća cijena'
FROM Meni

SELECT
AVG(Ocjena) AS 'Prosječna ocjena',
MIN(Ocjena) AS 'Najmanja ocjena',
MAX(Ocjena) AS 'Najveća ocjena'
FROM Recenzija

SELECT
MIN(ID_grad) AS 'Najmanji poštanski broj', 
MAX(ID_grad) AS 'Najveći poštanski broj'
FROM Grad

SELECT * FROM Kupac WHERE Ime LIKE 'A%' AND Mjesto LIKE '%ka'

SELECT DISTINCT Metoda_placanja FROM Placanje
SELECT DISTINCT Narudzba_status FROM Narudzba

SELECT COUNT(DISTINCT Metoda_placanja) FROM Placanje
SELECT COUNT(DISTINCT Naziv) FROM Recenzija

SELECT * 
FROM Recenzija
WHERE Ocjena BETWEEN 2 AND 4

SELECT * FROM Grad WHERE Naziv LIKE '%r%'


SELECT Kupac.ime, Placanje.Banka, Placanje.Metoda_placanja FROM Kupac
LEFT JOIN Placanje ON Kupac.ID_kupac = Placanje.ID_kupac
WHERE Placanje.Banka = 'BBI banka'

SELECT Narudzba.Datum_narucivanja, Narudzba.Narudzba_status FROM Narudzba 
RIGHT JOIN Kupac ON Narudzba.ID_kupac = Kupac.ID_kupac
ORDER BY Narudzba.ID_narudzba

---- SPAJANJE TABELA ----


---- INNER JOIN ----

SELECT * FROM Kupac
INNER JOIN Recenzija ON Kupac.ID_kupac = Recenzija.ID_kupac

SELECT Ime,Prezime FROM Kupac
INNER JOIN Recenzija ON Kupac.ID_kupac = Recenzija.ID_kupac

SELECT * FROM Restoran
INNER JOIN Narudzba ON Restoran.ID_restoran = Narudzba.ID_restoran

SELECT * FROM Narudzba
INNER JOIN Restoran ON Narudzba.ID_restoran = Restoran.ID_restoran

SELECT  * FROM Kupac 
INNER JOIN Narudzba ON Kupac.ID_kupac=Narudzba.ID_narudzba 
WHERE Datum_narucivanja LIKE '2020%' AND Narudzba_status='U pripremi'


---- LEFT OUTER JOIN ----

SELECT * FROM Grad
LEFT OUTER JOIN Restoran ON Grad.ID_grad= Restoran.ID_grad

SELECT * FROM Restoran
LEFT OUTER JOIN Grad ON Restoran.ID_grad= Grad.ID_grad

SELECT * FROM Grad
LEFT OUTER JOIN Kupac ON Grad.ID_grad= Kupac.ID_grad    

SELECT * FROM Kupac
LEFT OUTER JOIN Grad ON Kupac.ID_grad= Grad.ID_grad     


---- RIGHT OUTER JOIN ----


SELECT Grad.Naziv, Pozivni_broj FROM Grad
RIGHT OUTER JOIN Restoran ON Grad.ID_grad= Restoran.ID_grad

SELECT ID_recenzija,Komentar, Ocjena FROM Recenzija
RIGHT OUTER JOIN Restoran ON Recenzija.ID_restoran= Restoran.ID_restoran

SELECT Restoran.Naziv, Restoran.Adresa 'Adresa restorana',Radno_vrijeme  FROM Restoran
RIGHT OUTER JOIN Recenzija ON Restoran.ID_restoran= Recenzija.ID_restoran

SELECT  Restoran.Naziv,Restoran.Adresa 'Adresa restorana' FROM Restoran
RIGHT OUTER JOIN Grad ON Restoran.ID_grad= Grad.ID_grad

--SELECT * FROM Restoran
--RIGHT OUTER JOIN Grad ON Restoran.ID_grad= Grad.ID_grad    za provjeru gradova koji nemaju restoran



---- FULL OUTER JOIN ----


SELECT * FROM Meni
FULL OUTER JOIN Restoran ON Meni.ID_restoran= Restoran.ID_restoran

SELECT * FROM Recenzija
FULL OUTER JOIN Restoran ON Recenzija.ID_restoran= Restoran.ID_restoran

