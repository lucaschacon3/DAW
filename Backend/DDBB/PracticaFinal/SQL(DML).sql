use empresa_de_moda;

--
-- Instrucciones y recursos
--

/*Orden de las tablas (de esta manera no debería dar ningún error)*/
/*
1) persona
2) fundador
3) CEO
4) inversor
5) diseñador
6) marca_de_ropa
7) sucursal
8) proveedor
9) materia_prima
10) suministra
11) estilos_de_ropa
12) prenda
13) tiene
14) diseñada
15) compuesto_por
16) departamento
17) empleado
*/

/*Para hacer un select rápido de todas las tablas*/
/*
select * from persona;
select * from fundador;
select * from CEO;
select * from inversor;
select * from diseñador;
select * from empleado;
select * from marca_de_ropa;
select * from tiene;
select * from estilos_de_ropa;
select * from compuesto_por;
select * from prenda;
select * from diseñada;
select * from sucursal;
select * from departamento;
select * from proveedor;
select * from materia_prima;
select * from suministra;
*/

/*Para hacer un borrado rápido de todas las tablas (en este orden no debería dar ningún error)*/
delete from ceo;
delete from compuesto_por;
delete from departamento;
delete from diseñada;
delete from diseñador;
delete from empleado;
delete from fundador;
delete from inversor;
delete from prenda;
delete from sucursal;
delete from suministra;
delete from tiene;
delete from estilos_de_ropa;
delete from marca_de_ropa;
delete from materia_prima;
delete from persona;
delete from proveedor;

--
-- Introducir los datos de las tablas
--
    
/*PERSONAS (70)*/

INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98754321B', 'Alejandro', 'García', 'López');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678912C', 'Sofía', 'Martínez', 'Sánchez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('65432178D', 'Pablo', 'Rodriguez', 'González');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('32198765E', 'Marta', 'López', 'Ruíz');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('78945612F', 'Guillermo', 'Sánchez', 'Pérez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789G', 'Elena', 'Pérez', 'González');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('87654321H', 'Diego', 'Gonzalez', 'Férnandez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('54321098I', 'Carmen', 'Gómez', 'Fernández');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('82345671J', 'Javier', 'Fernández', 'Ruíz');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345K', 'Isabel', 'Ruíz', 'Díaz');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('56789012L', 'Sergio', 'Díaz', 'Torres');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678901M', 'María', 'Alonso', 'Alonso');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('90123456N', 'Adrián', 'Torres', 'Romero');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('67890123O', 'Ana', 'Romero', 'Navarro');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('78901234P', 'José', 'Navarro', 'Herrero');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789Q', 'Beatriz', 'Serrano', 'Ortega');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('54321098R', 'Manuel', 'Herrero', 'Molina');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('87654321S', 'Laura', 'Ortega', 'Delgado');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('34567890T', 'Francisco', 'Molina', 'Suárez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('21098765U', 'Raquel', 'Delgado', 'Medina');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678901V', 'David', 'Suárez', 'Vargas');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98765432W', 'Clara', 'Medina', 'Paredes');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345X', 'Juan', 'Vargas', 'Mendoza');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('76543210Y', 'Alicia', 'Cordero', 'Santos');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12345678Z', 'Ignacio', 'Paredes', 'Salazar');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('65432109A', 'Patricia', 'Mendoza', 'Guerrero');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('87654321B', 'Antonio', 'Santos', 'Cabello');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789C', 'Nuria', 'Salazar', 'Ríos');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('34567890D', 'Luis', 'Guerrero', 'Cabrera');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98765432E', 'Silvia', 'Cabello', 'Cámara');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('56789012F', 'Rafael', 'Carmona', 'Ramos');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98765432G', 'Elena', 'Ríos', 'Gallego');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12345678H', 'Alberto', 'Cabrera', 'Castillo');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345I', 'Nuria', 'Cámara', 'Márquez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('34567890J', 'Mario', 'Ramos', 'Estévez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678901K', 'Aurora', 'Medina', 'Santos');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('67890123L', 'Fernando', 'Gallego', 'Bravo');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12364567M', 'Rosa', 'Castillo', 'Cuesta');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789N', 'Miguel', 'Márquez', 'Moreno');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('78901234O', 'Cristina', 'Estévez', 'Durán');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('56789012P', 'Álvaro', 'Santos', 'León');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345Q', 'Victoria', 'Bravo', 'Palacios');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('43210987R', 'Jorge', 'Cuesta', 'Lozano');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('76543210S', 'Susana', 'Moreno', 'Segura');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('32109876T', 'Daniel', 'Durán', 'Herrera');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789U', 'Laura', 'León', 'García-Pelayo');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('54321098V', 'Juan Carlos', 'Palacios', 'Ángel');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678901W', 'Raquel', 'Lozano', 'Roldán');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89580645X', 'Pedro', 'Segura', 'Benítez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('67890123Y', 'Angela', 'Herrera', 'Robles');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('21345678Z', 'Rubén', 'García-Pelayo', 'Vila');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98765432A', 'Irene', 'Ángel', 'Calvo');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('54321098B', 'Joaquín', 'Roldán', 'Abad');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345C', 'Martina', 'Benítez', 'Aguirre');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789D', 'Alberto', 'Robles', 'Basilio');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('34567890E', 'Julia', 'Vila', 'Arana');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('67890123F', 'Óscar', 'Calvo', 'Medina');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12345678G', 'Mercedes', 'Abad', 'Casado');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('56789012H', 'Iván', 'Aguirre', 'Galán');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('87654321I', 'Adriana', 'Basilio', 'Cordero');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12345678J', 'Ernesto', 'Arana', 'Gascón');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('98765432K', 'Natalia', 'Medina', 'Rivera');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('45678901L', 'Francisco Javier', 'Casado', 'Iglesias');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('89012345M', 'Lorena', 'Gascón', 'Vega');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('56789012N', 'Tomás', 'Galán', 'Garrido');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('12345678O', 'Carmen', 'Cordero', 'Márquez');
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('23456789P', 'Javier', 'Gascón', null);
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('87654321Q', 'Elena', 'Rivera', null);
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('34567890R', 'Lucas', 'Iglesias', null);
INSERT INTO persona (DNI, nombre, apellido_1, apellido_2) VALUES ('46389446S', 'Noelia', 'Vega', null);



