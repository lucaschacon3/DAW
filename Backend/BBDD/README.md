1. Modelo entidad relación.
2. Modelo ralacional y normalización.
3. DDL: creacion y modificación de tablas.
4. DML: insert, update, delete.
5. DQL: consultas (unitabla y multitabla).
6. DCL: seguridad
7. PL/SQL: programación.
8. Modelo no relacional (NoSQL) MongoDB.

## **Comandos MySQL**

- **Abrir MySQL como superusuario**:
    
    ```bash
    sudo mysql, mysql -u root -p
    
    ```
    
- **Ayuda en MySQL**:
    
    ```sql
    HELP, HELP CONTENTS, HELP (comando), HELP SELECT
    
    ```
    
- **Añadir base de datos (para grandes archivos, ejecutar el archivo SQL)**:
    
    ```sql
    "source /home/miusuario/descargas/peticiones.sql" //tarda
    
    ```
    
- **Crear base de datos**:
    
    ```sql
    create database prueba;
    
    ```
    
- **Ver los usuarios**:
    
    ```sql
    select user, host from mysql.user;
    
    ```
    
- **Visualizar las bases de datos existentes**:
    
    ```sql
    show databases;
    
    ```
    
- **Usar o cambiar de base de datos**:
    
    ```sql
    use (nombre de base);
    
    ```
    
- **Ver las tablas creadas**:
    
    ```sql
    show tables;
    
    ```
    
- **Ver la estructura de las tablas**:
    
    ```sql
    show create table (nombre de la tabla);
    
    ```
    
- **Ver los datos de la tabla**:
    
    ```sql
    describe/desc (nombre de la tabla);
    
    ```
    
- **Ver los inserts en la tabla**:
    
    ```sql
    select * from (nombre de la tabla);
    
    ```
    
- **Eliminar la base de datos y todo lo que contenga**:
    
    ```sql
    drop database (nombre de la base de datos);
    
    ```
    
- **Eliminar la tabla y todo lo que contenga**:
    
    ```sql
    drop table (nombre de la tabla);
    
    ```
    
- **Salir de MySQL**:
    
    ```sql
    exit;
    
    ```
    
- **Limpiar la terminal**:
    
    ```sql
    system clear;
    
    ```
    

---

## **MySQL Workbench**

- **Crear un usuario admin en MySQL**:
    
    ```sql
    create user admin@"localhost" identified by "Lucas";
    
    ```
    
- **Asignar privilegios al usuario**:
    
    ```sql
    grant all privileges on *.* to admin@"localhost";
    
    ```
    
- **Abrir proyecto en MySQL Workbench**:
Una vez en el terminal, ejecutar:
    
    ```sql
    sudo mysql
    
    ```
    
    Luego crear un usuario administrador:
    
    ```sql
    create user admin@"localhost" identified by "Lucas";
    grant all privileges on *.* to admin@"localhost";
    
    ```
    
    En el Workbench, usar la opción "Database Reverse Engineer", introducir el usuario, luego seleccionar la base de datos y el ejercicio que deseas abrir.
    

---

## **Crear usuario**

- **Crear usuario**: Hacer esto desde root y darle privilegios al usuario.
    
    ```sql
    create user <nombre>@<direccion> identified by <contraseña>;
    create user 'nuevo_usuario'@'localhost' identified BY 'clave_segura';
    
    create user "user2"@"10.230.254.0" identified by "1234";
    create user "user3"@"%" identified by "1234";
    
    ```
    
- Para entrar
    
    ```bash
    mysql nombre_bbdd -u nombre_usuario -pContraseña
    mysql dwes1 -u daw2 -pLaElipa
    
    ```
    

---

## **Dar privilejios**

- **Dar privilegios**:
    
    ```sql
    grant <privilegios> on <destino> to <usuario>@<dirección> [opcion];
    grant select, insert on *.* to "user1"@"10.230.98.181";
    
    grant all privileges on *.* to "user1"@"10.230.98.181";
    GRANT ALL PRIVILEGES ON nobre_bbdd.* TO 'usuario'@'localhost';
    
    grant select, insert, delete on prueba.* to "user1"@"10.230.98.181";
    
    ```
    
