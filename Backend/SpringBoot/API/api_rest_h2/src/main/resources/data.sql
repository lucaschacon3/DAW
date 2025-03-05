CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);



INSERT INTO usuario (nombre, email) VALUES ('Juan Pérez', 'juan@example.com');
INSERT INTO usuario (nombre, email) VALUES ('María López', 'maria@example.com');
INSERT INTO usuario (nombre, email) VALUES ('Carlos Rodríguez', 'carlos@example.com');