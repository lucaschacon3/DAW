CREATE DATABASE dwes1;

USE dwes1;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    puntuacion INT NOT NULL
);

INSERT INTO user (name, puntuacion) VALUES ('Juan', 5);
INSERT INTO user (name, puntuacion) VALUES ('Ana', 0);
INSERT INTO user (name, puntuacion) VALUES ('Pedro', 8);

SELECT * FROM user;
