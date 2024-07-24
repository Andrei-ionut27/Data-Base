/* Crearea unei tabele */
create database petclinic;
CREATE TABLE Owners (
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL
);

/*Adaugarea unei coloane intr-o tabela */

alter table petowner
add column age int;
alter table petowner add column City varchar(50);
/* Stergerea unei coloane din tabala- drop sau drop column */

alter table owners
drop age;

/* Modify - poate sa modifice proprietatile unei coloane
Atentie!!
Daca in momentul in care executam intructiunea nu specificam 
toate proprietatile care le-am specificat la creare, ele vor fi sterse */

desc petowner;   /*arata structura tabelei*/

alter table owners modify firstname char(25) not null; /* trebuie sa specifici iarasi "not null"
daca nu se va sterge */

alter table owners modify lastname char(25) not null;
/* Instructiunea de CHANGE ne ajuta sa schimbam numele unei coloane */
alter table owners change lastname Ancuta char(25) not null;
alter table owners change Magdau Ancuta char(25) not null;
alter table owners
drop AncutaMagdau;
alter table owners
add column Magdau char;
alter table owners modify Magdau char(25) not null;

/* Instructiunea de rename ne ajuta sa schimbam numele tabelei */

alter table owners rename to PetOwner;
/* " drop table petowner; " sterge tabela cu toate informatile  si nu se pot recupera */
alter table petowner
add column age int;
alter table petowner change Ancuta FirstName char(25) not null;
alter table petowner change Magdau LastName char(25) not null;
alter table petowner add column dateofbirth date;
/* Adauga doua randuri in coloana*/
insert into petowner values ('Florea', 'Maria', '55', '1969-05-10'),('Florea', 'Andrei', '32', '1991-11-14');

/* Verificam rezultatele instructiuni de insert*/
select *from petowner;

/*update petowner set FirstName = 'Nume'; ---Se face update la toate randurile la firstname*/

/* Intructiune de delete sterge toate inregistrarile din tabela ori truncate face acelas lucru*/
delete from petowner;
truncate petowner; /* doar nu e nevoie sa scri si " from "*/
/* Diferenta dintre ele e ca delete poti sa filtrezi ce vrei sa stergi dar cu truncate nu se poate
A doua diff e ca delete numara ce sterge iar truncate nu */

/* aici selectezi doar coloana pe care o scrii*/
select firstname, lastname from petowner;
insert into petowner (firstname, LastName, age, dateofbirth)
value ('Magdau', 'Ancuta', '35', '1988-05-12');
insert into petowner (firstname, LastName, age, dateofbirth)
value ('Magdau', 'Ileana', '75', '1868-03-20');
select * from petowner where age >=32;
select * from petowner where age <=32;
select * from petowner where age >32;
select * from petowner where age <32;
select *from petowner;

select * from petowner where FirstName in ('Florea');
select * from petowner where FirstName not in ('Florea');
update petowner set City = 'Maramures' where firstname = 'Magdau';
select * from petowner where city is null;
select * from petowner where city is not null;
select * from petowner where  age != 32;
select * from petowner where age between 33 and 40;

select * from petowner;
/* Se selecteaza doar ce cuvinte are in first name*/
select * from petowner where FirstName like 'M%';
select * from petowner where FirstName like '%au';
select * from petowner where FirstName like '%M%';

select * from petowner where firstname like 'ma%'
and dateofbirth like '19%';

/* Cu paranteze prioritizezi ce sa faca prima daca--- or este egal cu +- si and este *% 
intodeauna inmultirea si inpartirea are prioritate dar daca punem paranteze atunci +- are 
prioritate*/
select * from petowner where (firstname like 'ma%'
or dateofbirth like '198%')
and age like '35';

/* Aduna varsta tuturor*/
select sum(age) from petowner;
/* imparte varta la cati sunt in tabela-- noi avem 4( anca,andrei,maria si ileana)*/
select avg(age) from petowner;
/* returneaza cea m-ai mica varsta*/
select min(age) from petowner;
/* returneaza varsta maxima*/
select max(age) from petowner;
/* returneaza inregistrarile adica patru coloane am (anca,andrei,maria si ileana)*/
select count(*) from petowner;
select count(city) from petowner;

/* setting perimary key*/

alter table petowner add column Ownerid int primary key auto_increment;
desc petowner;
alter table petowner modify column Ownerid int auto_increment first;
insert into petowner (firstname, LastName, age, dateofbirth)
value ('Magdau', 'Carla', '20', '2005-03-10');
select * from petowner;

create table pets (
petid int not null auto_increment,
race varchar(45) not null,
dateofbirth date not null,
ownerid int not null,
primary key (petid),
constraint fk_pets_petowner foreign key (ownerid) references petowner(ownerid)
);

select * from petowner;
select * from pets;
insert into pets (race, dateofbirth, ownerid)
value ('Bishon','2019-04-16',2);
insert into pets (race, dateofbirth, ownerid)
value ('pisica','2014-01-13',1);
insert into pets (race, dateofbirth, ownerid)
value ('Copoi','2011-07-28',3);


/*JOIN*/
select *from petowner cross join pets;
select *from petowner inner join pets on petowner.ownerid = pets.ownerid;
select *from petowner left join pets on petowner.ownerid = pets.ownerid;
select *from petowner left join pets on petowner.ownerid = pets.ownerid where pets.ownerid is null;
select *from petowner left join pets on petowner.ownerid = pets.ownerid where pets.ownerid is not null;
select *from petowner right join pets on petowner.ownerid = pets.ownerid;

/* Cross join -- se vor aduce toatea combinatile intre inregistrarile din tabela din dreapta
si cea din stanga.
Inner join -- se vor aduce toate datele care exista in ambele tabele, comparatia facandu-se 
pe coloana pe care se face conditia de join.
Left join -- se aduc toate inregistrarile din tabela din stanga si se compara cu cele din dreapta
         -- Astfel se vor aduce toate randurile din tabela din stanga, iar coloanele aferente
         tabelei din dreapta se va colpleta doar pentru randurile care au echivalent.
        -- Adica cele caror cheie primara exista in tabela din dreapta.
Right join -- se aduc toate inregistrarile din tabele din dreapta si se compara cu cele din stanga.
		   -- Astfel se vor aduce toate randurile din tabela din dreapta iar pe coloanele
           aferente tabelei din stanga se va commpleta doar pentru randurile care au echivalent.
           -- Adica cele a caror cheie primara exista in tabela din stanga.
*/
select * from petowner;
select * from pets;
select * from petowner order by dateofbirth; -- sortarea se face by default ascendent
select * from petowner order by dateofbirth desc; -- desc= descending
select * from petowner order by age desc limit 3;

/* Grupeaza cei care au pets*/
select o.ownerid,firstname,lastname, count(petid)
from petowner o inner join pets p on o.Ownerid = p.ownerid
group by o.Ownerid, firstname, lastname;

select o.ownerid,firstname,lastname, count(petid)
from petowner o inner join pets p on o.Ownerid = p.ownerid
group by o.Ownerid, firstname, lastname
having count(petid)>=1;

/* In mod normal filtrarea se face cu clauza where, sigura exceptie fiind functile
agregate care se pot filtra doar cu clauza having. */

select * from petowner inner join pets on petowner.Ownerid = pets.ownerid;
/* Alias pe de la petowner si p de la pets*/
select * from petowner pe inner join pets p on pe.Ownerid = p.ownerid;

select pe.ownerid, firstname, lastname, race, pe.dateofbirth owner, p.dateofbirth pet
from petowner pe inner join pets p on pe.Ownerid = p.ownerid;



