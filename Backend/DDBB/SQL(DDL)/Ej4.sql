
drop database if exists ex04d;
create database ex04d;
use ex04d;

create table T1(
h1 int unsigned,
b1 int(5) zerofill auto_increment primary key,
c1 varchar(2) not null,
c2 enum("D11","D22","D31","D42") default "D22" unique,
c3 date));



create table Tc(
x1 enum("D11","D22","D31","D42") primary key,
x2 double default 80.75,
x4 varchar(30),
foreign key(x1) references T1(c2) on delete cascade on update cascade);


create table Tb(
a1 double,
a2 date unique,
a3 enum("D11","D22","D31","D42") default "D31"),
foreign key(a3) references Tc(x1) on delete set null on update cascade,
primary key(a1,a2));


alter table T1 add foreign key(c3) references Tb(a2) on delete cascade on update cascade;