- **Dar privilegios con opción de delegar**:
    
    ```sql
    grant select, insert on *.* to "user2"@"10.230.254.0" with grant option;
    grant select, insert, delete on prueba.* to "user2"@"10.230.254.0" with grant option;
    
    ```
    

---

## **Quitar privilejios**

- **Revocar privilegios**:
    
    ```sql
    revoke <privilegios> [opcion] on <destino> from <usuario>@<dirección>;
    revoke select, insert on *.* from "user1"@"10.230.98.181";
    revoke grant option on prueba.* from "user2"@"10.230.254.0";
    
    ```
    

---

## **Bloqueos de tablas**

- **Bloquear tablas**:
    
    ```sql
    lock table <tabla> read;  // Para actualización, borrado o inserción.
    lock table <tabla> write;  // Para seleccionar.
    unlock tables; // Desbloquear.
    
    ```
    

---

## **Acceso a servidor remoto**

- **Acceso a servidor MySQL**:
    - Para servidor propio:
        
        ```bash
        sudo mysql, mysql -u usuario -p
        
        ```
        
    - Para conectarse a un servidor remoto:
        
        ```bash
        mysql -u usuario -p -h url_o_direccion_ip
        
        ```
        
- **Habilitar acceso remoto** (en el servidor):
    
    ```bash
    cd /etc/mysql/mysql.conf.d/
    sudo nano mysqld.cnf
    bind-address = 0.0.0.0
    sudo systemctl restart mysql.service
    
    ```
    

---

## **Tablas**

- **Crear tabla**:
    
    ```sql
    create table Prueba(
        idP int,
        constraint PK_Prueba primary key(idP)
    );
    
    ```
    
- **Crear tabla con claves foráneas**:
    
    ```sql
    create table Ejemplo(
        idE int,
        constraint PK_Ejemplo primary key(idE),
        constraint FK_Ejemplo foreign key(idE) references Prueba(idP) on delete cascade on update restrict
    );
    
    ```
    

---

## **Tipos de datos**

```sql
id int(5) zerofill auto_increment primary key,  -- ceros a la izquierda
id double default 4.75,
id enum("D1","D2","D3","D4"),
id varchar(30) default "Begin",
id date default "2010-01-21",
id datetime default "YYYY-MM-DD hh:mm:ss",
id int unsigned auto_increment primary key,
id varchar(2) not null,
id decimal(10,4) not null,

```

---

## **Constraints**

- **Usar `CHECK` en una tabla**:
    
    ```sql
    create table Tab3 (
        a int,
        b int,
        constraint Tab3_check(a < b)
    );
    
    ```
    
- **Tipos de eliminación en claves foráneas**:
    - `RESTRICT` o `NO ACTION`: No se borra la fila referenciada.
    - `CASCADE`: Los cambios en la fila referenciada afectan a las filas que las referencian.
    - `SET NULL`: Si la columna permite nulos, se borran las filas.
    - `SET DEFAULT`: Si se borra, se establece un valor por defecto en las filas que hacen referencia.

---

## Aterar tablas

- **Añadir columnas**:
    
    ```sql
    alter table Ejemplo add column id int;
    
    ```
    
- **Eliminar columnas**:
    
    ```sql
    alter table Ejemplo drop column id;
    
    ```
    
- **Añadir restricciones**:
    
    ```sql
    alter table Ejemplo add constraint PK_Ejemplo primary key id;
    
    ```
    
- **Eliminar restricciones**:
    
    ```sql
    alter table Ejemplo drop constraint PK_Ejemplo;
    
    ```
    
- **Modificar columnas existentes**:
    
    ```sql
    alter table Ejemplo change column id id2 int;
    
    ```
    
- **Renombrar columnas**:
    
    ```sql
    alter table Ejemplo rename column id to id2;
    
    ```
    
- **Añadir claves foráneas**:
    
    ```sql
    alter table Ejemplo add constraint FK_E_P foreign key(idE) references Prueba(idP);
    
    ```
    

---

## **Operaciones crud**

- **Insertar datos**:
    
    ```sql
    insert into Ejemplo values ("perro",3, default, null);
    insert into Ejemplo (animal, vacunas, id, dueño) values ("perro",3, default, null);
    
    ```
    
