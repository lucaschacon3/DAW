-- Crear la base de datos
CREATE DATABASE dwes2;
USE dwes2;

-- Crear la tabla de jugadores
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Identificador único del jugador
    nombre VARCHAR(100) NOT NULL UNIQUE       -- Nombre del jugador (único)
);

-- Crear la tabla de puntuaciones
CREATE TABLE puntuaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Identificador único de la puntuación
    jugador_id INT NOT NULL,                  -- Referencia al jugador
    puntuacion INT NOT NULL,                  -- Valor de la puntuación
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- Fecha y hora de la puntuación
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) 
        ON DELETE CASCADE                     -- Eliminar puntuaciones si el jugador se elimina
        ON UPDATE CASCADE                     -- Actualizar la clave foránea si el id del jugador cambia
);

-- Insertar datos de prueba (opcional)
INSERT INTO jugadores (nombre) VALUES ('Juan'), ('Ana'), ('Pedro');
INSERT INTO puntuaciones (jugador_id, puntuacion) VALUES 
    (1, 7), (1, 5), (1, 8), 
    (2, 4), (2, 6), 
    (3, 2), (3, 3);
