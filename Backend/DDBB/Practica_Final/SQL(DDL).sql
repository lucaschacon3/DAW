drop database if exists empresa_de_moda;

create database empresa_de_moda;

use empresa_de_moda;

create table persona(
DNI varchar(9) primary key, 
nombre varchar(35) not null,
apellido_1 varchar(35) not null,
apellido_2 varchar(35)
);

create table fundador(
DNI varchar(9) primary key,
fecha_fundacion date not null, 
constraint FK_fundador_persona foreign key (DNI) references persona(DNI) on update cascade on delete cascade
);

create table CEO(
DNI varchar(9) primary key,
fecha_inicio date not null,
fecha_fin date,
constraint FK_CEO_persona foreign key (DNI) references persona(DNI) on update cascade on delete cascade
);

create table inversor(
DNI varchar(9) primary key,
cant_invertida double not null,
num_acciones int unsigned not null, 
constraint FK_inversor_persona foreign key (DNI) references persona(DNI) on update cascade on delete cascade
);

create table diseñador(
DNI varchar(9) primary key,
nacionalidad varchar(20) not null, 
constraint FK_diseñador_persona foreign key (DNI) references persona(DNI) on update cascade on delete cascade
);

create table empleado(
DNI varchar(9) primary key,
NSS varchar(12) unique not null, 
cod_emp varchar(11) unique not null, 
est_civil enum('soltero', 'casado', 'unión libre', 'separado', 'divorciado', 'viudo') default 'soltero',
fecha_incorporacion date not null,
constraint FK_empleado_persona foreign key (DNI) references persona(DNI) on update cascade on delete cascade,
cod_dpto varchar(11) not null,
cod_suc varchar(11) not null,
cod_jefe varchar(11) not null,
constraint FK_jefe_empleado foreign key (cod_jefe) references empleado(cod_emp) on update cascade on delete cascade
);

create table marca_de_ropa(
nombre varchar(35) primary key,
fecha_creacion date not null,
dir_postal varchar(100) not null,
url_pag_web varchar(75) not null
);

create table estilos_de_ropa(
nombre varchar(35) primary key
);

create table tiene(
marca varchar(35),
constraint FK_tiene_marca_de_ropa foreign key (marca) references marca_de_ropa(nombre) on update cascade on delete restrict,
estilo varchar(35),
constraint FK_tiene_estilos_de_ropa foreign key (estilo) references estilos_de_ropa(nombre) on update cascade on delete restrict,
primary key (marca, estilo)
);

create table prenda(
nombre varchar(35) primary key, 
precio float not null check(precio > 0), 
temporada enum ('primavera', 'verano', 'otoño', 'invierno')
);

create table compuesto_por(
estilo varchar(35),
prenda varchar(35),
constraint FK_compuesto_por_estilos_de_ropa foreign key (estilo) references estilos_de_ropa(nombre) on update cascade on delete restrict, 
constraint FK_compuesto_por_prenda foreign key (prenda) references prenda (nombre) on update cascade on delete restrict,
primary key (estilo, prenda)
);

create table diseñada(
prenda varchar(35), 
DNI varchar(9),
constraint FK_diseñada_prenda foreign key (prenda) references prenda (nombre) on update cascade on delete restrict,
constraint FK_diseñada_diseñador foreign key (DNI) references diseñador (DNI) on update cascade on delete cascade,
primary key (prenda, DNI)
);

create table sucursal(
cod_suc varchar(11) primary key,
nombre varchar(35) not null,
dir varchar(100) not null,
marca varchar(35) not null,
constraint FK_sucursal_marca_de_ropa foreign key (marca) references marca_de_ropa(nombre) on update cascade on delete restrict
);

create table departamento(
cod_dpto varchar(11),
cod_suc varchar(11),
nombre varchar(35) not null,
responsable varchar(11) not null, -- Si es unique no se pueden tener 40 dptos con 30 responsables
primary key (cod_dpto, cod_suc),
constraint FK_departamento_sucursal foreign key (cod_suc) references sucursal(cod_suc) on update cascade on delete cascade,
constraint FK_departamento_empleado foreign key (responsable) references empleado(cod_emp) on update cascade on delete cascade
);

alter table empleado add constraint FK_empleado_departamento foreign key (cod_dpto, cod_suc) references departamento(cod_dpto, cod_suc) on update cascade on delete cascade;

create table proveedor(
CIF varchar(9) primary key,
nombre varchar(35) not null,
tfno varchar(9) not null check(length(tfno) = 9),
dir_postal varchar(100) not null
);

create table materia_prima(
cod_mp varchar(12) primary key,
nombre varchar(35) not null,
estado enum('perfecto', 'bueno', 'algo deteriorado', 'deteriorado', 'desechable') default 'perfecto' not null,
procedencia varchar(40) not null
);

create table suministra(
nombre varchar(35),
constraint FK_suministra_marca_de_ropa foreign key (nombre) references marca_de_ropa(nombre) on update cascade on delete restrict,
CIF varchar(9),
constraint FK_suministra_proveedor foreign key (CIF) references proveedor(CIF) on update cascade on delete restrict,
cod_mp varchar(11),
constraint FK_suministra_materia_prima foreign key (cod_mp) references materia_prima(cod_mp) on update cascade on delete restrict,
primary key (nombre, CIF, cod_mp)
);
