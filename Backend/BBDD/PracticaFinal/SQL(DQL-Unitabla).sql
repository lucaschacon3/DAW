Selects con filtro y orden: (A PARA LUCAS C)

(A)

ENUNCIADO: Escribe una consulta que devuelva la información de los empleados que tienen una antigüedad de más de 3 años en la empresa y trabajan en sucursales 
que el código comienza con "K1". La información debe incluir el DNI, código de empleado, antigüedad (en días), código de departamento, y código de sucursal (cod_suc). 
Ordena los resultados por antigüedad de manera descendente.

SELECT DNI, cod_emp, TIMESTAMPDIFF(DAY,fecha_incorporacion, CURDATE()) AS antiguedad, cod_dpto, cod_suc
FROM empleado
WHERE TIMESTAMPDIFF(DAY,fecha_incorporacion, CURDATE()) > (3 * 365) AND cod_suc LIKE 'K1%'
ORDER BY antiguedad DESC;

Total filas: 2
+-----------+-------------+------------+-------------+-------------+
| DNI       | cod_emp     | antiguedad | cod_dpto    | cod_suc     |
+-----------+-------------+------------+-------------+-------------+
| 98765432K | Q6R7S8T9U0V |       2427 | W6X7Y8Z9A0B | K1L2M3N4O5P |
| 23456789P | B6C7D8E9F0G |       2090 | A1B2C3D4E5F | K1L2M3N4O5P |
+-----------+-------------+------------+-------------+-------------+


Selects con funciones de fechas: (B PARA LUCAS S) 

(B)
   
ENUNCIADO: Obtén los empleados que lleven más de 15 años en la empresa a día de hoy. Ordenarlos por su fecha de incorporación y mostrarla con el formato dd/mm/aaaa. 
Además indicar a qué departamento y sucursal pertenecen.

SELECT cod_emp, DATE_FORMAT(fecha_incorporacion, "%d/%m/%Y") AS fecha_de_incorporación, cod_dpto, cod_suc
FROM empleado
WHERE timestampdiff(YEAR, fecha_incorporacion, curdate()) > 15
ORDER BY fecha_incorporacion;

Total filas: 11
+-------------+------------------------+-------------+-------------+
| cod_emp     | fecha de incorporación | cod_dpto    | cod_suc     |
+-------------+------------------------+-------------+-------------+
| W1X2Y3Z4A5B | 13/09/2000             | C1D2E3F4G5H | M6N7O8P9Q0R |
| C6D7E8F9G0H | 15/10/2001             | Q1R2S3T4U5V | E1F2G3H4I5J |
| S1T2U3V4W5X | 11/07/2002             | K1L2M3N4O5P | U1V2W3X4Y5Z |
| O1P2Q3R4S5T | 11/12/2003             | G1H2I3J4K5L | Q1R2S3T4U5V |
| H1I2J3K4L5M | 24/02/2004             | G6H7I8J9K0L | I6J7K8L9M0N |
| E1F2G3H4I5J | 26/06/2004             | W1X2Y3Z4A5B | G1H2I3J4K5L |
| O6P7Q8R9S0T | 28/11/2005             | G6H7I8J9K0L | Q6R7S8T9U0V |
| E6F7G8H9I0J | 06/12/2005             | O1P2Q3R4S5T | C1D2E3F4G5H |
| Q1R2S3T4U5V | 19/03/2006             | I1J2K3L4M5N | S1T2U3V4W5X |
| T1U2V3W4X5Y | 14/06/2006             | S6T7U8V9W0X | I1J2K3L4M5N |
| G6H7I8J9K0L | 23/02/2007             | Y6Z7A8B9C0D | I6J7K8L9M0N |
+-------------+------------------------+-------------+-------------+

ENUNCIADO: Obtén los empleados que se incorporaron a la empresa un sábado y añadir a su fecha de incorporación 2 años y 9 meses.
   
SELECT cod_emp, date_add(date_add(fecha_incorporacion, interval 9 MONTH), interval 2 YEAR) AS nueva_fecha_incorporacion
FROM empleado
WHERE WEEKDAY(fecha_incorporacion) = 5;

