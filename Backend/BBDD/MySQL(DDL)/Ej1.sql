
drop database if exists ex04a;
create database ex04a;
use ex04a;

create table T1(
h1 int,
b1 int(5) zerofill,
c1 varchar(2) not null,
c2 numeric(5,2),
primary key(h1,b1));



create table Tb(
a1 int(5) zerofill auto_increment primary key,
a2 double default 4.75,
a3 date,
a4 enum("D1","D2","D3","D4"),
unique (a2,a4));



alter table T1 add foreign key(b1) references Tb(a1) on delete cascade on update cascade;

create table Tc(
x1 enum("D1","D2","D3","D4") primary key,
x2 double default 4.75,
x4 varchar(30) default "Begin",
foreign key (x2,x1) references Tb(a2,a4) on delete cascade on update restrict);