/*FUNDADOR (8)*/

INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('98754321B', '1908-03-25');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('45678912C', '1924-08-06');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('65432178D', '1912-01-17');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('32198765E', '1909-05-07');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('78945612F', '1923-04-21');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('23456789G', '1902-09-04');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('87654321H', '1906-01-15');
INSERT INTO fundador (DNI, fecha_fundacion) VALUES ('54321098I', '1916-06-28');



/*CEO (10)*/

INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('82345671J', '1991-04-07', '1996-02-15');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('89012345K', '1969-06-23', '1998-09-23');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('56789012L', '1963-08-16', '2000-05-12');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('45678901M', '1982-01-09', '2003-11-30');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('90123456N', '1935-05-27', '2007-07-18');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('67890123O', '1985-11-14', '2012-04-05');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('78901234P', '1948-09-01', '2016-10-22');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('23456789Q', '1954-03-18', '2019-08-11');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('54321098R', '1996-07-03', '2021-03-29');
INSERT INTO CEO (DNI, fecha_inicio, fecha_fin) VALUES ('87654321S', '1998-12-26', '2023-12-07');



/*INVERSOR (12)*/

INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('34567890T', 229958.35, 1535);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('21098765U', 349956.16, 2336);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('98765432W', 479991.24, 3204);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('89012345X', 620063.59, 4139);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('76543210Y', 749948.86, 5006);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('12345678Z', 869946.67, 5807);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('65432109A', 919833.40, 6140);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('87654321B', 540065.05, 3605);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('23456789C', 669950.32, 4472);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('34567890D', 780060.67, 5207);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('98765432E', 890021.21, 5941);
INSERT INTO inversor (DNI, cant_invertida, num_acciones) VALUES ('56789012F', 959982.48, 6408);



/*DISEÑADOR (10)*/

INSERT INTO diseñador (DNI, nacionalidad) VALUES ('98765432G', 'Española');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('12345678H', 'Francesa');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('89012345I', 'Italiana');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('34567890J', 'Alemana');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('45678901K', 'Brasileña');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('67890123L', 'China');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('12364567M', 'Japonesa');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('23456789N', 'Mexicana');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('78901234O', 'Canadiense');
INSERT INTO diseñador (DNI, nacionalidad) VALUES ('56789012P', 'Australiana');



/*MARCAS DE ROPA (10)*/

insert into marca_de_ropa values 
("LuminaStyle", "1965-03-15", "C/ Avellaneda, 27", "https://www.luminastyle.com"), 
("QuantumThreads", "1940-07-08", "C/ Bolívar, 85", "https://www.quantumthreads.net"), 
("VelvetRogue" , "1952-11-02", "C/ Cervantes, 42", "https://www.velvetrogue.com"), 
("NovaChic", "1978-05-21", "C/ Don Quijote, 69", "https://www.novachic.co"), 
("EclipticEnsemble", "1928-11-26", "C/ Esmeralda, 18", "https://www.eclipticensemble.com"), 
("UrbanAura", "1933-04-21", "C/ Florida, 76", "https://www.urbanaura-fashion.com"), 
("EtherealAttire", "1942-12-12", "C/ Goya, 93", "https://www.etherealattire.xyz"), 
("MirageModa", "1972-09-04", "C/ Hernández, 55", "https://www.miragemoda.online"), 
("PinnacleWear", "1937-02-19", "C/ Iguazú, 12", "https://www.pinnaclewear.com"), 
("NebulaCouture", "1935-10-30", "C/ Jardín, 44", "https://www.nebulacouture.co");



/*SUCURSALES (20)*/
  
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('K1L2M3N4O5P', 'Rincón de Moda', 'C/ Kavanagh, 82', 'LuminaStyle');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('Q6R7S8T9U0V', 'Boutique Elegante', 'C/ La Plata, 37', 'QuantumThreads');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('W1X2Y3Z4A5B', 'Estilo Urbano', 'C/ Maipú, 14', 'VelvetRogue');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('C6D7E8F9G0H', 'Galería Fashion', 'C/ Necochea, 61', 'NovaChic');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('I1J2K3L4M5N', 'Oasis de Tendencias', 'C/ Olazábal, 37', 'EclipticEnsemble');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('O6P7Q8R9S0T', 'Plaza de Estilo', 'C/ Pampa, 59', 'UrbanAura');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('U1V2W3X4Y5Z', 'Esquina Chic', 'C/ Quilmes, 26', 'EtherealAttire');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('A6B7C8D9E0F', 'Bazar Moderno', 'Avda. Avellaneda, 27', 'MirageModa');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('G1H2I3J4K5L', 'Espejismo de Moda', 'C/ Sarmiento, 81', 'PinnacleWear');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('M6N7O8P9Q0R', 'Centro de Estilismo', 'C/ Rosario, 67', 'NebulaCouture');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('S1T2U3V4W5X', 'Encanto Textil', 'C/ Ushuaia, 78', 'EtherealAttire');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('Y6Z7A8B9C0D', 'Moda y Más', 'Avda. Bolívar, 85', 'EtherealAttire');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('E1F2G3H4I5J', 'Estación Glamour', 'C/ Tandil, 42', 'EclipticEnsemble');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('K6L7M8N9O0P', 'Ropa Refined', 'Avda. Cervantes, 42', 'NovaChic');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('Q1R2S3T4U5V', 'Tienda Vanguardia', 'C/ Washington, 34', 'LuminaStyle');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('W6X7Y8Z9A0B', 'Punto de Estilo', 'C/ Xul Solar, 71', 'EtherealAttire');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('C1D2E3F4G5H', 'Plaza Fashionista', 'C/ Yapeyú, 19', 'PinnacleWear');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('I6J7K8L9M0N', 'Avenida de la Elegancia', 'Avda. Don Quijote, 69', 'MirageModa');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('O1P2Q3R4S5T', 'Esquina Trendy', 'C/ Viamonte, 9', 'QuantumThreads');
INSERT INTO sucursal (cod_suc, nombre, dir, marca) VALUES ('U6V7W8X9Y0Z', 'Portal de la Moda', 'Avda. Esmeralda, 18', 'EtherealAttire');



