drop database if exists controlbd;
create database controlbd;
use controlbd;

create table ciudad(
cod_c int(3) zerofill auto_increment primary key,
nombre varchar(30));
alter table ciudad auto_increment = 100;

create table empleado(
cod_e int(4) zerofill auto_increment primary key,
nombre varchar(20),
apellidos varchar(30),
fnac date,
ciudad int(3) zerofill,
departamento int(3) zerofill,
salario decimal(8,2),
foreign key (ciudad) references ciudad(cod_c));
alter table empleado auto_increment = 1000;

create table jefe(
cod_e int zerofill primary key,
cod_j int zerofill,
foreign key (cod_e) references empleado(cod_e),
foreign key (cod_j) references empleado(cod_e));

create table proyecto(
cod_p int(5) zerofill auto_increment primary key,
nombre varchar(20),
finicio date,
ffin date);
alter table proyecto auto_increment = 01000;

create table trabaja(
cod_e int zerofill,
cod_p int(5) zerofill,
incorporacion date,
cese date,
primary key(cod_e,cod_p));

create table departamento(
cod_d int(3) zerofill auto_increment primary key,
nombre varchar(30),
responsable int(4) zerofill,
foreign key (responsable) references empleado(cod_e));
alter table departamento auto_increment = 100;

alter table empleado add foreign key (departamento) references departamento(cod_d);

insert into ciudad (nombre) values ("Madrid");
insert into ciudad (nombre) values ("Majadahonda");
insert into ciudad (nombre) values ("Alcobendas");
insert into ciudad (nombre) values ("Alcorcón");
insert into ciudad (nombre) values ("Alcalá");
insert into ciudad (nombre) values ("Leganés");
insert into ciudad (nombre) values ("Coslada");
insert into ciudad (nombre) values ("Villalba");
insert into ciudad (nombre) values ("Móstoles");

insert into departamento (nombre) values ("Dirección");
insert into empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Borja","Sanz Castejón","1956-10-23",100,100,120500.00);
update departamento set responsable = 1000 where cod_d = 100;
insert into empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Emilio","Pérez Gorjón","1981-04-18",104,100,31200.00);

insert into departamento (nombre) values ("RRHH");
insert into empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Luisa","Fernández Puenteviejo","1971-05-31",101,101,78000.00);
update departamento set responsable = 1002 where cod_d = 101;

insert into departamento (nombre) values ("Ventas");
insert into empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Javier","González Treviño","1967-11-30",102,102,82000.00);
update departamento set responsable = 1003 where cod_d = 102;

insert into departamento (nombre) values ("Administración de Sistemas");
insert into empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Ana Isabel","Fernández Castillo","1976-11-30",103,103,87000.00);
update departamento set responsable = 1004 where cod_d = 103;

insert into departamento (nombre) values ("Desarrollo interno");
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Agustín","López Aguirre","1980-4-2",108,104,43600.00);
update departamento set responsable = 1005 where cod_d = 104;

insert into departamento (nombre) values ("Desarrollo web Java");
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Teresa","Botillo de Castro","1972-10-22",100,105,51200.00);
update departamento set responsable = 1006 where cod_d = 105;

insert into departamento (nombre) values ("Desarrollo web PHP");
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Iván","del Castillo Abascal","1981-03-29",100,106,44800.00);
update departamento set responsable = 1007 where cod_d = 106;

insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Juan","Galve Rodríguez","1978-7-19",105,101,32900.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Saúl","Pérez González","1986-11-09",100,101,24600.00);

insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Miguel","Rodríguez Castro","1980-10-7",103,102,36600.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Belén","García Reviejo","1976-6-14",103,102,31200.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Miguel","González Fernández","1979-1-2",104,102,27400.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Aurora","Arias Delgado","1983-1-3",106,102,23400.00);


insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Jacinta","Alonso de Miguel","1971-12-27",101,103,51400.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Gonzalo","García Smith","1978-4-30",107,103,42600.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Gerardo","Méndez Galindo","1984-3-1",105,103,33000.00);


insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Ulises","Vélez Huidrovo","1969-8-12",100,104,40600.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Belén","Velázquez Yagüe","1975-9-25",101,104,37200.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Miguel","Zapatero Vergara","1974-8-15",106,104,33400.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Estefanía","Márquez Fernández","1981-7-19",107,104,29400.00);

insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Mariano","González Pastor","1968-2-22",101,105,49200.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Fernando","Gómez López","1979-11-5",100,105,44100.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("María","Sastre Hito","1978-2-19",105,105,40000.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Julián","Estévez Angulo","1979-8-1",104,105,37700.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Iván","Santos Rodríguez","1980-2-16",105,105,34800.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Salomé","Mínguez Mínguez","1979-3-31",100,105,33000.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Alonso","Toledo Delgado","1985-9-28",100,105,32800.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Javier","Chamorro Gala","1987-8-1",108,105,28100.00);

insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Adrián","Utrero García","1975-5-31",100,106,50000.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Jorge","Rodríguez Maestre","1979-12-1",100,106,39600.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Pedro","González Sagún","1982-6-13",102,106,36500.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Pablo","Fernández Maestre","1984-7-2",107,106,32100.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Julio","Pérez Pérez","1984-9-11",105,106,30900.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Asdrúbal","Saldívar Cheste","1990-5-1",103,106,28000.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Esther","Minaya Parra","1992-4-8",101,106,2600.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Hugo","Semedeler Wacken","1994-8-1",100,106,22000.00);

insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Pablo","Cascos Álvarez","1992-5-18",100,105,25300.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Felipe","Estévez Toledo","1992-10-21",100,105,24900.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Iván","Hélice Márquez","1993-2-26",100,106,24500.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Cristina","Pozo Delibes","1994-10-12",103,106,23800.00);
insert into  empleado (nombre,apellidos,fnac,ciudad,departamento,salario) values ("Darío","López Van Ruute","1995-3-1",100,106,22000.00);

insert into jefe values (1001,1000);

insert into jefe values (1008,1002);
insert into jefe values (1009,1008);

insert into jefe values (1010,1003);
insert into jefe values (1011,1003);
insert into jefe values (1012,1010);
insert into jefe values (1013,1010);

insert into jefe values (1014,1004);
insert into jefe values (1015,1004);
insert into jefe values (1016,1014);

insert into jefe values (1017,1005);
insert into jefe values (1018,1017);
insert into jefe values (1019,1017);
insert into jefe values (1020,1017);

insert into jefe values (1021,1006);
insert into jefe values (1022,1006);
insert into jefe values (1023,1006);
insert into jefe values (1024,1023);
insert into jefe values (1025,1023);
insert into jefe values (1026,1022);
insert into jefe values (1027,1022);
insert into jefe values (1028,1021);
insert into jefe values (1037,1021);
insert into jefe values (1038,1021);

insert into jefe values (1029,1007);
insert into jefe values (1030,1007);
insert into jefe values (1031,1030);
insert into jefe values (1032,1030);
insert into jefe values (1033,1030);
insert into jefe values (1034,1030);
insert into jefe values (1035,1029);
insert into jefe values (1036,1029);
insert into jefe values (1039,1029);
insert into jefe values (1040,1029);
insert into jefe values (1041,1029);

insert into jefe values (1002,1000);
insert into jefe values (1003,1000);
insert into jefe values (1004,1000);
insert into jefe values (1005,1000);
insert into jefe values (1006,1000);
insert into jefe values (1007,1000);

insert into proyecto (nombre,finicio,ffin) values ("Secretaría","2010-4-14",null);
insert into proyecto (nombre,finicio,ffin) values ("Instalación General","2010-4-14","2010-7-25");

insert into proyecto (nombre,finicio,ffin) values ("Cliente Orange","2010-5-21","2014-2-18");
insert into proyecto (nombre,finicio,ffin) values ("Cliente Ayto. Parla","2011-10-2","2019-8-20");
insert into proyecto (nombre,finicio,ffin) values ("Cliente C. Sanidad","2015-9-1",null);
insert into proyecto (nombre,finicio,ffin) values ("Cliente Novadis","2013-4-15",null);
insert into proyecto (nombre,finicio,ffin) values ("Cliente Telenium","2014-9-15",null);
insert into proyecto (nombre,finicio,ffin) values ("Cliente Acerinox","2017-9-15",null);
insert into proyecto (nombre,finicio,ffin) values ("Cliente BBVA","2016-2-15",null);

