--sql salvestatud protseduurid -- funktsioonid - mitu sql käsku käivitakse järjest
--sql server
create database procTARgv24;

use procTARgv24;
create table uudised(
uudisID int PRIMARY	 KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text)

select * from uudised;
insert into uudised(uudiseTeema, kuupaev, autor, kirjeldus)
values('udune ilm', '2024-02-06', 'postimees', 'Lõunani on udune ilm')
--protseduuri loomine
--sisestab uudised tabelisse ja kohe näitab
create procedure lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(20),
@kirjeldus text
as
begin

insert into uudised(uudiseTeema, kuupaev, autor, kirjeldus)
values(@uusTeema, @paev, @autor, @kirjeldus);
select * from uudised;

end;
--kutse
exec lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'w11 ei toota multimeedia klassis';
--teine kutse voimalus
exec lisaUudis 
@uusTeema='1.marts on juba kevad',
@paev='2025-02-06',
@autor='test',
@kirjeldus='puudub';

--protseduur, mis kustutab tabelist id jargi
create procedure kustutaUudis
@id int
as
begin
select *from uudised;
delete from uudised where uudisID=@id;
select * from uudised;
end;
--kutse
exec kustutaUudis 3;
--exec kustutaUudis @id=3;

update uudised set kirjeldus='uus kirjeldus'
where kirjeldus like 'puudub';
select * from uudised;

--protseduur mis uuendab andmed tabelis/update

create procedure uuendaKirjeldus
@uusKirjeldus text
as
begin
select * from uudised;
update uudised set kirjeldus=@uusKirjeldus
where kirjeldus like 'puudub';
select * from uudised;
end;

--kutse
exec uuendaKirjeldus 'uus tekst kirjelduses';

--protseduur mis otsib ja naitab uudist esimese tahte jargi
create procedure otsingUudiseTeema
@taht char(1)
as
begin
select * from uudised
where uudiseTeema like @taht +'%'; --pervaja bukva i vse ostalnyje simvoly
end;
--kutse
exec otsingUudiseTeema 'w';