/*PROVEEDOR (25)*/

INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('A13579246', 'TejidosElegantes S.A.', '612345678', 'C/ Zapiola, 53');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('B86420973', 'AlgodónPuro Textiles', '645678901', 'Plaza de la Libertad, 94');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('C79164238', 'TelaInnovadora Ltd.', '678901234', 'Avda. Florida, 76');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('D25814769', 'HiloArte Suministros Textiles', '621345678', 'C/ Alvear, 32');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('E96385271', 'LanaFina Proveedores', '667890123', 'C/ Belgrano, 45');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('F14736925', 'TintesVibrantes y Textiles', '689012345', 'Avda. Iguazú, 12');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('G75318642', 'ModaAlgodón Export', '654321098', 'C/ Corrientes, 98');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('H62487931', 'SedaDeluxe Trading', '678912345', 'C/ Dorrego, 28');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('I31862497', 'FibraCreativa Suppliers', '623456789', 'Avda. Goya, 93');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('J97531268', 'DenimDreams Manufacturing', '610987654', 'C/ Gálvez 23,');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('K63284719', 'AccesoriosTextiles Globales', '656789012', 'C/ Fitz Roy, 67');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('L47192583', 'TelasSintéticas Tech', '632109876', 'C/ Entre Ríos, 74');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('M83927146', 'LinoLujoso Fabrics', '698765432', 'Avda. Jardín, 44');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('N52618374', 'TerciopeloTrendy Suppliers', '667890123', 'C/ Humahuaca, 56');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('O47268193', 'ModaSostenible EcoFabrics', '641234567', 'C/ Ituzaingó, 83');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('P15824736', 'EncajeElegante Distributors', '654789012', 'C/ Junín, 39');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('Q63917482', 'TelasNaturales Selectas', '678012345', 'C/ Laprida, 72');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('R92736154', 'InnovaciónTextil Global', '690123456', 'Avda. del Sol, 31');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('S31429867', 'DenimDirect Suppliers', '678345678', 'C/ Moreno, 22');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('T76412589', 'ModaInfantil Fabrics', '612345678', 'C/ Primavera, 152');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('U83927146', 'TelasDeportivas Performance', '678901234', 'Avda. Hernández, 55');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('V62487931', 'ModaInterior Textiles', '654321098', 'C/ Del Bosque, 13');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('W31862497', 'HilosCreativos Import', '667890123', 'Paseo de la Luna, 106');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('X97531268', 'TelasEstampadas Express', '678901234', 'C/ Santa Irene, 4');
INSERT INTO proveedor (CIF, nombre, tfno, dir_postal) VALUES ('Y63284719', 'CueroFino Textil Ltda.', '621345678', 'C/ Núñez, 7');

  

/*MATERIA PRIMA (20)*/

INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('I6J7K8L9M0N', 'Algodón', default, 'Shenzhen, China');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('O1P2Q3R4S5T', 'Lana', 'bueno', 'Mumbai, India');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('U6V7W8X9Y0Z', 'Seda', 'bueno', 'Jakarta, Indonesia');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('A1B2C3D4E5F', 'Lino', 'perfecto', 'Bangkok, Tailandia');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('G6H7I8J9K0L', 'Nylon', default, 'Hanoi, Vietnam');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('M1N2O3P4Q5R', 'Poliéster', 'perfecto', 'Dhaka, Bangladesh');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('S6T7U8V9W0X', 'Rayón', 'desechable', 'Karachi, Pakistán');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('Y1Z2A3B4C5D', 'Acrílico', 'bueno', 'Manila, Filipinas');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('E6F7G8H9I0J', 'Spandex', 'perfecto', 'Kuala Lumpur, Malasia');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('K1L2M3N4O5P', 'Denim', 'deteriorado', 'Yangon, Myanmar');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('Q6R7S8T9U0V', 'Tencel', default, 'Phnom Penh, Camboya');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('W1X2Y3Z4A5B', 'Modal', 'bueno', 'Colombo, Sri Lanka');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('C6D7E8F9G0H', 'Viscosa', 'algo deteriorado', 'Lahore, Pakistán');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('I1J2K3L4M5N', 'Cuero', 'algo deteriorado', 'Ho Chi Minh City, Vietnam');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('O6P7Q8R9S0T', 'Chiffon', default, 'Chittagong, Bangladesh');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('U1V2W3X4Y5Z', 'Jersey', 'perfecto', 'Kolkata, India');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('A6B7C8D9E0F', 'Felpa', 'algo deteriorado', 'Osaka, Japón');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('G1H2I3J4K5L', 'Satén', 'bueno', 'Busan, Corea del Sur');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('M6N7O8P9Q0R', 'Mezclilla', 'deteriorado', 'Taipei, Taiwán');
INSERT INTO materia_prima (cod_mp, nombre, estado, procedencia) VALUES ('S1T2U3V4W5X', 'Tela Vaquera', 'perfecto', 'Almaty, Kazajistán');



