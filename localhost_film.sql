CREATE TABLE film(
filmID int PRIMARY KEY AUTO_INCREMENT,
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1));

INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('', 2024, 555555.5)

CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar(20) UNIQUE)

--xamp localhost
create table uudised(
uudisID int PRIMARY	 auto_increment,
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text)

insert into uudised(uudiseTeema, kuupaev, autor, kirjeldus)
values('udune ilm', '2024-02-06', 'postimees', 'Lõunani on udune ilm')
--xampp routines
begin
select *from uudised;
delete from uudised where uudisID=id;
select * from uudised;
end;
