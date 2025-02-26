-- Crear la tabla si no existe
CREATE TABLE IF NOT EXISTS libros (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    año INT NOT NULL
);

-- Insertar datos en la tabla libros
INSERT INTO libro (titulo, autor, año) VALUES 
('Cien años de soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('1984', 'George Orwell', 1949),
('El principito', 'Antoine de Saint-Exupéry', 1943),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', 1981),
('Rayuela', 'Julio Cortázar', 1963),
('Fahrenheit 451', 'Ray Bradbury', 1953),
('Moby-Dick', 'Herman Melville', 1851),
('Orgullo y prejuicio', 'Jane Austen', 1813),
('El gran Gatsby', 'F. Scott Fitzgerald', 1925);
