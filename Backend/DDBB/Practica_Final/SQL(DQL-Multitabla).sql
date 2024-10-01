Pregunta 1 - Lucas C
Pregunta 2 - Lucas S
Pregunta 3 - Jorge
Pregunta 4 - Lucas C
Pregunta 5 - Lucas S
Presentación - Jorge



--1. Se necesita un informe sobre los empleados de la empresa, incluyendo sus dos apellidos, 
--su fecha de incorporación con formato "XX de XX del XX", nombre del departamento en el que trabajan y el número de años que han trabajado 
--en el departamento hasta la fecha actual. Siempre que se hayan incorporado entre el primer mundial y la última eurocopa de fútbol ganado por España.

SELECT CONCAT(p.apellido_1, ' ', p.apellido_2) AS apellidos,
       DATE_FORMAT(e.fecha_incorporacion, '%d de %m del %y') AS fecha_incorporacion_formato,
       d.nombre AS nombre_departamento,
       YEAR(CURDATE()) - YEAR(e.fecha_incorporacion) AS años_trabajados_en_departamento
FROM empleado e
JOIN persona p 
JOIN departamento d 
ON e.cod_dpto = d.cod_dpto AND e.dni = p.dni
WHERE YEAR(e.fecha_incorporacion) <= 2012 AND YEAR(e.fecha_incorporacion) >= 2010;

+------------------+-----------------------------+--------------------------+----------------------------------+
| apellidos        | fecha_incorporacion_formato | nombre_departamento      | años_trabajados_en_departamento  |
+------------------+-----------------------------+--------------------------+----------------------------------+
| Cordero Márquez  | 30 de 08 del 12             | Deportes y Aire Libre    |                               12 |
| Cuesta Lozano    | 03 de 08 del 10             | Ropa de Tallas Pequeñas  |                               14 |
| Cuesta Lozano    | 03 de 08 del 10             | Electrónica de Consumo   |                               14 |
| Calvo Medina     | 04 de 07 del 11             | Equipaje y Viajes        |                               13 |
+------------------+-----------------------------+--------------------------+----------------------------------+
4 rows in set (0,00 sec)


--2. Busca la marca de ropa cuya longitud del nombre sea 12 o menos y pase lo mismo con los nombres de los departamentos y sucursales.
--También se necesita un código formado por la segunda y quinta letra del nombre de la marca, 
--las tres primeras letras del nombre del departamento y las dos últimas del nombre de la sucursal (todo en minúsculas).

SELECT m.nombre, d.cod_dpto, s.cod_suc, LOWER(CONCAT(SUBSTRING(m.nombre, 2, 1), SUBSTRING(m.nombre, 5, 1), "-", LEFT(d.nombre, 3), "-", RIGHT(s.nombre, 2))) AS codigo
FROM departamento d
JOIN sucursal s ON d.cod_suc = s.cod_suc
JOIN marca_de_ropa m ON s.marca = m.nombre
WHERE LENGTH(d.nombre) <= 12 AND LENGTH(s.nombre) <= 12 AND LENGTH(m.nombre) <= 12;

+----------+-------------+-------------+-----------+
| nombre   | cod_dpto    | cod_suc     | codigo    |
+----------+-------------+-------------+-----------+
| NovaChic | A1B2C3D4E5F | K6L7M8N9O0P | oc-tec-ed |
+----------+-------------+-------------+-----------+
1 row in set (0.00 sec)


--3 Obtén el recuento total de empleados, junto con su DNI, nombre, estado civil 
-- y nombre de los departamentos que empiecen por la letra A y cuya sucursal esten ubicadas en calles.

SELECT COUNT(*) AS total_empleados, e.DNI, p.nombre AS nombre_empleado, e.est_civil, d.nombre AS nombre_departamento
FROM empleado e 
JOIN persona p ON e.DNI = p.DNI 
JOIN departamento d ON e.cod_dpto = d.cod_dpto 
JOIN sucursal s ON d.cod_suc = s.cod_suc 
WHERE d.nombre LIKE 'A%' AND s.dir LIKE '%C/%'
GROUP BY e.DNI, p.nombre, e.est_civil, d.nombre;