- **Insertar múltiples registros**:
    
    ```sql
    insert into Ejemplo values ("perro",3, default, null), ("gato",5, default, null);
    
    ```
    
- **Actualizar datos**:
    
    ```sql
    UPDATE mascotas SET propietario='Lucía' WHERE Nombre='Piolín';
    
    ```
    
- **Borrar datos**:
    
    ```sql
    DELETE FROM mascotas WHERE Nombre = 'Piolín';
    
    ```
    

---

## **Consultas**

- **Mostrar todos los registros de una tabla**:
    
    ```sql
    SELECT * FROM Mascotas;
    
    ```
    
- **Seleccionar columnas específicas**:
    
    ```sql
    SELECT nombre, nacimiento, nombre FROM Mascotas;
    
    ```
    
- **Evitar duplicados con `DISTINCT`**:
    
    ```sql
    SELECT DISTINCT sexo, especie FROM Mascotas;
    
    ```
    
- **Usar alias para las columnas**:
    
    ```sql
    SELECT nombre AS apodo, especie FROM Mascotas;
    
    ```
    
- **Ordenar resultados**:
    
    ```sql
    SELECT nombre, especie, nacimiento FROM Mascotas ORDER BY especie, nacimiento DESC;
    
    ```
    
- **Filtrar con condiciones (`WHERE`)**:
    
    ```sql
    SELECT nombre, especie, sexo FROM Mascotas WHERE sexo = "f" OR NOT (especie = "Perro");
    
    ```
    
- **Seleccionar con un rango de años**:
    
    ```sql
    SELECT nombre, nacimiento FROM Mascotas WHERE YEAR(nacimiento) BETWEEN 2000 AND 2001;
    
    ```
    
- **Seleccionar con valores específicos**:
    
    ```sql
    SELECT nombre, nacimiento FROM Mascotas WHERE propietario IN ("David", "Diana", "Juan");
    
    ```
    
- **Limitar el número de resultados**:
    
    ```sql
    SELECT Name, Population FROM Country ORDER BY Population DESC LIMIT 4;
    
    ```
    

---

## **Like en búsquedas**

- **Comodines en `LIKE`**:
    - `_` : Sustituye por un solo carácter.
    - `%` : Sustituye por cualquier secuencia de caracteres.
    
    ```sql
    SELECT nombre FROM Mascotas WHERE nombre LIKE 'A% Gonzale_';
    
    ```
    

---

## **Funciones fechas**

- **Obtener partes de una fecha**:
    
    ```sql
    SELECT YEAR("2001-12-13"), DAY("2001-12-13"), MONTH("2001-12-13");
    
    ```
    
- **Calcular la diferencia entre fechas**:
    
    ```sql
    SELECT TIMESTAMPDIFF(YEAR, "2008-02-05", "2010-02-08");
    
    ```
    
- **Fecha actual**:
    
    ```sql
    SELECT CURDATE();
    
    ```
    
- **Sumar días a una fecha**:
    
    ```sql
    SELECT DATE_ADD("2009-05-25", INTERVAL 250 DAY);
    
    ```
    
- **Obtener el día de la semana**:
    
    ```sql
    SELECT WEEKDAY("2022-01-20");
    SELECT DAYOFWEEK("2022-01-20");
    
    ```
    
- **Formato de fecha**:
    
    ```sql
    SELECT DATE_FORMAT("2020-01-29", "%d de %m de %Y");
    
    ```
    
- **Configuración regional en español**:
    
    ```sql
    SET lc_time_names = 'es_ES';
    
    ```
    

---

## **Funciones cadenas**

- **Longitud de una cadena**:
    
    ```sql
    SELECT LENGTH("Hola");
    
    ```
    
- **Concatenar cadenas**:
    
    ```sql
    SELECT CONCAT("Hola", 5, "Adios");
    
    ```
    
- **Eliminar espacios adicionales**:
    
    ```sql
    SELECT TRIM("  Hola  ");
    
    ```
    
- **Extraer una subcadena**:
    
    ```sql
    SELECT SUBSTRING("Enero", 2, 3);
    
    ```
    
