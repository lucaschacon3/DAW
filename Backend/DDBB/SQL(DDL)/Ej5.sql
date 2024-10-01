create database cont1A;
use cont1A;

create table T1(
h1 int default '111',
b1 int zerofill,
c1 varchar(2) not null,
c2 decimal(5,2),
constraint PK_T1 primary key(b1)
);

create table Tb(
a1 int zerofill auto_increment,
a2 decimal(10,4) not null,
a3 date default '2010-1-21',
a4 enum('AS', 'BD', 'NO', 'PY') not null,
constraint UQ_Tb unique(a2, a4),
constraint FK_Tb_a1 foreign key(a1) references T1(b1)
);

create table Tc(
x1 enum('AS', 'BD', 'NO', 'PY'),
x2 decimal(10,4) not null,
x4 varchar(30) not null,
constraint PK_Tc primary key(x1, x2)
);

alter table Tb add constraint FK_Tb_Tc foreign key(a4, a2) references Tc(x1, x2);