+-----------------+-----------+-----------------+--------------+---------------------+
| total_empleados | DNI       | nombre_empleado | est_civil    | nombre_departamento |
+-----------------+-----------+-----------------+--------------+---------------------+
|               1 | 34567890E | Julia           | soltero      | Automotriz          |
|               1 | 87654321I | Adriana         | unión libre  | Alimentos y Bebidas |
|               1 | 89580645X | Pedro           | soltero      | Accesorios de Moda  |
|               1 | 21345678Z | Rubén           | divorciado   | Arte y Manualidades |
+-----------------+-----------+-----------------+--------------+---------------------+
4 rows in set (0,00 sec)


--4. La empresa de moda quiere identificar a los proveedores que han suministrado una materia 
--prima en estado "perfecto". Se quiere el nombre de cada proveedor, el nombre de la marca de ropa y 
--la cantidad total de materias primas suministradas en estado "perfecto" por cada uno de ellos.

SELECT p.nombre AS nombre_proveedor, 
       m.nombre AS nombre_marca_ropa,
       COUNT(*) AS cantidad_materias_primas_perfectas
FROM proveedor p
JOIN suministra s ON p.CIF = s.CIF
JOIN materia_prima mp ON s.cod_mp = mp.cod_mp AND mp.estado = 'perfecto'
JOIN marca_de_ropa m ON s.nombre = m.nombre
GROUP BY p.CIF, p.nombre, m.nombre
HAVING COUNT(*) = 1;

+-------------------------------+-------------------+------------------------------------+
| nombre_proveedor              | nombre_marca_ropa | cantidad_materias_primas_perfectas |
+-------------------------------+-------------------+------------------------------------+
| HiloArte Suministros Textiles | NovaChic          |                                  1 |
| FibraCreativa Suppliers       | PinnacleWear      |                                  1 |
| LanaFina Proveedores          | EclipticEnsemble  |                                  1 |
| CueroFino Textil Ltda.        | NovaChic          |                                  1 |
| HilosCreativos Import         | EtherealAttire    |                                  1 |
| TejidosElegantes S.A.         | LuminaStyle       |                                  1 |
| TintesVibrantes y Textiles    | UrbanAura         |                                  1 |
| ModaSostenible EcoFabrics     | NovaChic          |                                  1 |
| CueroFino Textil Ltda.        | QuantumThreads    |                                  1 |
| AlgodónPuro Textiles          | QuantumThreads    |                                  1 |
| AccesoriosTextiles Globales   | VelvetRogue       |                                  1 |
| TelasEstampadas Express       | VelvetRogue       |                                  1 |
| ModaSostenible EcoFabrics     | MirageModa        |                                  1 |
| ModaInfantil Fabrics          | PinnacleWear      |                                  1 |
| HilosCreativos Import         | PinnacleWear      |                                  1 |
| AccesoriosTextiles Globales   | QuantumThreads    |                                  1 |
| LinoLujoso Fabrics            | QuantumThreads    |                                  1 |
| EncajeElegante Distributors   | UrbanAura         |                                  1 |
+-------------------------------+-------------------+------------------------------------+
18 rows in set (0,01 sec)


--5. Encuentra los DNI de los fundadores y los CEOs junto a su fecha de fundación o de inicio en el cargo.
SELECT DNI, fecha_fundacion AS "fundación / inicio en el cargo" FROM fundador
UNION
SELECT DNI, fecha_inicio FROM CEO;

+-----------+--------------------------------+
| DNI       | fundación / inicio en el cargo |
+-----------+--------------------------------+
| 23456789G | 1902-09-04                     |
| 32198765E | 1909-05-07                     |
| 45678912C | 1924-08-06                     |
| 54321098I | 1916-06-28                     |
| 65432178D | 1912-01-17                     |
| 78945612F | 1923-04-21                     |
| 87654321H | 1906-01-15                     |
| 98754321B | 1908-03-25                     |
| 23456789Q | 1954-03-18                     |
| 45678901M | 1982-01-09                     |
| 54321098R | 1996-07-03                     |
| 56789012L | 1963-08-16                     |
| 67890123O | 1985-11-14                     |
| 78901234P | 1948-09-01                     |
| 82345671J | 1991-04-07                     |
| 87654321S | 1998-12-26                     |
| 89012345K | 1969-06-23                     |
| 90123456N | 1935-05-27                     |
+-----------+--------------------------------+
18 rows in set (0.00 sec)