- **Buscar una cadena dentro de otra**:
    
    ```sql
    SELECT LOCATE("on", "Acondicionador");
    
    ```
    

---

## **Funciones cadenas**

- **Valor absoluto**:
    
    ```sql
    SELECT ABS(-5);
    
    ```
    
- **Máximo y mínimo**:
    
    ```sql
    SELECT MAX(sueldo) FROM empleados;
    SELECT MIN(sueldo + dietas + comision) FROM empleados;
    
    ```
    
- **Suma y promedio**:
    
    ```sql
    SELECT SUM(sueldo) FROM empleados;
    SELECT AVG(sueldo) FROM empleados;
    
    ```
    
- **Contar registros**:
    
    ```sql
    SELECT COUNT(*) FROM facturas;
    SELECT COUNT(columna) FROM facturas;
    
    ```
    
- **Raíz cuadrada y redondeo**:
    
    ```sql
    SELECT SQRT(16);
    SELECT ROUND(4.8);
    
    ```
    

---

## **Funciones agregación**

- **Contar, promediar y sumar**:
    
    ```sql
    SELECT COUNT(*) FROM mascotas;
    SELECT AVG(sueldo) FROM empleados;
    SELECT SUM(sueldo) FROM empleados;
    
    ```
    
- **Concatenar resultados agrupados**:
    
    ```sql
    SELECT propietario, GROUP_CONCAT(especie) FROM mascotas GROUP BY propietario;
    
    ```
    
- **Edad máxima de las mascotas**:
    
    ```sql
    SELECT MAX(TIMESTAMPDIFF(YEAR, nacimiento, CURDATE())) AS edad FROM mascotas;
    
    ```
    

---

## **Agrupacion - group by**

- **Agrupar y contar por año**:
    
    ```sql
    SELECT COUNT(*), YEAR(fechaNac) AS anio FROM nacimientos GROUP BY anio;
    
    ```
    
- **Agrupar por múltiples columnas**:
    
    ```sql
    SELECT COUNT(*), especie, sexo FROM mascotas GROUP BY especie, sexo ORDER BY especie;
    
    ```
    
- **Filtrar grupos con `HAVING`**:
    
    ```sql
    SELECT COUNT(*), provincia FROM nacimientos GROUP BY provincia HAVING COUNT(*) > 1;
    
    ```
    

---

## **Subconsultas**

- **Subconsulta temporal**:
    
    ```sql
    SELECT num, inicial
    FROM (SELECT COUNT(*) AS num, LEFT(nombre, 1) AS inicial FROM nacimientos GROUP BY LEFT(nombre, 1)) AS temporal1
    WHERE num > 2;
    
    ```
    
- **Subconsulta condicional**:
    
    ```sql
    SELECT producto, precio_unidad
    FROM facturas
    WHERE precio_unidad > (SELECT AVG(precio_unidad) * 2 FROM facturas);
    
    ```
    
- **Uso de `IN` en subconsultas**:

```sql
SELECT mascota, dueño
FROM mascotas
WHERE mascota IN (SELECT nombre FROM mascotas WHERE propietario = "Juan");
```

---

Esto debería incluir todos los comandos que mencionaste. Si necesitas más detalles sobre algún tema, no dudes en preguntar.

## **Consultas múltiples - JOIN**

- **INNER JOIN:**
    
    ```sql
    SELECT TRUNCATE(SUM(a.Population * b.Percentage) / 100000000, 2) AS habitantes
    FROM Country a
    INNER JOIN CountryLanguage b ON b.CountryCode = a.Code
    WHERE b.Language = 'Spanish';
    
    ```
    
- **UNION (combinación de resultados):**
    
    ```sql
    SELECT nombre_director FROM Directores
    UNION
    SELECT nombre_actor FROM Actores;
    
    ```
    
- **LEFT JOIN, RIGHT JOIN, CROSS JOIN:**
    
    ```sql
    LEFT JOIN --Todos los registros de la tabla izquierda y los coincidentes de la derecha.
    RIGHT JOIN --Todos los registros de la tabla derecha y los coincidentes de la izquierda.
    CROSS JOIN --Todos los registros de ambas tablas (producto cartesiano).
    
    ```