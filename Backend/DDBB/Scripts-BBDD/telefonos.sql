drop database if exists telefonos;
create database telefonos;
use telefonos;

create table compania(
nombre varchar(20) primary key);

create table linea(
numero int primary key,
falta date not null,
fbaja date,
compania varchar(20),
foreign key (compania) references compania(nombre));

create table llamada(
numerorem int,
numerodes int,
finicio datetime,
ffin datetime,
primary key (numerorem,numerodes,finicio),
foreign key (numerorem) references linea(numero),
foreign key (numerodes) references linea(numero));

create table tarjeta(
cod_cci int auto_increment primary key,
linea int,
foreign key (linea) references linea(numero));
alter table tarjeta auto_increment = 1540900;

create table tipoterminal(
id int auto_increment primary key,
nombre varchar(10));

create table terminal(
imei int auto_increment primary key,
modelo varchar(30),
marca varchar(20),
memoria decimal(6,2),
tarjeta int,
tipo int,
precio decimal(7,2),
foreign key (tarjeta) references tarjeta(cod_cci),
foreign key (tipo) references tipoterminal(id));
alter table terminal auto_increment = 894;

create table cargo(
nombre varchar(30) primary key,
nivel int);

create table usuario(
cod_e int auto_increment primary key,
nombre varchar (20),
apellidos varchar(30));
alter table usuario auto_increment = 1302;

create table usa(
terminal int,
cargo varchar(30),
usuario int,
finicio date,
ffin date,
primary key(terminal,cargo,usuario),
foreign key (terminal) references terminal(imei),
foreign key (cargo) references cargo(nombre),
foreign key (usuario) references usuario(cod_e));


insert into compania values ("Vomistar"),("Modafone"),("Yorange"),("Oigo");
insert into linea values (620020200,"2018-09-01",null,"Modafone");

insert into linea values (620020201,"2018-09-01",null,"Modafone");
insert into linea values (620020202,"2018-10-01",null,"Modafone");
insert into linea values (620020203,"2018-10-12",null,"Modafone");
insert into linea values (620020204,"2018-10-30","2019-12-22","Modafone");
insert into linea values (620020205,"2018-12-01",null,"Modafone");
insert into linea values (620020206,"2018-12-10","2019-11-15","Modafone");
insert into linea values (620020207,"2019-01-01",null,"Modafone");
insert into linea values (620020208,"2019-01-01","2020-02-28","Modafone");
insert into linea values (620020209,"2019-01-03",null,"Modafone");

insert into linea values (620445607,"2018-09-01",null,"Vomistar");
insert into linea values (620445608,"2019-01-21",null,"Vomistar");
insert into linea values (620445609,"2019-02-13","2020-03-01","Vomistar");
insert into linea values (620445610,"2019-07-31",null,"Vomistar");
insert into linea values (620445611,"2020-01-01",null,"Vomistar");
insert into linea values (620445612,"2020-1-18",null,"Vomistar");

insert into linea values (635230100,"2018-07-08",null,"Yorange");
insert into linea values (635230101,"2018-07-08",null,"Yorange");
insert into linea values (635230102,"2018-12-18",null,"Yorange");
insert into linea values (635230103,"2018-12-18","2019-11-15","Yorange");
insert into linea values (635230104,"2019-03-25",null,"Yorange");

insert into linea values (633909001,"2018-10-10",null,"Oigo");
insert into linea values (633909002,"2018-10-11","2019-12-03","Oigo");
insert into linea values (633909003,"2018-10-15",null,"Oigo");
insert into linea values (633909004,"2018-10-18","2020-02-14","Oigo");


insert into tarjeta (linea) select numero from linea where numero not in (620020206,635230102,633909003);
insert into tarjeta (linea) select numero from linea where numero in (select numero from linea where year(falta) = 2018);

insert into tipoterminal (nombre) values ("Movil"),("Tablet"),("ModemUSB");

insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540900,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",512,1540931,2,1200);

insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XT10",128,1540901,1,300);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XS10",128,1540932,2,500);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","CM10",512,1540902,1,1100);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540933,2,1050);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540903,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("ELG","PinxoPhone",0,1540934,3,20);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","CM10",512,1540904,1,1100);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XS10",128,1540935,2,500);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540905,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Asusta","USBWifi",0,1540936,3,25);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X9",32,1540937,1,825);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540906,1,1125);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540907,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X9",32,1540908,1,825);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XT10",128,1540912,1,300);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540942,2,1050);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("ELG","LX6",256,1540913,1,750);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C9",128,1540914,1,650);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540915,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540916,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X9",32,1540917,1,825);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","CM10",512,1540909,1,1100);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Asusta","USBWifi",0,1540938,3,25);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","CM10",512,1540910,1,1100);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Asusta","USBWifi",0,1540939,3,25);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XT10",128,1540940,1,300);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XT10",128,1540911,1,300);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540941,2,1050);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540918,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Asusta","USBWifi",0,1540943,3,25);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X9",32,1540919,1,825);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540944,2,1050);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("ELG","LX6",128,1540945,1,670);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Appel","X10",256,1540920,1,1000);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("XiaoTu","XS10",128,1540946,2,500);
insert into terminal (marca,modelo,memoria,tarjeta,tipo,precio) values ("Chang2ng","C10",256,1540921,1,1125);

insert into cargo values ("Presidente",30),("Director",28),("Subdirector",26),("Gerente",25),("Jefe de proyecto",24);