/*SUMINISTRA (40)*/

insert into suministra values 
("LuminaStyle", "A13579246", "I6J7K8L9M0N"), 
("QuantumThreads", "B86420973", "O1P2Q3R4S5T"), 
("VelvetRogue", "C79164238", "U6V7W8X9Y0Z"), 
("NovaChic", "D25814769", "A1B2C3D4E5F"), 
("EclipticEnsemble", "E96385271", "G6H7I8J9K0L"), 
("UrbanAura", "F14736925", "M1N2O3P4Q5R"), 
("EtherealAttire", "G75318642", "S6T7U8V9W0X"), 
("MirageModa", "H62487931", "Y1Z2A3B4C5D"), 
("PinnacleWear", "I31862497", "E6F7G8H9I0J"), 
("NebulaCouture", "J97531268", "K1L2M3N4O5P"), 
("VelvetRogue", "K63284719", "Q6R7S8T9U0V"), 
("PinnacleWear", "L47192583", "W1X2Y3Z4A5B"), 
("LuminaStyle", "M83927146", "C6D7E8F9G0H"), 
("VelvetRogue", "N52618374", "I1J2K3L4M5N"), 
("NovaChic", "O47268193", "O6P7Q8R9S0T"), 
("UrbanAura", "P15824736", "U1V2W3X4Y5Z"), 
("EclipticEnsemble", "Q63917482", "A6B7C8D9E0F"), 
("PinnacleWear", "R92736154", "G1H2I3J4K5L"), 
("NebulaCouture", "S31429867", "M6N7O8P9Q0R"), 
("PinnacleWear", "T76412589", "S1T2U3V4W5X"), 
("NovaChic", "U83927146", "G1H2I3J4K5L"), 
("NebulaCouture", "V62487931", "C6D7E8F9G0H"), 
("PinnacleWear", "W31862497", "S1T2U3V4W5X"), 
("VelvetRogue", "X97531268", "Q6R7S8T9U0V"), 
("QuantumThreads", "Y63284719", "O6P7Q8R9S0T"), 
("MirageModa", "O47268193", "S1T2U3V4W5X"), 
("QuantumThreads", "B86420973", "Q6R7S8T9U0V"), 
("VelvetRogue", "V62487931", "I1J2K3L4M5N"), 
("NovaChic", "J97531268", "K1L2M3N4O5P"), 
("UrbanAura", "O47268193", "C6D7E8F9G0H"), 
("MirageModa", "Y63284719", "S6T7U8V9W0X"), 
("QuantumThreads", "K63284719", "S1T2U3V4W5X"), 
("NovaChic", "Y63284719", "G6H7I8J9K0L"), 
("NebulaCouture", "B86420973", "G1H2I3J4K5L"), 
("MirageModa", "B86420973", "U6V7W8X9Y0Z"), 
("EtherealAttire", "K63284719", "A6B7C8D9E0F"), 
("EtherealAttire", "W31862497", "I6J7K8L9M0N"), 
("QuantumThreads", "M83927146", "S1T2U3V4W5X"), 
("UrbanAura", "I31862497", "I1J2K3L4M5N"), 
("MirageModa", "N52618374", "K1L2M3N4O5P");



/*ESTILOS (10)*/

INSERT INTO estilos_de_ropa (nombre) VALUES ('Clásico'),('Bohemio'),('Casual'),('Deportivo'),('Elegante'),('Retro'),('Alternativo'),('Hipster'),('Urbano'),('Informal');



/*PRENDAS (70)*/

INSERT INTO prenda (nombre, precio, temporada) VALUES ('Abrigo', 73.45, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Albornoz', 38.12, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Bata', 24.78, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Bikini', 19.00, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Blusa', 15.33, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Body', 37.89, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Bañador', 20.21, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Bufanda', 112.56, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Calcetines', 5.99, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Calzoncillos', 7.88, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Camisa', 81.02, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Camiseta', 50.45, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Camiseta de tirantes', 4.79, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Camiseta sin mangas', 80.34, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Camisón', 48.79, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Cazadora', 51.23, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chaqueta', 35.90, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chaqueta acolchada', 72.45, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chaqueta bomber', 86.77, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chaqueta vaquera', 39.01, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chaleco', 50.34, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Chándal', 35.67, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Cinturón', 5.34, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Corbata', 8.90, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Corpiño', 20.99, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Falda', 21.11, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Gabardina', 84.56, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Gorro', 3.01, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Guantes', 5.45, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Jersey', 35.78, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Jersey de cuello alto', 43.89, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Leggings', 24.23, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Leggings de cuero', 54.89, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Leggings estampados', 23.45, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Lencería', 61.23, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Mallas', 14.56, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Medias', 20.12, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Minifalda', 39.45, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Mono', 53.78, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Mono largo', 60.45, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pajarita', 5.67, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones', 27.89, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones anchos', 36.34, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones cargo', 20.00, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones cortos', 19.01, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones de campana', 19.56, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones de chándal', 22.34, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones de esquí', 68.90, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones de lino', 27.12, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones de pana', 20.00, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pantalones palazzo', 64.12, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pañuelo', 14.45, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Peto', 26.01, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Pijama', 23.56, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Polo', 59.67, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Poncho', 10.89, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Ropa de baño', 23.45, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Ropa interior', 10.90, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Sombrero', 17.34, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Sudadera', 31.56, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Sujetador', 5.01, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Top corto', 19.23, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Top deportivo', 16.34, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Traje', 161.67, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Traje de baño', 18.12, 'verano');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Traje de neopreno', 72.56, 'invierno');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Traje de fiesta', 48.01, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Vaqueros', 33.45, 'otoño');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Vestido', 55.78, 'primavera');
INSERT INTO prenda (nombre, precio, temporada) VALUES ('Vestido camisero', 40.23, 'primavera');