Total filas: 3
+-------------+---------------------------+
| cod_emp     | nueva_fecha_incorporacion |
+-------------+---------------------------+
| M1N2O3P4Q5R | 2017-01-05                |
| E1F2G3H4I5J | 2007-03-26                |
| W6X7Y8Z9A0B | 2023-10-30                |
+-------------+---------------------------+

Selects con funciones numéricas(y otro tipo si fuera necesario): (C PARA JORGE) Y (D PARA JORGE)

(C)

ENUNCIADO: Obtener la diferencia entre la cantidad invertida máxima con respecto a la media, 
y también calcular la diferencia entre el número de acciones mínimo con respecto a la media.

SELECT ROUND(ABS(MAX(cant_invertida) - AVG(cant_invertida)), 2) AS diferencia_max_cant_invertida, TRUNCATE(ABS(MIN(num_acciones) - AVG(num_acciones)), 0) AS diferencia_min_num_acciones
FROM inversor;

Total de filas: 1
+-------------------------------+-----------------------------+
| diferencia_max_cant_invertida | diferencia_min_num_acciones |
+-------------------------------+-----------------------------+
|                     288334.31 |                        2948 |
+-------------------------------+-----------------------------+

(D)

ENUNCIADO: Calcula la suma total y la media de precios de las prendas de ropa para cada temporada. 
Además queremos saber las temporadas en las que su suma total sea superior a 500. Los resultados se ordenan por temporada. 

SELECT temporada, ROUND(SUM(precio), 2) AS precio_por_temporada, ROUND(AVG(precio), 2) AS media_por_temporada
FROM prenda
GROUP BY temporada
HAVING SUM(precio) > 500
ORDER BY temporada ASC;

Total de filas: 3
+-----------+----------------------+---------------------+
| temporada | precio_por_temporada | media_por_temporada |
+-----------+----------------------+---------------------+
| primavera |               578.67 |               28.93 |
| otoño     |               694.08 |               38.56 |
| invierno  |                845.3 |               49.72 |
+-----------+----------------------+---------------------+

Selects con funciones de texto: (E PARA LUCAS C) Y (F PARA LUCAS S)

(E)
ENUNCIADO: Escribe una consulta que devuelva una lista de personas con su DNI y un campo llamado "nombre_modificado" que contenga una versión 
modificada del nombre, primer apellido y segundo apellido. La modificación consiste en invertir el orden de las letras en el nombre, duplicar 
la segunda letra en el primer apellido, y eliminar todas las letras 'a' del segundo apellido. Además, crea un campo adicional llamado "longitud_total" 
que contenga la suma de las longitudes de todas las cadenas de nombre, primer apellido y segundo apellido. 
Solo se deben incluir las filas donde la longitud total sea igual a 19 o 20. Ordena los resultados por la longitud total de manera descendente.

SELECT DNI, CONCAT(REVERSE(nombre), CONCAT(SUBSTRING(apellido_1, 1, 1), SUBSTRING(apellido_1, 2, 1), SUBSTRING(apellido_1, 2)), REPLACE(apellido_2, 'a', '')) 
AS nombre_modificado, LENGTH(REVERSE(nombre)) + LENGTH(CONCAT(SUBSTRING(apellido_1, 1, 1), SUBSTRING(apellido_1, 2, 1), SUBSTRING(apellido_1, 2))) + LENGTH(REPLACE(apellido_2, 'a', '')) AS longitud_total
FROM persona
WHERE LENGTH(REVERSE(nombre)) + LENGTH(CONCAT(SUBSTRING(apellido_1, 1, 1), SUBSTRING(apellido_1, 2, 1), SUBSTRING(apellido_1, 2))) + LENGTH(REPLACE(apellido_2, 'a', '')) BETWEEN 19 AND 20
ORDER BY longitud_total DESC;

