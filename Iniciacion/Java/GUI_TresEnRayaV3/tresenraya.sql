-- Borrar la base de datos si ya existe
DROP DATABASE IF EXISTS tres_en_raya;

-- Crear la base de datos
CREATE DATABASE tres_en_raya;
USE tres_en_raya;

-- Borrar la tabla jugador si ya existe
DROP TABLE IF EXISTS jugador;

-- Crear la tabla jugador con una clave primaria en 'usuario'
CREATE TABLE jugador (
    usuario VARCHAR(20) PRIMARY KEY,
    jugadas INT,
    ganadas INT,
    perdidas INT,
    empatadas INT
);