/*TIENE (65)*/

insert into tiene (marca, estilo) values 
("NovaChic", "Hipster"), 
("LuminaStyle", "Informal"), 
("QuantumThreads", "Bohemio"), 
("MirageModa", "Informal"), 
("EclipticEnsemble", "Informal"), 
("MirageModa", "Hipster"), 
("NovaChic", "Elegante"), 
("EtherealAttire", "Alternativo"), 
("QuantumThreads", "Retro"), 
("EclipticEnsemble", "Deportivo"), 
("VelvetRogue", "Bohemio"), 
("PinnacleWear", "Deportivo"), 
("NovaChic", "Deportivo"), 
("EtherealAttire", "Retro"), 
("EclipticEnsemble", "Retro"), 
("LuminaStyle", "Elegante"), 
("EclipticEnsemble", "Elegante"), 
("MirageModa", "Clásico"), 
("PinnacleWear", "Hipster"), 
("PinnacleWear", "Casual"), 
("EtherealAttire", "Deportivo"), 
("PinnacleWear", "Alternativo"), 
("QuantumThreads", "Deportivo"), 
("NovaChic", "Casual"), 
("NebulaCouture", "Retro"), 
("LuminaStyle", "Bohemio"), 
("NebulaCouture", "Urbano"), 
("EclipticEnsemble", "Hipster"), 
("VelvetRogue", "Clásico"), 
("MirageModa", "Alternativo"), 
("UrbanAura", "Alternativo"), 
("PinnacleWear", "Elegante"), 
("EclipticEnsemble", "Clásico"), 
("QuantumThreads", "Informal"), 
("VelvetRogue", "Alternativo"), 
("QuantumThreads", "Elegante"), 
("MirageModa", "Deportivo"), 
("PinnacleWear", "Bohemio"), 
("EtherealAttire", "Clásico"), 
("NovaChic", "Retro"), 
("NovaChic", "Clásico"), 
("EclipticEnsemble", "Alternativo"), 
("EtherealAttire", "Hipster"), 
("NebulaCouture", "Bohemio"), 
("UrbanAura", "Urbano"), 
("EclipticEnsemble", "Bohemio"), 
("PinnacleWear", "Urbano"), 
("NebulaCouture", "Clásico"), 
("LuminaStyle", "Urbano"), 
("NovaChic", "Informal"), 
("NebulaCouture", "Elegante"), 
("LuminaStyle", "Clásico"), 
("MirageModa", "Bohemio"), 
("NebulaCouture", "Alternativo"), 
("VelvetRogue", "Retro"), 
("UrbanAura", "Retro"), 
("NovaChic", "Urbano"), 
("VelvetRogue", "Informal"), 
("UrbanAura", "Bohemio"), 
("VelvetRogue", "Casual"), 
("MirageModa", "Elegante"), 
("LuminaStyle", "Deportivo"), 
("PinnacleWear", "Clásico"), 
("LuminaStyle", "Casual"), 
("EclipticEnsemble", "Casual");



/*DISEÑADA (77)*/

insert into diseñada (prenda, DNI) values 
("Abrigo", "12364567M"), 
("Albornoz", "12345678H"), 
("Bata", "45678901K"), 
("Bikini", "34567890J"), 
("Blusa", "12364567M"), 
("Body", "12345678H"), 
("Bañador", "12364567M"), 
("Bufanda", "89012345I"), 
("Calcetines", "12345678H"), 
("Calzoncillos", "56789012P"), 
("Camisa", "45678901K"), 
("Camiseta", "45678901K"), 
("Camiseta de tirantes", "78901234O"), 
("Camiseta sin mangas", "56789012P"), 
("Camisón", "78901234O"), 
("Cazadora", "78901234O"), 
("Chaqueta", "12345678H"), 
("Chaqueta acolchada", "45678901K"), 
("Chaqueta bomber", "34567890J"), 
("Chaqueta vaquera", "23456789N"), 
("Chaleco", "67890123L"), 
("Chándal", "98765432G"), 
("Cinturón", "56789012P"), 
("Corbata", "56789012P"), 
("Falda", "89012345I"), 
("Gabardina", "45678901K"), 
("Gorro", "45678901K"), 
("Guantes", "78901234O"), 
("Jersey", "12364567M"), 
("Jersey de cuello alto", "23456789N"), 
("Leggings", "67890123L"), 
("Leggings de cuero", "45678901K"), 
("Leggings estampados", "23456789N"), 
("Lencería", "23456789N"), 
("Mallas", "23456789N"), 
("Medias", "98765432G"), 
("Minifalda", "23456789N"), 
("Mono", "98765432G"), 
("Mono largo", "56789012P"), 
("Pajarita", "67890123L"), 
("Pantalones", "23456789N"), 
("Pantalones anchos", "56789012P"), 
("Pantalones cargo", "45678901K"), 
("Pantalones cortos", "45678901K"), 
("Pantalones de campana", "12345678H"), 
("Pantalones de chándal", "67890123L"), 
("Pantalones de esquí", "12364567M"), 
("Pantalones de lino", "45678901K"), 
("Pantalones de pana", "78901234O"), 
("Pantalones palazzo", "34567890J"), 
("Pañuelo", "56789012P"), 
("Peto", "45678901K"), 
("Pijama", "34567890J"), 
("Polo", "78901234O"), 
("Poncho", "98765432G"), 
("Ropa de baño", "78901234O"), 
("Ropa interior", "12364567M"), 
("Sombrero", "89012345I"), 
("Sudadera", "12364567M"), 
("Sujetador", "78901234O"), 
("Top corto", "34567890J"), 
("Top deportivo", "67890123L"), 
("Traje", "12364567M"), 
("Traje de baño", "98765432G"), 
("Traje de neopreno", "12345678H"), 
("Traje de fiesta", "89012345I"), 
("Vaqueros", "12364567M"),
("Vestido", "67890123L"),
("Vestido camisero", "98765432G"),
("Traje de neopreno", "78901234O"),
("Corbata", "98765432G"),
("Leggings", "78901234O"),
("Bufanda", "98765432G"),
("Mono", "45678901K"),
("Pantalones de esquí", "34567890J"),
("Abrigo", "23456789N"),
("Medias", "78901234O");



