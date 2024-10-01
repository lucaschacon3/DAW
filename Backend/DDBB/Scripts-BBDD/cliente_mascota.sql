DROP DATABASE IF EXISTS cliente_mascota;
CREATE DATABASE cliente_mascota;
USE cliente_mascota;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(20),
    edad INT
);

CREATE TABLE mascota (
    id_mascota INT PRIMARY KEY,
    nombre VARCHAR(20), 
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

insert into cliente values (1, "pablo", 20);
insert into cliente values (2, "lucas", 20);
insert into cliente values (3, "juan", 20);

