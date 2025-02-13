use KostjukBaas;
create table laps(
lapsID int primary key identity(1,1),
nimi varchar(10) not null,
pikkus smallint,
synniaasta smallint,
synnilinn varchar(20));

select * from laps;

insert into laps(nimi, pikkus, synniaasta, synnilinn)
values('Kati', 156, 2001, 'Tallinn'),
('Jevgenia', 165, 1987, 'Tallinn'),
('Anastassia', 168, 1996, 'Kohtla-Jarve'),
('Viktoria', 170, 1974, 'Kohtla-Jarve'),
('Elizaveta', 156, 2005, 'Tartu'),
('Sofia', 163, 1998, 'Parnu');

--sorteerimine
--Asc, Desc suurimast vaikseni
select nimi, pikkus
from laps
order by pikkus desc;

select nimi, pikkus
from laps
order by pikkus desc, nimi;

--lapsed, mis on sundinud peale 2005
select nimi, synniaasta
from laps
where synniaasta >=2005
order by nimi;

--distinct naitab ainult uks kordus
select distinct synniaasta
from laps
where synniaasta >2000;

--between
--lapsed mis on sundinud (2000 kuni 2005)
select nimi, synniaasta
from laps
where synniaasta >=2000 and synniaasta <=2005;

select nimi, synniaasta
from laps
where synniaasta between 2000 and 2005; --dva odinakovyh rezultata

--like
--naita lapsed, kelle nimi algab S
--% koik voimalikud sumobolid
--sisaldab S taht - %S%
select nimi
from laps
where nimi like '%S%';

--tapsem maaratud tahtede arv _
select nimi
from laps
where nimi like '_a__';

--and/or
select nimi, synnilinn
from laps
where nimi like 'S%' or synnilinn like 'Tartu';

select nimi, synnilinn
from laps
where nimi like 'S%' and synnilinn like 'Tartu';

--Agregaatfunktsioonid
sum, avg, min, max, count
select count(nimi) as lasteArv
from laps;

select sum(pikkus) as 'summarne pikkus'
from laps;

select avg(pikkus) as 'keskmine pikkus'
from laps
where synnilinn='Tallinn';

--naita keskmine pikkus linnade jargi
--group by
select avg(pikkus) as 'keskmine pikkus', synnilinn
from laps
group by synnilinn;

--naita lapsed sundinud konkreetsel synniaastal
select synniaasta, count(*) as lasteArv
from laps
group by synniaasta;

--having - piirang juba grupeeritud andmete 
--keskmine pikkus iga synniaasta jargi
select synniaasta, avg(pikkus) as keskmine
from laps
group by synniaasta
having avg(pikkus)>156; --pokazyvaet tolko bolshe 156 sm

select synniaasta, avg(pikkus) as keskmine
from laps
where synniaasta=2001
group by synniaasta;

select synniaasta, avg(pikkus) as keskmine
from laps
where not synniaasta=2001
group by synniaasta;

--seotud tabel
create table loom(
loomID int primary key identity(1,1),
loomNimi varchar(50),
lapsID int,
foreign key(lapsID) references laps(lapsID));

insert into loom(loomNimi, lapsID)
values('kass Tom', 1),
('kass Apelsin', 1),
('koer Roksi', 2),
('koer Vesta', 3),
('kass Bella', 3),
('kass Pearl', 4),
('koer Rihard', 4);

select * from loom;

--select seotud tabelite pohjal
select * from loom, laps; -- ei nae oiged andmed

select * from loom
inner join laps
on loom.lapsID=laps.lapsID;

--lihtne vaade
select * from loom, laps
where loom.lapsID=laps.lapsID;

select l.loomNimi, la.nimi,  la.synniaasta
from loom l, laps la
where l.lapsID=la.lapsID;



