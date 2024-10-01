CREATE DATABASE starwars;

USE starwars;

CREATE TABLE Ilustrador (
Id_i int NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(25) UNIQUE,
Nacionalidad Varchar (20),
Nacimiento YEAR,
CONSTRAINT PK_ilustrador_id PRIMARY KEY (Id_i)
);


CREATE TABLE Autor ( 
Id_a int NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(25) UNIQUE,
Nacionalidad Varchar (20),
Nacimiento YEAR,
CONSTRAINT PK_autor_id PRIMARY KEY (Id_a)
);



CREATE TABLE Comic (
ISBN_C VARCHAR (17) PRIMARY KEY,
Titulo VARCHAR (55),
Editorial VARCHAR (20),
Lanzamiento DATE,
Descatalogada ENUM('si', 'no'),
SW_Era Varchar (20),
Id_a int,
Id_i int
);



ALTER TABLE Comic
ADD FOREIGN KEY (Id_a) REFERENCES Autor(Id_a) ON DELETE CASCADE;
ALTER TABLE Comic
ADD FOREIGN KEY (Id_i) REFERENCES Ilustrador(Id_i) ON DELETE CASCADE;



CREATE TABLE Novela (
ISBN_N VARCHAR (17) PRIMARY KEY,
Titulo VARCHAR (45) UNIQUE,
Editorial VARCHAR (40),
Ultima_edicion DATE,
Lanzamiento DATE,
Descatalogada ENUM('si', 'no'),
SW_Era Varchar (20),
Id_a int
);


ALTER TABLE Novela
ADD CONSTRAINT FK_autornovela FOREIGN KEY (Id_a) REFERENCES Autor(Id_a) ON DELETE CASCADE;

CREATE TABLE Director (
Id_dir int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (20) UNIQUE,
Nacionalidad VARCHAR (20),
Nacimiento YEAR
);

CREATE TABLE Productora (
Id_pr int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre Varchar (20),
Pais VARCHAR (20)
);

CREATE TABLE Pelicula (
Id_pl int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Titulo Varchar (45) UNIQUE,
Lanzamiento DATE,
SW_Era Varchar (20),
Id_pr int,
Id_dir int
);

ALTER TABLE Pelicula
ADD CONSTRAINT FK_prpelicula FOREIGN KEY (Id_pr) REFERENCES Productora(Id_pr) ON DELETE CASCADE;

ALTER TABLE Pelicula
ADD CONSTRAINT FK_dirpelicula FOREIGN KEY (Id_dir) REFERENCES Director(Id_dir) ON DELETE CASCADE;

CREATE TABLE Personajes (
Id_per int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (35) UNIQUE,
Nacimiento VARCHAR (8),
Especie VARCHAR (25),
Planeta Varchar (20),
Profesion ENUM ('Jedi','Sith','Rebelde', 'Politico', 'Oficial Imperial', 'Otros')
);


CREATE TABLE Aparicion_comic (
Id_per int,
ISBN_C VARCHAR (17),
PRIMARY KEY (id_per, ISBN_C)
);

ALTER TABLE Aparicion_comic
ADD CONSTRAINT PK_personajecomic FOREIGN KEY (id_per) REFERENCES Personajes(Id_per) ON DELETE CASCADE;

ALTER TABLE Aparicion_comic
ADD CONSTRAINT PK_aparececomic FOREIGN KEY (ISBN_C) REFERENCES Comic(ISBN_C) ON DELETE CASCADE;


CREATE TABLE Aparicion_novela (
Id_per int,
ISBN_N VARCHAR (17),
PRIMARY KEY (id_per, ISBN_N)
);

ALTER TABLE Aparicion_novela
ADD CONSTRAINT PK_personajenovela FOREIGN KEY (id_per) REFERENCES Personajes(Id_per) ON DELETE CASCADE;
ALTER TABLE Aparicion_novela
ADD CONSTRAINT PK_aparecenovela FOREIGN KEY (ISBN_N) REFERENCES Novela(ISBN_N) ON DELETE CASCADE;


CREATE TABLE Aparicion_pelicula (
Id_per int,
Id_pl int,
PRIMARY KEY (Id_per, Id_pl)
);


ALTER TABLE Aparicion_pelicula
ADD CONSTRAINT PK_personajepeli FOREIGN KEY (id_per) REFERENCES Personajes(Id_per) ON DELETE CASCADE;
ALTER TABLE Aparicion_pelicula
ADD CONSTRAINT PK_aparecepeli FOREIGN KEY (Id_pl) REFERENCES Pelicula(Id_pl) ON DELETE CASCADE;







