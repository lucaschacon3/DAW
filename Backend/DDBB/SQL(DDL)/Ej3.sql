
drop database if exists ex04c;
create database ex04c;
use ex04c;

create table T1(
h1 int(3) zerofill,
b1 int(5) not null,
c1 varchar(2),
c2 enum("D1","D2","D3","D4") default "D2",
c3 varchar(2),
primary key(h1,c1),
unique (c1),
foreign key (c3) references T1(c1) on delete set null on update cascade));


create table Tb(
a1 int(3) zerofill auto_increment primary key,
a2 double default "-1.2",
a3 date,
a4 enum("D1","D2","D3","D4"));

create table Tc(
x1 varchar(2) primary key,
x2 int unsigned not null,
x4 varchar(30));


alter table T1 add foreign key(h1) references Tb(a1) on delete restrict on update cascade;
alter table T1 add foreign key(c1) references Tc(x1) on delete cascade on update cascade;