/* COMPUESTO POR (90)*/

INSERT INTO compuesto_por (estilo, prenda) VALUES
('Clásico', 'Abrigo'),
('Bohemio', 'Albornoz'),
('Casual', 'Bata'),
('Deportivo', 'Bikini'),
('Elegante', 'Blusa'),
('Retro', 'Body'),
('Alternativo', 'Bañador'),
('Hipster', 'Bufanda'),
('Urbano', 'Calcetines'),
('Informal', 'Calzoncillos'),
('Clásico', 'Camisa'),
('Bohemio', 'Camiseta'),
('Casual', 'Camiseta de tirantes'),
('Deportivo', 'Camiseta sin mangas'),
('Elegante', 'Camisón'),
('Retro', 'Cazadora'),
('Alternativo', 'Chaqueta'),
('Hipster', 'Chaqueta acolchada'),
('Urbano', 'Chaqueta bomber'),
('Informal', 'Chaqueta vaquera'),
('Clásico', 'Chaleco'),
('Bohemio', 'Chándal'),
('Casual', 'Cinturón'),
('Deportivo', 'Corbata'),
('Elegante', 'Corpiño'),
('Retro', 'Falda'),
('Alternativo', 'Gabardina'),
('Hipster', 'Gorro'),
('Urbano', 'Guantes'),
('Informal', 'Jersey'),
('Clásico', 'Jersey de cuello alto'),
('Bohemio', 'Leggings'),
('Casual', 'Leggings'),
('Deportivo', 'Leggings estampados'),
('Elegante', 'Lencería'),
('Retro', 'Mallas'),
('Alternativo', 'Medias'),
('Hipster', 'Minifalda'),
('Urbano', 'Mono'),
('Informal', 'Mono largo'),
('Clásico', 'Pajarita'),
('Bohemio', 'Pantalones'),
('Casual', 'Pantalones anchos'),
('Deportivo', 'Pantalones cargo'),
('Elegante', 'Pantalones cortos'),
('Retro', 'Pantalones de campana'),
('Alternativo', 'Pantalones de chándal'),
('Hipster', 'Pantalones de esquí'),
('Urbano', 'Pantalones de lino'),
('Informal', 'Pantalones de pana'),
('Clásico', 'Pantalones palazzo'),
('Bohemio', 'Pañuelo'),
('Casual', 'Peto'),
('Deportivo', 'Pijama'),
('Elegante', 'Polo'),
('Retro', 'Poncho'),
('Alternativo', 'Ropa de baño'),
('Urbano', 'Ropa interior'),
('Informal', 'Sombrero'),
('Clásico', 'Sudadera'),
('Bohemio', 'Sujetador'),
('Casual', 'Top corto'),
('Deportivo', 'Top deportivo'),
('Elegante', 'Traje'),
('Retro', 'Traje de baño'),
('Alternativo', 'Traje de neopreno'),
('Hipster', 'Traje de fiesta'),
('Urbano', 'Vaqueros'),
('Informal', 'Vestido'),
('Clásico', 'Vestido camisero'),
('Deportivo', 'Traje de baño'),
('Deportivo', 'Chaqueta vaquera'),
('Retro', 'Pantalones de pana'),
('Casual', 'Traje de fiesta'),
('Hipster', 'Medias'),
('Bohemio', 'Vaqueros'),
('Hipster', 'Chándal'),
('Clásico', 'Pantalones cortos'),
('Informal', 'Bañador'),
('Deportivo', 'Pantalones anchos'),
('Alternativo', 'Chaleco'),
('Bohemio', 'Bata'),
('Clásico', 'Vaqueros'),
('Casual', 'Vestido camisero'),
('Alternativo', 'Calcetines'),
('Casual', 'Chándal'),
('Informal', 'Top corto'),
('Urbano', 'Pantalones de esquí'),
('Casual', 'Pantalones de pana'),
('Hipster', 'Mono');



-- Desactivar las FKs (solo en la sesión donde se ponga) para poder meter los datos de departamento y empleado sin problemas
set FOREIGN_KEY_CHECKS = 0;



