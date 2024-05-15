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

drop table Marimi_Produse;

create table Marimi_Produse (
ID_Produs int not null auto_increment,
ID_Marime int,
primary key (ID_Produs)
);

drop table marimi;

create table Marimi (
ID_Marime int not null auto_increment,
Tip_Marime char(1),
Cod_Marime char(4),
primary key (ID_Marime)
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

# DML- Data Manipulation Language

# Varianta 1

INSERT INTO LISTA_PRODUSE (ID_Produse, TIP_PRODUS, COD_PRODUS, GENDER, PRET, DESCRIERE_PRODUS)
VALUES (1, 'Haine', 'T123456789', 'F', '20', 'Camasa dama');

# Varianta 2

INSERT INTO LISTA_PRODUSE VALUES (2, 'Haine', 'T123456799', 'Bluza dama', 'F', 40);

# Varianta 3

INSERT INTO LISTA_PRODUSE VALUES (5, 'Haine', 'T123456799', 'tricou dama', 'F', 80),
(6, 'incaltaminte', 'T12345679', 'Adidasi', 'M', 400);

desc lista_produse;
select * from lista_produse;

# Auto increment

INSERT INTO LISTA_PRODUSE (TIP_PRODUS, COD_PRODUS, GENDER, PRET, DESCRIERE_PRODUS) 
VALUES ('Haine', 'CODTEST', 'F', '20', 'Tricou dama');

# Delete

delete from lista_produse where ID_Produse = 7;
delete from lista_produse;
set sql_safe_updates = 0;

# update

update lista_produse
set cod_produs = '555'
where ID_produse = 1;

select * from lista_produse;

update lista_produse
set Pret = 300;

insert into culori values (1, 'Alb'),
(2, 'Negru'),
(3, 'Albastru'),
(4, 'Verde'),
(5, 'Rosu');

insert into culori_produse values (1,2),(1,3),(1,4),(2,4),(2,5);
select * from culori;
select * from culori_produse;

delete from lista_produse
where ID_Produse = 1;

# Ca sa putem sterge trebuie prima data sa stergem legaturile care tine de id_produse 1;

/*Error Code: 1451. Cannot delete or update a parent row:
 a foreign key constraint fails (`magazin_ift`.`culori_produse`,
 CONSTRAINT `culori_produse_ibfk_1` FOREIGN KEY (`ID_PRODUS`) REFERENCES
 `lista_produse` (`ID_Produse`))*/

delete from lista_produse;

/* Error Code: 1451. Cannot delete or update a parent row: 
a foreign key constraint fails (`magazin_ift`.`culori_produse`, 
CONSTRAINT `culori_produse_ibfk_1` FOREIGN KEY (`ID_PRODUS`) REFERENCES
 `lista_produse` (`ID_Produse`))
*/

update lista_produse
set Pret = 700;

select * from lista_produse;