insert into usuario (nombre,apellidos) values ("Luis","Casado Tosar");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (894,"Presidente",1302,"2019-09-05",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (895,"Presidente",1302,"2019-09-05",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (896,"Director",1302,"2018-09-01","2019-09-04");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (897,"Director",1302,"2018-09-01","2019-09-04");

insert into usuario (nombre,apellidos) values ("Ana Isabel","Tamayo Barcenas");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (896,"Director",1303,"2019-09-04",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (897,"Director",1303,"2019-09-04",null);

insert into usuario (nombre,apellidos) values ("Felipe","Aspas Eriksen");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (898,"Gerente",1304,"2020-01-10",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (899,"Gerente",1304,"2020-01-10",null);

insert into usuario (nombre,apellidos) values ("Elena","Martinez Martinez");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (898,"Jefe de proyecto",1305,"2018-10-06","2020-01-09");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (899,"Jefe de proyecto",1305,"2018-10-07","2020-01-09");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (900,"Gerente",1305,"2020-01-10",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (901,"Gerente",1305,"2020-01-10",null);

insert into usuario (nombre,apellidos) values ("Miguel","Lopez Garrido");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (902,"Jefe de proyecto",1306,"2018-10-30","2019-12-22");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (903,"Jefe de proyecto",1306,"2018-10-30","2019-12-22");

insert into usuario (nombre,apellidos) values ("Belen","Aguirre Mendieta");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (904,"Director",1307,"2018-12-10","2019-01-01");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (905,"Director",1307,"2018-12-01",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (906,"Director",1307,"2019-01-02","2019-11-15");


insert into usuario (nombre,apellidos) values ("Angel","Giner de la Fuente");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (904,"Jefe de proyecto",1308,"2019-01-02",null);

insert into usuario (nombre,apellidos) values ("Carlos","Garcia Petain");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (907,"Jefe de proyecto",1309,"2019-01-07",null);

insert into usuario (nombre,apellidos) values ("Michael","Night");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (908,"Gerente",1310,"2019-01-01","2020-02-28");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (909,"Director",1310,"2020-03-04",null);

insert into usuario (nombre,apellidos) values ("Michelle","Miterrand");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (910,"Jefe de proyecto",1311,"2018-09-01",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (911,"Jefe de proyecto",1311,"2018-09-01",null);

insert into usuario (nombre,apellidos) values ("Jon","Black Snow");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (912,"Jefe de proyecto",1312,"2019-01-21",null);

insert into usuario (nombre,apellidos) values ("Pedro","Piedra Picado");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (913,"Jefe de proyecto",1313,"2019-02-13","2020-02-15");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (914,"Gerente",1313,"2020-02-16",null);

insert into usuario (nombre,apellidos) values ("Ricardo","Heart Leon");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (915,"Jefe de proyecto",1314,"2019-07-31",null);

insert into usuario (nombre,apellidos) values ("Montse","Valls Rivera");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (916,"Jefe de proyecto",1315,"2020-01-18",null);

insert into usuario (nombre,apellidos) values ("Vicente","Sanchez Aliaga");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (917,"Gerente",1316,"2018-10-12",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (918,"Gerente",1316,"2018-10-17",null);

insert into usuario (nombre,apellidos) values ("Sarai","Navarro Suarez");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (919,"Gerente",1317,"2018-10-12","2019-12-03");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (920,"Gerente",1317,"2018-10-17","2019-12-03");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (921,"Gerente",1317,"2019-12-04",null);

insert into usuario (nombre,apellidos) values ("Ines","Suarez Jimenez");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (921,"Jefe de proyecto",1318,"2018-10-19","2019-12-04");

insert into usuario (nombre,apellidos) values ("Sergio","Carceller Mendoza");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (922,"Gerente",1319,"2018-10-20","2020-02-14");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (923,"Gerente",1319,"2018-10-20","2020-02-14");

insert into usuario (nombre,apellidos) values ("Pilar","Santiago Castillo");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (924,"Jefe de proyecto",1320,"2018-07-08",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (925,"Jefe de proyecto",1320,"2018-07-08",null);

insert into usuario (nombre,apellidos) values ("Cristina","Moro del Valle");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (926,"Director",1321,"2018-07-08",null);
insert into usa (terminal,cargo,usuario,finicio,ffin) values (927,"Director",1321,"2018-07-08",null);

insert into usuario (nombre,apellidos) values ("Esteban","Guijarro Perez");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (928,"Jefe de proyecto",1322,"2018-12-21",null);

insert into usuario (nombre,apellidos) values ("Pablo","Marmol Delgado");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (929,"Director",1323,"2018-12-19","2019-11-15");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (930,"Director",1323,"2018-12-23","2019-11-15");
insert into usa (terminal,cargo,usuario,finicio,ffin) values (931,"Director",1323,"2019-11-16",null);

insert into llamada values (620020200,620020207,"2018-09-12 15:03:24","2018-09-12 15:13:56");
insert into llamada values (620020200,620020207,"2018-12-23 10:31:01","2018-12-23 11:06:37");
insert into llamada values (620020200,620020207,"2018-12-26 09:45:13","2018-12-26 09:45:55");
insert into llamada values (620020200,633909002,"2019-12-02 11:55:58","2019-12-02 12:07:44");
insert into llamada values (620020200,620020203,"2018-11-11 12:05:13","2018-11-11 12:12:03");
insert into llamada values (620020200,620020203,"2018-12-11 12:02:10","2018-12-11 12:12:43");
insert into llamada values (620020200,620020203,"2019-01-11 12:07:21","2019-01-11 12:11:05");
insert into llamada values (620020200,620020203,"2019-02-11 11:55:53","2019-02-11 12:10:30");
insert into llamada values (620020200,620020203,"2019-02-11 11:57:28","2019-02-11 12:00:13");
insert into llamada values (620020207,620020200,"2018-09-12 16:55:00","2018-09-12 16:57:58");
insert into llamada values (620020207,620020200,"2019-03-28 10:13:20","2019-03-28 12:00:01");
insert into llamada values (620020207,620020200,"2018-05-01 11:26:50","2018-05-01 11:31:58");
insert into llamada values (620020207,620020200,"2018-07-23 09:40:05","2018-07-23 09:49:09");

insert into llamada values (620020205,635230101,"2018-11-22 23:46:12","2018-11-23 00:14:41");
insert into llamada values (620020205,635230101,"2019-07-21 13:31:22","2019-07-21 13:44:18");
insert into llamada values (620020205,635230101,"2020-02-07 12:00:56","2020-02-07 12:18:02");

insert into llamada values (635230101,620020205,"2019-04-15 10:00:37","2019-04-15 10:01:55");
insert into llamada values (635230101,620020200,"2019-07-01 10:00:16","2019-07-01 10:03:23");
insert into llamada values (635230101,620020207,"2019-11-27 10:00:55","2019-11-27 10:04:10");
insert into llamada values (635230101,620020203,"2020-01-17 10:01:01","2020-01-17 10:02:50");

insert into llamada values (635230103,635230101,"2018-08-31 08:45:31","2018-08-31 08:56:51");
insert into llamada values (635230103,620020200,"2020-01-17 15:01:45","2020-01-17 15:23:17");
insert into llamada values (635230103,620020200,"2020-01-19 14:58:34","2020-01-19 15:11:59");
insert into llamada values (635230103,620020200,"2020-01-23 18:06:21","2020-01-23 18:26:03");
insert into llamada values (635230103,635230100,"2019-02-25 10:55:34","2019-02-25 10:59:54");
insert into llamada values (635230103,620020203,"2020-01-30 10:38:16","2020-01-30 10:43:17");
