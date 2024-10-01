
drop database if exists ex04b;
create database ex04b;
use ex04b;

create table T1(
h1 int default 111,
b1 int unsigned primary key,
c1 varchar(2) not null,
c2 numeric(5,2));


create table Tb(
a1 int unsigned auto_increment primary key,
a2 numeric(10,4) not null,
a3 date default "2010-01-21",
a4 enum("AS","BD","NO","PY"),
unique(a4,a2),
foreign key(a1) references T1(b1) on delete restrict on update cascade);


create table Tc(
x1 enum("AS","BD","NO","PY"),
x2 numeric(10,4),
x4 varchar(30) not null,
primary key (x1,x2));


alter table Tb add foreign key (a4,a2) references Tc(x1,x2) on delete cascade on update cascade;
