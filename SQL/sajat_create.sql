create database vizsga
go
use vizsga
go
create table tema
(
	id int identity(1,1),
	temanev varchar(20) not null,
	timestamps datetime default(getdate()),
	primary key(id)
)
go
create table szavak
(
	id int identity(1,1),
	angol varchar(40),
	magyar varchar(40),
	temaId int,
	timestamps datetime default(getdate()),
	primary key(id)
)
go
alter table szavak
add foreign key(temaId) references tema(id)