/*DEPARTAMENTOS (40)*/
     
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('A6B7C8D9E0F', 'K1L2M3N4O5P', 'Ropa de Hombre', 'T1U2V3W4X5Y');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('U1V2W3X4Y5Z', 'Q6R7S8T9U0V', 'Ropa Infantil', 'W1X2Y3Z4A5B');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('O6P7Q8R9S0T', 'W1X2Y3Z4A5B', 'Calzado para Mujer', 'K1L2M3N4O5P');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('I1J2K3L4M5N', 'C6D7E8F9G0H', 'Calzado para Hombre', 'W6X7Y8Z9A0B');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('C6D7E8F9G0H', 'I1J2K3L4M5N', 'Calzado Infanti', 'E1F2G3H4I5J');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('W1X2Y3Z4A5B', 'O6P7Q8R9S0T', 'Accesorios de Moda', 'A6B7C8D9E0F');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Q6R7S8T9U0V', 'U1V2W3X4Y5Z', 'Joyería', 'G1H2I3J4K5L');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('K1L2M3N4O5P', 'A6B7C8D9E0F', 'Relojes', 'C1D2E3F4G5H');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('E6F7G8H9I0J', 'G1H2I3J4K5L', 'Belleza y Cuidado Personal', 'U1V2W3X4Y5Z');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Y1Z2A3B4C5D', 'M6N7O8P9Q0R', 'Perfumería', 'E6F7G8H9I0J');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('S6T7U8V9W0X', 'S1T2U3V4W5X', 'Cosméticos', 'M6N7O8P9Q0R');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('M1N2O3P4Q5R', 'Y6Z7A8B9C0D', 'Electrónica de Consumo', 'C6D7E8F9G0H');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('G6H7I8J9K0L', 'E1F2G3H4I5J', 'Electrodomésticos', 'O6P7Q8R9S0T');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('A1B2C3D4E5F', 'K6L7M8N9O0P', 'Tecnología', 'G6H7I8J9K0L');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('U6V7W8X9Y0Z', 'Q1R2S3T4U5V', 'Deportes y Aire Libre', 'A1B2C3D4E5F');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('O1P2Q3R4S5T', 'W6X7Y8Z9A0B', 'Juguetes', 'M1N2O3P4Q5R');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('I6J7K8L9M0N', 'C1D2E3F4G5H', 'Hogar y Decoración', 'Q1R2S3T4U5V');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('C1D2E3F4G5H', 'I6J7K8L9M0N', 'Muebles', 'N6O7P8Q9R0S');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('W6X7Y8Z9A0B', 'O1P2Q3R4S5T', 'Cocina y Utensilios', 'Y1Z2A3B4C5D');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Q1R2S3T4U5V', 'U6V7W8X9Y0Z', 'Libros y Papelería', 'Q6R7S8T9U0V');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('K6L7M8N9O0P', 'I1J2K3L4M5N', 'Alimentos y Bebidas', 'S1T2U3V4W5X');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('E1F2G3H4I5J', 'O1P2Q3R4S5T', 'Supermercado', 'B6C7D8E9F0G');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Y6Z7A8B9C0D', 'S1T2U3V4W5X', 'Farmacia y Artículos de Salud', 'U6V7W8X9Y0Z');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('S1T2U3V4W5X', 'Y6Z7A8B9C0D', 'Equipaje y Viajes', 'K6L7M8N9O0P');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('M6N7O8P9Q0R', 'G1H2I3J4K5L', 'Automotriz', 'O1P2Q3R4S5T');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('G1H2I3J4K5L', 'K6L7M8N9O0P', 'Jardinería y Exteriores', 'I6J7K8L9M0N');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('A6B7C8D9E0F', 'Q6R7S8T9U0V', 'Mascotas', 'I1J2K3L4M5N');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('U1V2W3X4Y5Z', 'U6V7W8X9Y0Z', 'Instrumentos Musicales', 'H1I2J3K4L5M');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('O6P7Q8R9S0T', 'I6J7K8L9M0N', 'Entretenimiento(Pelis, Videojuegos)', 'Y6Z7A8B9C0D');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('I1J2K3L4M5N', 'W6X7Y8Z9A0B', 'Arte y Manualidades', 'S6T7U8V9W0X');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('C6D7E8F9G0H', 'I6J7K8L9M0N', 'Moda Deportiva', 'C1D2E3F4G5H');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('W1X2Y3Z4A5B', 'I1J2K3L4M5N', 'Moda Íntima', 'Y1Z2A3B4C5D');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Q6R7S8T9U0V', 'U6V7W8X9Y0Z', 'Ropa de Dormir', 'S6T7U8V9W0X');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('K1L2M3N4O5P', 'C1D2E3F4G5H', 'Ropa de Trabajo', 'N6O7P8Q9R0S');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('E6F7G8H9I0J', 'I6J7K8L9M0N', 'Ropa de Maternidad', 'A6B7C8D9E0F');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('Y1Z2A3B4C5D', 'S1T2U3V4W5X', 'Ropa de Tallas Grandes', 'S1T2U3V4W5X');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('S6T7U8V9W0X', 'K1L2M3N4O5P', 'Ropa de Mujer', 'H1I2J3K4L5M');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('M1N2O3P4Q5R', 'M6N7O8P9Q0R', 'Ropa de Tallas Pequeñas', 'U1V2W3X4Y5Z');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('G6H7I8J9K0L', 'K6L7M8N9O0P', 'Moda Sostenible', 'A1B2C3D4E5F');
INSERT INTO departamento (cod_dpto, cod_suc, nombre, responsable) VALUES ('A1B2C3D4E5F', 'U1V2W3X4Y5Z', 'Moda Vintage', 'Q1R2S3T4U5V');