CREATE TABLE Roles (
id_rol INT PRIMARY KEY,
rol VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE Usuarios (
id_usu INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (20) NOT NULL UNIQUE, 
pass VARBINARY(100),
rol INT,
FOREIGN KEY (rol) REFERENCES Roles(id_rol) ON DELETE CASCADE
);

CREATE TABLE Userdata (
id_usu INT PRIMARY KEY,
mail VARCHAR (30),
telefono VARCHAR (9),
fechaini DATE,
fechanac DATE,
pers_fav VARCHAR (30),
bio TINYTEXT,
FOREIGN KEY (id_usu) REFERENCES Usuarios(id_usu) ON DELETE CASCADE
);

CREATE TABLE img(
id_usu INT PRIMARY KEY,
imgnombre VARCHAR (200) NOT NULL,
imgdir VARCHAR(255) NOT NULL,
FOREIGN KEY (id_usu) REFERENCES Usuarios(id_usu) ON DELETE CASCADE
);



CREATE USER 'jedi'@'%' identified by 'fuerza';
GRANT ALL PRIVILEGES ON starwars.* TO 'jedi'@'%';


INSERT INTO Roles
VALUES (1, 'Admin'), (2, 'Usuario');

INSERT INTO Usuarios
VALUES (1, 'Aroa', AES_ENCRYPT('123456', 'fuerza'), 1), (2, 'Gabi', AES_ENCRYPT('123456', 'fuerza'), 1), (3, 'Chewbacca', AES_ENCRYPT('123456', 'fuerza'), 2), (4, 'BabyYoda', AES_ENCRYPT('123456', 'fuerza'), 2);



INSERT INTO Userdata
VALUES (1, 'aroa@mail.com', '123456789', '2019-05-24', '1992-05-24', 'Qui-Gon Jinn', 'La muerte una parte natural de la vida es. Regocijate por los que te rodean y en la Fuerza se transforman. Llorarlos no debes, añorarlos tampoco. El apego a los celos conduce, la negra sombra de la codicia es.'), (2, 'gabi@mail.com', '666666666', '2019-05-24', '1992-05-24', 'Darth Vader', 'No subestimes el poder del lado oscuro'), (3, 'chewbi@RRWWWGG.com', '000000000', '2019-05-24', '1992-05-24', 'Han Solo', 'RRRAARWHHGGWWR, RAWRGWAWGGR RRRAARWHHGWWR.'), (4, 'by@mando.com', '000000000', '2019-05-24', '1992-05-24', 'Mando','When nine hundred years old you reach, look as good you will not.');

INSERT INTO `img`
VALUES (1,'me.jpeg','userimg/'), (2,'darthvader.jpeg','userimg/'),(3, 'chewbi.jpeg', 'userimg/'),(4, 'bbyoda.png', 'userimg/');



INSERT INTO Productora
VALUES (NULL,'Lucasfilm', 'Estados Unidos');

INSERT INTO Productora
VALUES (NULL,'Disney', 'Estados Unidos');


INSERT INTO Director
VALUES (NULL, 'George Lucas', 'Estados Unidos', '1944');

INSERT INTO Director
VALUES (NULL, 'Irvin Kershner', 'Estados Unidos', '1923');

INSERT INTO Director
VALUES (NULL, 'Richard Marquand', 'Reino Unido', '1937');

INSERT INTO Director
VALUES (NULL, ' J.J. Abrams ', 'Estados Unidos', '1966');

INSERT INTO Director
VALUES (NULL, 'Gareth Edwards', 'Reino Unido', '1975');





INSERT INTO Pelicula
VALUES (Null, 'Episodio IV: Una Nueva Esperanza', '1977-11-07', 'Rebellion', '1', '1'); 

INSERT INTO Pelicula
VALUES (Null, 'Episodio V: El Imperio Contraataca', '1980-05-17', 'Rebellion', '1', '2'); 

INSERT INTO Pelicula
VALUES (Null, 'Episodio VI: El Retorno del Jedi', '1983-05-25', 'Rebellion', '1', '3');

INSERT INTO Pelicula
VALUES (Null, 'Episodio VII: El Despertar de la Fuerza', '2015-12-14', 'First Order', '2', '4');

INSERT INTO Pelicula
VALUES (Null, 'Rogue One: Una Historia de Star Wars', '2016-12-10', 'Rinse of the Empire', '2', '5'); 


INSERT INTO Ilustrador
VALUES (Null, 'Marco Checcheto', 'Italia', '1975'); 

INSERT INTO Ilustrador
VALUES (Null, 'Giuseppe Camuncoli', 'Italia', '1975'); 

INSERT INTO Ilustrador
VALUES (Null, 'Phil Noto', 'Estados Unidos', '1971'); 

INSERT INTO Ilustrador
VALUES (Null, 'Rachel Dodson', 'Estados Unidos', null); 


INSERT INTO Autor
VALUES (Null, 'Charles Soule', 'Estados Unidos', '1974'); 

INSERT INTO Autor
VALUES (Null, 'Gerry Duggan', 'Estados Unidos', '1950'); 

INSERT INTO Autor
VALUES (Null, 'Mark Waid', 'Estados Unidos', '1962'); 

INSERT INTO Autor
VALUES (Null, 'Emily Kate Johnston', 'Canada', Null); 

INSERT INTO Autor
VALUES (Null, 'Timothy Zahn', 'Estados Unidos', '1951');


INSERT INTO Comic
VALUES ('978-8-416-69355-9', 'TituloStar Wars: Obi-Wan & Anakin 1', 'Planeta Comic', '2016-10-03', 'no', 'Rinse of the Empire', '1', '1');

INSERT INTO Comic
VALUES ('978-8-416-69356-6', 'TituloStar Wars: Obi-Wan & Anakin 2', 'Planeta Comic', '2016-11-08', 'no', 'Rinse of the Empire', '1', '1'); 

INSERT INTO Comic
VALUES ('978-8-491-46779-3', 'Star Wars: Darth Vader. Lord Oscuro 1', 'Planeta Comic', '2018-04-05', 'no', 'Rinse of the Empire', '1', '2'); 

INSERT INTO Comic
VALUES ('978-8-416-47653-4', 'Star Wars: Chewbacca 1', 'Planeta Comic', '2016-07-04', 'no', 'Rebellion', '2', '3');

INSERT INTO Comic
VALUES ('978-8-416-24410-2', 'Star Wars: Princesa Leia 1', 'Planeta Comic', '2015-06-02', 'no', 'Rebellion', '3', '4'); 


INSERT INTO Novela
VALUES ('978-84-9173-009-5', 'Star Wars Ahsoka', 'Planeta Comic', null, '2018-10-02', 'no', 'Rinse of the Empire', '4'); 
INSERT INTO Novela
VALUES ('978-84-9146-889-9', 'Star Wars La última orden', 'Planeta Comic', null, '2018-06-05', 'no', 'Rebellion', '5'); 
INSERT INTO Novela
VALUES ('978-84-9146-069-5', 'Star Wars El resurgir de la fuerza oscura', 'Planeta Comic', null, '2017-06-06', 'no', 'Rebellion', '5'); 



INSERT INTO Personajes
VALUES (1, 'Obi-Wan Kenobi', '57 ABY', 'Humano', 'Stewjon', 'Jedi'); 

INSERT INTO Personajes
VALUES (2, 'Anakin Skywalker', '41 ABY', 'Humano', 'Tatooine', 'Sith'); 

INSERT INTO Personajes
VALUES (3, 'Yoda', '896 ABY', 'Desconocida', 'Desconocido', 'Jedi');

INSERT INTO Personajes
VALUES (4, 'Ahsoka Tano', '36 ABY', 'Togruta', 'Shili', 'Jedi'); 

INSERT INTO Personajes
VALUES (5, 'Han Solo', '32 ABY', 'Humano', 'Corellia', 'Rebelde');

INSERT INTO Personajes
VALUES (6, 'Chewbacca', '200 ABY', 'Wookiee', 'Kashyyyk', 'Rebelde');

INSERT INTO Personajes
VALUES (7, 'Leia Organa', '19 ABY', 'Humano', 'Alderaan','Politico' );

INSERT INTO Personajes
VALUES (8, 'Firmus Piett', '4 DBY', 'Humano', 'Axxila', 'Oficial Imperial');

INSERT INTO Personajes
VALUES (9, 'Jyn Erso', '21 ABY', 'Humano', 'Vallt','Rebelde');

INSERT INTO Personajes
VALUES (10, 'Qui-Gon Jinn', '92 ABY', 'Humano', 'Coruscant', 'Jedi');

INSERT INTO Personajes
VALUES (11, 'Wicket W Warrick', '8 ABY', 'Ewok', 'Endor', 'Otros');

INSERT INTO Personajes
VALUES (12, 'Padme Amidala', '46 ABY', 'Humano', 'Naboo', 'Politico');


INSERT INTO Aparicion_pelicula
VALUES ('1', '1');

INSERT INTO Aparicion_pelicula
VALUES ('5', '1');

INSERT INTO Aparicion_pelicula
VALUES ('2', '1');

INSERT INTO Aparicion_pelicula
VALUES ('7', '2');

INSERT INTO Aparicion_pelicula
VALUES ('6', '3');


INSERT INTO Aparicion_pelicula
VALUES ('7', '4');

INSERT INTO Aparicion_pelicula
VALUES ('9', '5');



INSERT INTO Aparicion_novela
VALUES ('4', '978-84-9173-009-5');

INSERT INTO Aparicion_novela
VALUES ('7', '978-84-9146-889-9');
INSERT INTO Aparicion_novela
VALUES ('5', '978-84-9146-069-5');
INSERT INTO Aparicion_novela
VALUES ('2', '978-84-9146-069-5');

INSERT INTO Aparicion_comic
VALUES ('1', '978-8-416-69355-9');
INSERT INTO Aparicion_comic
VALUES ('2', '978-8-416-69356-6');
INSERT INTO Aparicion_comic
VALUES ('2', '978-8-491-46779-3');
INSERT INTO Aparicion_comic
VALUES ('6', '978-8-416-47653-4');
INSERT INTO Aparicion_comic
VALUES ('7', '978-8-416-24410-2');

INSERT INTO Director
VALUES (NULL, 'Rian Johnson', 'Estados Unidos', '1973'), (NULL, 'Ron Howard', 'Estados Unidos', '1954');

INSERT INTO Pelicula
VALUES  (NULL, 'Episodio I: La Amenaza Fantasma', '1999-08-20', 'Rise of the Empire', 1, 1);
INSERT INTO Pelicula
VALUES  (NULL, 'Episodio II: El Ataque de los Clones', '2002-05-17', 'Rise of the Empire', 1, 1);
INSERT INTO Pelicula
VALUES (NULL, 'Episodio III: La Venganza de los Shith', '2005-05-19', 'Rise of the Empire', 1, 1);
INSERT INTO Pelicula
VALUES (NULL, 'Episodio VIII: Los Ultimos Jedi', '2017-12-14', 'New Jedi Order', 2, 6);
INSERT INTO Pelicula
VALUES (NULL, 'Han Solo: Una Histora de Star Wars', '2018-05-24', 'Rise of the Empire', 2, 7);






INSERT INTO Autor
VALUES (NULL, 'Matt Owens', 'Estados Unidos', NULL);

INSERT INTO Ilustrador
VALUES (NULL, 'Denys Cowan', 'Estados Unidos', '1961');

INSERT INTO Autor
VALUES (NULL, 'Jason Aaron', 'Estados Unidos', '1973');

INSERT INTO Ilustrador
VALUES (NULL, 'Mike Mayhew', 'Nueva Zelanda', '1980');

INSERT INTO Autor
VALUES (NULL, 'Christie Golden', 'Estados Unidos', '1963');

INSERT INTO Autor
VALUES (NULL, 'Claudia Gray', 'Estados Unidos', '1970');

INSERT INTO Autor
VALUES (NULL, 'James Luceno', 'Estados Unidos', '1947');

INSERT INTO Autor
VALUES (NULL, 'Rae Carson', 'Estados Unidos', '1973');

INSERT INTO Autor
VALUES (NULL, 'Chuck Wendig', 'Estados Unidos', '1976');

INSERT INTO Autor
VALUES (NULL, 'Jody Houser', 'Estados Unidos', NULL); 

INSERT INTO Ilustrador
VALUES (NULL, 'Cory Smith', 'Estados Unidos', NULL); 

INSERT INTO Ilustrador
VALUES (NULL, 'Luke Ross', 'Brasil', '1972');

INSERT INTO Comic
Values ('978-1-302-90941-3', 'Jedi of the Republic—Mace Windu 1', 'Marvel Comic', '2017-08-30','No', 'Rise of the Empire', 6, 5), ('978-8-416-54303-8', 'Star Wars 15: From the Journals of Old Ben Kenobi', 'Planeta Comic', '2016-01-20','No', 'Rebellion', 7, 6), ('759-6-060-9199-7', 'Age of Republic - Qui-Gon Jinn 1', 'Marvel Comic', '2018-12-05', 'No', 'Desconocida', 13, 7), ('759-6-060-9194-2', 'Age of Republic - Darth Maul 1', 'Marvel Comic', '2018-12-12', 'No', 'Desconocida', 13, 8);  

INSERT INTO Novela
Values ('978-1-101-88495-9', 'Discipulo Oscuro', 'Planeta Comic', '2016-03-01', '2015-07-07', 'No', 'Rise of the Empire', 8),  ('978-1-101-96598-6', 'Bloodline', 'Del Rey', '2017-01-31', '2016-12-01', 'No', 'Legacy', 9), ('978-0-553-39290-6', 'Tarkin', 'Del Rey', '2015-06-30', '2014-11-04', 'No', 'Rise of the Empire', 10), ('978-1-368-01630-8', 'Most Wanted', 'Disney Lucasfilm Press', NULL, '2018-05-14', 'No', ' Rise of the Empire', 11),('978-8-416-40170-3', 'Consecuencias', 'Paneta Comic', NULL, '2015-11-24', 'No', 'Rebellion', 12);


INSERT INTO Personajes
VALUES (NULL, 'Luke Skywalker', '19 ABY', 'Humano', 'Tatooine','Jedi'), 
(NULL, 'Wilhuff Tarkin', '64 BBY', 'Humano', 'Eriadu','Oficial Imperial');
 
INSERT INTO Personajes
VALUES(NULL, 'C-3PO', '32 ABY', 'Droide','Tatooine', 'Rebelde');
INSERT INTO Personajes
VALUES(NULL, 'R2-D2', '20 ABY', 'Droide', 'Naboo','Rebelde'); 
INSERT INTO Personajes
VALUES(NULL, 'Jan Dodonna', '65 ABY', 'Humano', 'Commenor', 'Rebelde'); 
INSERT INTO Personajes
VALUES(NULL, 'Lando Calrissian', '30 ABY', 'Humano', 'Socorro','Otros'); 
INSERT INTO Personajes
VALUES(NULL, 'Boba Fett', '32 ABY','Humano (clon)', 'Kamino', 'Otros');  
INSERT INTO Personajes
VALUES(NULL, 'Sheev Palpatine/Darth Sidious', '84 ABY', 'Humano', 'Naboo', 'Sith'); 
INSERT INTO Personajes
VALUES(NULL, 'Tiaan Jerjerrod', '4 DBY', 'Humano', 'Tinnel IV', 'Oficial Imperial');  
INSERT INTO Personajes
VALUES(NULL, 'Jabba el Hutt', '600 ABY', 'Hutt', 'Tatooine','Otros');  
INSERT INTO Personajes
VALUES(NULL, 'Quarsh Panaka', NULL, 'Humano', 'Naboo', 'Oficial Imperial');  
INSERT INTO Personajes
VALUES(NULL, 'Jar Jar Binks', NULL, 'Gungan', 'Naboo', 'Politico'); 
INSERT INTO Personajes
VALUES(NULL, 'Rugor Nass', NULL, 'Gungan', 'Naboo','Politico');
INSERT INTO Personajes
VALUES(NULL, 'Watto', NULL, 'Toydariano', 'Toydaria', 'Otros');
INSERT INTO Personajes
VALUES(NULL, 'Darth Maul', '54 ABY', 'Dathomiriano Zabrak', 'Dathomir', 'Sith');
INSERT INTO Personajes
VALUES(NULL, 'Sebulba', NULL, 'Dug', 'Malastare', 'Otros');
INSERT INTO Personajes
VALUES(NULL, 'Dooku/Darth Tyranus', '102 ABY', 'Humano', 'Serenno', 'Sith') ;
INSERT INTO Personajes
VALUES(NULL, 'Mace Windu', '72 ABY', 'Humano', 'Haruun Kal', 'Jedi'); 
INSERT INTO Personajes
VALUES(NULL, 'Depa Billaba', NULL, 'Humano', 'Chalacta','Jedi'); 
INSERT INTO Personajes
VALUES(NULL, 'Jango Fett', '66 ABY', 'Humano', 'Concord Dawn', 'Otros');
INSERT INTO Personajes
VALUES(NULL, 'Jamilla', '40 ABY', 'Humano', 'Naboo','Politico') ;
INSERT INTO Personajes
VALUES(NULL, 'Zam Wesell', '52 ABY', 'Clawdite', 'Zolan','Otros');
INSERT INTO Personajes
VALUES(NULL, 'Bail Organa', '67 ABY', 'Humano', 'Alderaan', 'Politico'); 
INSERT INTO Personajes
VALUES(NULL, 'Ki-Adi-Mundi', '97 ABY', 'Cereano', 'Cerea', 'Jedi'); 
INSERT INTO Personajes
VALUES(NULL, 'Kylo Ren', '5 DBY', 'Humano', 'Chandrilla', 'Sith');
INSERT INTO Personajes
VALUES(NULL, 'Rey', '15 DBY', 'Humano', 'Jakku', 'Jedi'); 
INSERT INTO Personajes
VALUES(NULL, 'Poe Dameron', '2 DBY', 'Humano', 'Yavin 4', 'Rebelde'); 
INSERT INTO Personajes
VALUES(NULL, 'Maz Kanata', '966 ABY', 'Desconocida', 'Takodana', 'Otros');
INSERT INTO Personajes
VALUES(NULL, 'Phasma', NULL, 'Humano', 'Parnassos', 'Oficial Imperial');
INSERT INTO Personajes
VALUES(NULL, 'Tasu Leech', NULL, 'Humano', 'Nar Kanji', 'Otros');
INSERT INTO Personajes
VALUES(NULL, 'Armitage Hux', '0 ABY', 'Humano', 'Arkanis', 'Oficial Imperial');
INSERT INTO Personajes
VALUES(NULL, 'Finn / FN-2187', '11DBY', 'Humano', NULL, 'Rebelde'); 





INSERT INTO Aparicion_pelicula
Values (10,6), (1, 6), (2, 6), (3,6), (23, 6), (24, 6), (25, 6),(26, 6),(27, 6),(28, 6), (13,1), (14,1), (15,1), (16,1), (17,1), (22,1), (6,1), (13, 2), (18, 2), (21,2), (2,2), (5, 2), (12, 2), (8, 2), (6,2), (15,2), (16,2), (19, 2), (3,2), (20,2), (7,3), (5,3), (15,3), (16,3), (19,3), (13,3), (20,3), (2,3), (3,3), (1,7), (2,7), (3,7), (12, 7), (31,7), (24,7), (15,7), (16,7), (29,7), (19,7), (26,7), (30,7), (32,7), (33,7), (34,7), (36,7), (1,8), (2,8), (3,8), (12,8), (15,8), (16,8), (20,8), (29,8), (34,8), (35, 8), (36,8), (5,4), (6,4), (15,4), (16,4), (37,4), (38,4), (39, 4), (40,4), (41,4), (42,4), (43,4), (44,4), (5,9), (6,9), (7,9), (15,9), (16,9), (37,9), (38,9), (39,9), (40,9), (41,9), (42,9), (43,9), (44,9), (5,10), (6,10);

INSERT INTO Aparicion_novela
Values (12, '978-1-101-88495-9'), (19,'978-1-101-88495-9'),(29,'978-1-101-88495-9'),(1,'978-1-101-88495-9'),(36,'978-1-101-88495-9'),(3,'978-1-101-88495-9'), (14,'978-0-553-39290-6'), (20,'978-0-553-39290-6'),(29,'978-0-553-39290-6'),(2,'978-0-553-39290-6'),(30,'978-0-553-39290-6'), (5,'978-1-368-01630-8'), (15,'978-1-101-96598-6'), (6,'978-1-101-96598-6'), (5,'978-1-101-96598-6'), (7,'978-1-101-96598-6'), (20,'978-1-101-96598-6'), (15,'978-8-416-40170-3'), (16,'978-8-416-40170-3'),(5,'978-8-416-40170-3'),(6,'978-8-416-40170-3');

INSERT INTO Aparicion_comic
Values (32,'978-1-302-90941-3'), (3,'978-1-302-90941-3'),(36,'978-1-302-90941-3'), (30,'978-1-302-90941-3'), (1,'759-6-060-9199-7'), (3,'759-6-060-9199-7'),(10,'759-6-060-9199-7'),(1,'978-8-416-54303-8'), (13,'978-8-416-54303-8'),(22,'978-8-416-54303-8'), (20,'759-6-060-9194-2'), (27,'759-6-060-9194-2');