insert into proyecto (nombre,finicio,ffin) values ("Mantenimiento","2010-9-1",null);
insert into proyecto (nombre,finicio,ffin) values ("Instalación serv HP ","2016-12-2","2017-1-13");
insert into proyecto (nombre,finicio,ffin) values ("Servicios nube","2017-5-11",null);

insert into proyecto (nombre,finicio,ffin) values ("Nominas","2010-9-1",null);
insert into proyecto (nombre,finicio,ffin) values ("Subvenciones","2018-6-30",null);
insert into proyecto (nombre,finicio,ffin) values ("Prevención riesgos","2012-9-1",null);

insert into proyecto (nombre,finicio,ffin) values ("Web Telenium","2015-01-15","2015-06-12");
insert into proyecto (nombre,finicio,ffin) values ("Intranet Telenium","2015-9-20",null);
insert into proyecto (nombre,finicio,ffin) values ("App pers Parla","2012-1-1","2013-02-15");

insert into proyecto (nombre,finicio,ffin) values ("Web Novadis","2016-2-15","2017-01-12");
insert into proyecto (nombre,finicio,ffin) values ("Intranet Acerinox","2017-10-10",null);
insert into proyecto (nombre,finicio,ffin) values ("App inversiones","2016-4-1","2019-04-24");
insert into proyecto (nombre,finicio,ffin) values ("Tarificador Orange","2017-03-21",null);
insert into proyecto (nombre,finicio,ffin) values ("Intranet Novadis","2015-9-20",null);
insert into proyecto (nombre,finicio,ffin) values ("App pers Parla","2012-1-1","2013-02-15");
insert into proyecto (nombre,finicio,ffin) values ("Web Telenium","2015-01-15","2015-06-12");
insert into proyecto (nombre,finicio,ffin) values ("Intranet Telenium","2015-9-20",null);
insert into proyecto (nombre,finicio,ffin) values ("App pers Parla","2012-1-1","2013-02-15");

insert into trabaja values (1001,01000,"2011-04-10",null);
insert into trabaja values (1001,01012,"2010-04-14","2011-04-09");

insert into trabaja values (1008,01012,"2010-09-01",null);
insert into trabaja values (1002,01013,"2018-06-30",null);
insert into trabaja values (1009,01012,"2015-09-01","2018-12-12");
insert into trabaja values (1009,01014,"2012-09-01","2015-08-31");
insert into trabaja values (1008,01014,"2015-09-01",null);


insert into trabaja values (1003,01002,"2010-05-10","2013-04-15");
insert into trabaja values (1003,01003,"2013-04-15","2019-08-01");
insert into trabaja values (1003,01005,"2017-09-15","2019-02-23");
insert into trabaja values (1003,01008,"2015-09-01","2020-03-08");
insert into trabaja values (1010,01004,"2014-09-15","2019-11-13");
insert into trabaja values (1010,01006,"2016-02-15",null);
insert into trabaja values (1010,01007,"2011-10-02","2019-03-20");
insert into trabaja values (1011,01003,"2013-10-30",null);
insert into trabaja values (1011,01006,"2017-01-01",null);
insert into trabaja values (1011,01008,"2017-11-27","2020-01-01");
insert into trabaja values (1012,01006,"2018-12-10",null);
insert into trabaja values (1012,01005,"2019-02-04",null);
insert into trabaja values (1013,01002,"2010-09-21","2014-02-18");


insert into trabaja values (1004,01001,"2010-04-14","2010-06-01");
insert into trabaja values (1004,01009,"2010-09-01","2013-12-18");
insert into trabaja values (1004,01010,"2017-05-11",null);
insert into trabaja values (1004,01011,"2016-12-02","2017-01-07");
insert into trabaja values (1014,01001,"2010-05-01","2010-07-25");
insert into trabaja values (1014,01009,"2010-09-01",null);
insert into trabaja values (1015,01010,"2017-05-11","2014-02-18");
insert into trabaja values (1015,01009,"2014-02-25",null);
insert into trabaja values (1016,01011,"2010-09-21","2017-01-13");
insert into trabaja values (1016,01009,"2017-01-31",null);


