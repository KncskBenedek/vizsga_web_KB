use vizsga
go

insert into tema (temanev) values('gyümölcs');
go
insert into tema (temanev) values('zöldség');

go

insert into szavak (angol, magyar, temaId) values ('apple','alma',1);
go
insert into szavak (angol, magyar, temaId) values ('grape','szõlõ',1);
go
insert into szavak (angol, magyar, temaId) values ('pineapple','ananász',1);
go
insert into szavak (angol, magyar, temaId) values ('cabbage','káposzta',2);
go
insert into szavak (angol, magyar, temaId) values ('pepper','paprika',2);
go
insert into szavak (angol, magyar, temaId) values ('tomato','paradicsom',2);