Total filas: 24
+-----------+----------------------+----------------+
| DNI       | nombre_modificado    | longitud_total |
+-----------+----------------------+----------------+
| 23456789D | otreblARooblesBsilio |             20 |
| 23456789Q | zirtaeBSeerranoOrteg |             20 |
| 90123456N | náirdAToorresRomero  |             20 |
| 89580645X | ordePSeeguraBenítez  |             20 |
| 89012345Q | airotciVBrravoPlcios |             20 |
| 45678901W | leuqaRLoozanoRoldán  |             20 |
| 87654321B | oinotnASaantosCbello |             20 |
| 78901234P | ésoJNaavarroHerrero  |             20 |
| 67890123Y | alegnAHeerreraRobles |             20 |
| 67890123L | odnanreFGaallegoBrvo |             20 |
| 56789012N | sámoTGaalánGrrido    |             19 |
| 98765432K | ailataNMeedinaRiver  |             19 |
| 98765432E | aivliSCaabelloCámr   |             19 |
| 76543210Y | aicilACoorderoSntos  |             19 |
| 56789012P | oravlÁSaantosLeón    |             19 |
| 12345678J | otsenrEArranaGscón   |             19 |
| 56789012L | oigreSDííazTorres    |             19 |
| 54321098R | leunaMHeerreroMolin  |             19 |
| 54321098B | níuqaoJRooldánAbd    |             19 |
| 45678901M | aíraMAllonsoAlonso   |             19 |
| 34567890J | oiraMRaamosEstévez   |             19 |
| 32109876T | leinaDDuuránHerrer   |             19 |
| 21098765U | leuqaRDeelgadoMedin  |             19 |
| 12345678Z | oicangIPaaredesSlzr  |             19 |
+-----------+----------------------+----------------+

(F)

ENUNCIADO: Obtén las url, sin el indicativo del protocolo de seguridad (https://), de las marcas de ropa cuya fecha de creación sea anterior al inicio de la 2ª Guerra Mundial (1939). Mostrar la fecha de creación con el formato "dd de mm de aaaa".

SELECT nombre, substring_index(url_pag_web, "/", -1) AS url, DATE_FORMAT(fecha_creacion, "%d de %m de %Y") AS fecha_creacion
FROM marca_de_ropa
WHERE YEAR(fecha_creacion) < 1939;

Total filas: 4
+------------------+---------------------------+------------------+
| nombre           | url                       | fecha_creacion   |
+------------------+---------------------------+------------------+
| EclipticEnsemble | www.eclipticensemble.com  | 26 de 11 de 1928 |
| NebulaCouture    | www.nebulacouture.co      | 30 de 10 de 1935 |
| PinnacleWear     | www.pinnaclewear.com      | 19 de 02 de 1937 |
| UrbanAura        | www.urbanaura-fashion.com | 21 de 04 de 1933 |
+------------------+---------------------------+------------------+


(G) (entre los tres cuando lo demos)

ENUNCIADO: Obtén el CIF y el nombre de los proveedores que suministran alguna materia prima en estado bueno o perfecto a marcas de ropa creadas después de 1940. Mostrarlos ordenados alfabéticamente por el CIF.

SELECT CIF, nombre
FROM proveedor
WHERE CIF IN (SELECT CIF FROM suministra WHERE cod_mp IN (SELECT cod_mp FROM materia_prima WHERE estado = "perfecto" OR estado = "bueno") AND nombre IN (SELECT nombre FROM marca_de_ropa WHERE YEAR(fecha_creacion) > 1940))
ORDER BY CIF;

Total filas: 11
+-----------+-------------------------------+
| CIF       | nombre                        |
+-----------+-------------------------------+
| A13579246 | TejidosElegantes S.A.         |
| B86420973 | AlgodónPuro Textiles          |
| C79164238 | TelaInnovadora Ltd.           |
| D25814769 | HiloArte Suministros Textiles |
| H62487931 | SedaDeluxe Trading            |
| K63284719 | AccesoriosTextiles Globales   |
| O47268193 | ModaSostenible EcoFabrics     |
| U83927146 | TelasDeportivas Performance   |
| W31862497 | HilosCreativos Import         |
| X97531268 | TelasEstampadas Express       |
| Y63284719 | CueroFino Textil Ltda.        |
+-----------+-------------------------------+