insert into trabaja values (1005,01001,"2010-04-14","2010-05-21");
insert into trabaja values (1005,01009,"2010-05-14",null);
insert into trabaja values (1005,01010,"2017-05-21","2017-11-25");
insert into trabaja values (1005,01011,"2016-12-14","2017-01-11");
insert into trabaja values (1017,01010,"2017-06-29","2019-03-01");
insert into trabaja values (1017,01009,"2019-03-14",null);
insert into trabaja values (1017,01011,"2016-12-16","2016-12-30");
insert into trabaja values (1018,01014,"2012-09-01","2012-11-15");
insert into trabaja values (1018,01009,"2012-12-01",null);
insert into trabaja values (1019,01009,"2015-10-24",null);
insert into trabaja values (1020,01009,"2019-01-04",null);

insert into proyecto (nombre, finicio,ffin) values ("Web Orange","2011-01-15","2016-04-20");
insert into proyecto (nombre, finicio,ffin) values ("Web Novadis","2012-02-25","2013-01-31");
insert into proyecto (nombre, finicio,ffin) values ("Intranet Orange","2015-07-13",null);
insert into proyecto (nombre, finicio,ffin) values ("Web Acerinox","2015-09-06",null);
insert into proyecto (nombre, finicio,ffin) values ("Intranet Acerinox","2019-02-05","2020-04-10");
insert into proyecto (nombre, finicio,ffin) values ("Web services BBVA","2017-05-31",null);

insert into trabaja values (1006,01018,"2011-01-15","2016-04-20");
insert into trabaja values (1006,01020,"2015-07-13",null);
insert into trabaja values (1006,01023,"2017-05-31","2019-04-28");
insert into trabaja values (1021,01018,"2011-05-13","2016-04-20");
insert into trabaja values (1021,01020,"2015-07-13","2019-02-05");
insert into trabaja values (1021,01021,"2019-02-10",NULL);
insert into trabaja values (1022,01020,"2015-09-01",null);
insert into trabaja values (1023,01021,"2015-09-01",null);
insert into trabaja values (1024,01021,"2015-11-01",null);
insert into trabaja values (1025,01021,"2017-02-21",null);
insert into trabaja values (1026,01020,"2015-12-01",null);
insert into trabaja values (1027,01020,"2016-03-22",null);
insert into trabaja values (1028,01021,"2019-02-15",NULL);
insert into trabaja values (1037,01021,"2019-02-19",NULL);
insert into trabaja values (1038,01021,"2019-03-03",NULL);

insert into trabaja values (1007,01017,"2012-01-01","2013-02-15");
insert into trabaja values (1007,01019,"2012-02-25","2013-01-31");
insert into trabaja values (1007,01015,"2015-01-15","2015-06-12");
insert into trabaja values (1007,01016,"2012-09-20",null);
insert into trabaja values (1029,01019,"2012-02-24","2013-01-31");
insert into trabaja values (1029,01016,"2015-09-20",null);
insert into trabaja values (1035,01016,"2015-10-04",null);
insert into trabaja values (1036,01016,"2015-12-20",null);
insert into trabaja values (1039,01016,"2016-09-24",null);
insert into trabaja values (1040,01016,"2020-04-10",null);
insert into trabaja values (1041,01016,"2020-04-10",null);
insert into trabaja values (1030,01017,"2012-01-01","2013-02-15");
insert into trabaja values (1016,01016,"2015-09-20","2019-02-05");
insert into trabaja values (1016,01022,"2019-02-05","2020-04-10");
insert into trabaja values (1031,01022,"2019-02-05","2020-04-10");
insert into trabaja values (1032,01022,"2019-02-05","2020-04-10");
insert into trabaja values (1033,01022,"2019-02-05","2020-04-10");
insert into trabaja values (1034,01022,"2019-02-05","2020-04-10");
