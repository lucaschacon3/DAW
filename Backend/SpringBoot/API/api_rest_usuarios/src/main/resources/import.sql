CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);



INSERT INTO usuarios (nombre, email) VALUES ('Juan Pérez', 'juan@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('María López', 'maria@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Carlos Rodríguez', 'carlos@example.com');