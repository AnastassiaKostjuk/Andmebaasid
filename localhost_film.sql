CREATE TABLE film(
filmID int PRIMARY KEY AUTO_INCREMENT,
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1));

INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('', 2024, 555555.5)
