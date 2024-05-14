create database Magazin_IFT;
use Magazin_IFT;

create table Lista_Produse (
ID_Produse int Primary key auto_increment,
Tip_Produs varchar(20),
Cod_Produs varchar(10),
Descriere_Produs varchar(20),
Gender char(1)
);

CREATE TABLE CULORI (
ID_CULOARE INT NOT NULL AUTO_INCREMENT,
CULOARE VARCHAR(20),
PRIMARY KEY (ID_CULOARE)
);
CREATE TABLE CULORI_PRODUSE (
	ID_PRODUS INT,
    ID_CULOARE INT,
    foreign key (ID_PRODUS) references LISTA_PRODUSE(ID_Produse),
    foreign key (ID_CULOARE) references CULORI(ID_CULOARE)
);
alter table Lista_Produse add column Pret int not null;
Select*from Lista_Produse;

create table Marimi_Produse (
ID_Produs int,
ID_Marime int
);

create table Marimi (
ID_Marime int,
Tip_Marime char(1),
Cod_Marime char(4)
);

create table Retur_Produs (
Nr_zile_retur int,
Plata_retur int,
Stare_produs varchar(20)
);

RENAME TABLE LISTA_PRODUSE TO LISTA_PRODUSE_RENAMED;

RENAME TABLE LISTA_PRODUSE_RENAMED TO LISTA_PRODUSE;

ALTER TABLE LISTA_PRODUSE DROP COLUMN DESCRIERE_PRODUS;

ALTER TABLE lista_produse ADD COLUMN DESCRIERE_PRODUS VARCHAR(20);

ALTER TABLE LISTA_PRODUSE MODIFY COLUMN DESCRIERE_PRODUS CHAR(10);

ALTER TABLE LISTA_PRODUSE MODIFY COLUMN DESCRIERE_PRODUS VARCHAR(20);