/*EMPLEADO (30)*/
    
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('45678901V', '288745123690', 'I1J2K3L4M5N', 'separado', '2023-05-15', 'A1B2C3D4E5F', 'K1L2M3N4O5P', 'Y1Z2A3B4C5D');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('89012345Q', '282356789041', 'O6P7Q8R9S0T', 'divorciado', '2005-11-28', 'G6H7I8J9K0L', 'Q6R7S8T9U0V', 'E6F7G8H9I0J');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('43210987R', '288945612073', 'U1V2W3X4Y5Z', 'viudo', '2010-08-03', 'M1N2O3P4Q5R', 'W1X2Y3Z4A5B', 'K1L2M3N4O5P');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('76543210S', '284567890123', 'A6B7C8D9E0F', 'viudo', '2022-04-17', 'S6T7U8V9W0X', 'C6D7E8F9G0H', 'Q6R7S8T9U0V');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('32109876T', '285678234109', 'G1H2I3J4K5L', 'casado', '2008-09-22', 'Y1Z2A3B4C5D', 'I1J2K3L4M5N', 'W1X2Y3Z4A5B');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('23456789U', '287834920561', 'M6N7O8P9Q0R', 'viudo', '2015-12-09', 'E6F7G8H9I0J', 'O6P7Q8R9S0T', 'C6D7E8F9G0H');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('54321098V', '281209876345', 'S1T2U3V4W5X', 'separado', '2002-07-11', 'K1L2M3N4O5P', 'U1V2W3X4Y5Z', 'I1J2K3L4M5N');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('45678901W', '283402156789', 'Y6Z7A8B9C0D', 'viudo', '2018-02-14', 'Q6R7S8T9U0V', 'A6B7C8D9E0F', 'O6P7Q8R9S0T');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('89580645X', '289567804321', 'E1F2G3H4I5J', 'soltero', '2004-06-26', 'W1X2Y3Z4A5B', 'G1H2I3J4K5L', 'U1V2W3X4Y5Z');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('67890123Y', '287890456123', 'K6L7M8N9O0P', 'unión libre', '2019-10-07', 'C6D7E8F9G0H', 'M6N7O8P9Q0R', 'A6B7C8D9E0F');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('21345678Z', '289012345678', 'Q1R2S3T4U5V', 'divorciado', '2006-03-19', 'I1J2K3L4M5N', 'S1T2U3V4W5X', 'G1H2I3J4K5L');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('98765432A', '284562187903', 'W6X7Y8Z9A0B', 'soltero', '2021-01-30', 'O6P7Q8R9S0T', 'Y6Z7A8B9C0D', 'M6N7O8P9Q0R');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('54321098B', '286789034512', 'C1D2E3F4G5H', 'unión libre', '2009-08-24', 'U1V2W3X4Y5Z', 'E1F2G3H4I5J', 'S1T2U3V4W5X');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('89012345C', '281324567890', 'I6J7K8L9M0N', 'soltero', '2013-05-02', 'A6B7C8D9E0F', 'K6L7M8N9O0P', 'Y6Z7A8B9C0D');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('23456789D', '287890654321', 'O1P2Q3R4S5T', 'divorciado', '2003-12-11', 'G1H2I3J4K5L', 'Q1R2S3T4U5V', 'E1F2G3H4I5J');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('34567890E', '285678432190', 'U6V7W8X9Y0Z', 'soltero', '2016-09-18', 'M6N7O8P9Q0R', 'W6X7Y8Z9A0B', 'K6L7M8N9O0P');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('67890123F', '282345678901', 'A1B2C3D4E5F', 'unión libre', '2011-07-04', 'S1T2U3V4W5X', 'C1D2E3F4G5H', 'Q1R2S3T4U5V');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('12345678G', '288901234567', 'G6H7I8J9K0L', 'soltero', '2007-02-23', 'Y6Z7A8B9C0D', 'I6J7K8L9M0N', 'W6X7Y8Z9A0B');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('56789012H', '285678012342', 'M1N2O3P4Q5R', 'divorciado', '2014-04-05', 'E1F2G3H4I5J', 'O1P2Q3R4S5T', 'C1D2E3F4G5H');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('87654321I', '289087654321', 'S6T7U8V9W0X', 'unión libre', '2020-11-27', 'K6L7M8N9O0P', 'U6V7W8X9Y0Z', 'I6J7K8L9M0N');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('12345678J', '283456789012', 'C6D7E8F9G0H', 'divorciado', '2001-10-15', 'Q1R2S3T4U5V', 'E1F2G3H4I5J', 'O1P2Q3R4S5T');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('98765432K', '282198765430', 'Q6R7S8T9U0V', 'unión libre', '2017-06-08', 'W6X7Y8Z9A0B', 'K1L2M3N4O5P', 'U6V7W8X9Y0Z');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('45678901L', '285432167890', 'W1X2Y3Z4A5B', 'soltero', '2000-09-13 ', 'C1D2E3F4G5H', 'M6N7O8P9Q0R', 'A1B2C3D4E5F');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('89012345M', '288901723456', 'K1L2M3N4O5P', 'unión libre', '2021-03-21', 'I6J7K8L9M0N', 'Q6R7S8T9U0V', 'G6H7I8J9K0L');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('56789012N', '283410987652', 'E6F7G8H9I0J', 'soltero', '2005-12-06', 'O1P2Q3R4S5T', 'C1D2E3F4G5H', 'M1N2O3P4Q5R');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('12345678O', '287650912345', 'Y1Z2A3B4C5D', 'unión libre', '2012-08-30', 'U6V7W8X9Y0Z', 'O6P7Q8R9S0T', 'S6T7U8V9W0X');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('23456789P', '282345678091', 'B6C7D8E9F0G', 'soltero', '2018-05-11', 'A1B2C3D4E5F', 'K1L2M3N4O5P', 'Y1Z2A3B4C5D');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('87654321Q', '289876543210', 'H1I2J3K4L5M', 'soltero', '2004-02-24', 'G6H7I8J9K0L', 'I6J7K8L9M0N', 'E6F7G8H9I0J');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('34567890R', '285678901234', 'N6O7P8Q9R0S', default, '2019-10-29', 'M1N2O3P4Q5R', 'W1X2Y3Z4A5B', 'I1J2K3L4M5N');
INSERT INTO empleado (DNI, NSS, cod_emp, est_civil, fecha_incorporacion, cod_dpto, cod_suc, cod_jefe) VALUES ('46389446S', '280123456789', 'T1U2V3W4X5Y', default, '2006-06-14', 'S6T7U8V9W0X', 'I1J2K3L4M5N', 'Y1Z2A3B4C5D');



-- Volver a activar las FKs para evitar errores futuros
set FOREIGN_KEY_CHECKS = 1;
