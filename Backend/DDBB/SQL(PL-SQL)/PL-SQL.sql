--1 (procedimiento par impar)
DROP DATABASE IF EXISTS par_impar;
CREATE DATABASE par_impar;
USE par_impar;

DROP TABLE IF EXISTS par;
CREATE TABLE par (
    par INT
);

DROP TABLE IF EXISTS impar;
CREATE TABLE impar (
    impar INT
);

DROP PROCEDURE IF EXISTS ejercicio1;
DELIMITER //
CREATE PROCEDURE ejercicio1(IN num INT)

BEGIN
    IF (num % 2 = 0) THEN
        INSERT INTO par VALUES (num);
    ELSE
        INSERT INTO impar VALUES (num);
    END IF;
END //
DELIMITER ;
call ejercicio1(6);


--2 (procedimiento par impar while)
DROP DATABASE IF EXISTS par_impar;
CREATE DATABASE par_impar;
USE par_impar;

DROP TABLE IF EXISTS par;
CREATE TABLE par (
    par INT
);

DROP TABLE IF EXISTS impar;
CREATE TABLE impar (
    impar INT
);

DROP PROCEDURE IF EXISTS ejercicio2;
DELIMITER //
CREATE PROCEDURE ejercicio2(IN num INT)

BEGIN
    DECLARE i INT DEFAULT 0;

        IF (num % 2 = 0) THEN
            WHILE i<=num DO
                INSERT INTO par VALUES (i);
                SET i = i + 2;
            END WHILE;
        ELSE
            SET i = 1;
            WHILE i<=num DO
                INSERT INTO impar VALUES (i);
                SET i = i + 2;
            END WHILE;
        END IF;

END //
DELIMITER ;
call ejercicio2(6);

--3 (procedimiento fibonacci while)
DROP DATABASE IF EXISTS fibonacci;
CREATE DATABASE fibonacci;
USE fibonacci;

DROP TABLE IF EXISTS fibo;
CREATE TABLE fibo (
    secuencia INT
);

drop procedure if exists fibonacci;
delimiter //
create procedure fibonacci (valores int)
begin
declare contador int default 0;
declare valorActual int;
declare valorAnterior int;
declare valorAnteAnterior int;
declare ultimaPosicion int default 0;

while (contador < valores ) do
    
    if contador <= 1
    then
        insert into fibo values(contador,1);
        set valorActual = 1;
        set valorAnterior = 1;
    else
        set valorAnteAnterior = valorAnterior;
        set valorAnterior = valorActual;
        set valorActual = valorAnteAnterior + valorAnterior;
        insert into fibo values (contador,valorActual);
    end if;
    
    set contador = contador + 1;
    
end while;
end //
delimiter ;

--4 (funcion decimales while)
drop function if exists decimales;
delimiter //
create function decimales(
    num double, 
    ndec int
) 
returns varchar(100) 
deterministic
begin

declare temp varchar(60);
declare pos, len int default 0;
declare ndec2 int;

select cast(round(num,ndec) as char(40)) into temp;
select length(temp) into len;
select locate("." , temp) into pos;

while (len - pos < ndec) do
    select concat(temp,"0") into temp;
    set len = len + 1;

end while;

return temp;
end //
delimiter ;
select decimales(43.124145453,5);

--5 (procedimiento pad)
CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;
CREATE TABLE IF NOT EXISTS ejpad (
    cad VARCHAR(20)
);

DELIMITER //
DROP PROCEDURE IF EXISTS pad//

CREATE PROCEDURE pad (
    IN cad1 VARCHAR(20), 
    IN cad2 VARCHAR(20), 
    IN len INT, 
    IN sentido CHAR(1)
)
BEGIN
    DECLARE cadFinal VARCHAR(40);
    
    IF sentido = 'L' THEN
        SET cadFinal = LPAD(cad1, len, cad2);
    ELSEIF sentido = 'R' THEN
        SET cadFinal = RPAD(cad1, len, cad2);
    END IF;
    
    INSERT INTO ejpad (cad) VALUES (cadFinal);
    
END//
DELIMITER ;
ejecucion: call pad('hola','t',7,'L')

--5 (funcion pad)
DELIMITER //

CREATE FUNCTION pad1 (cad1 VARCHAR(20), cad2 VARCHAR(20), len INT, sentido CHAR(1))
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
    DECLARE cadFinal VARCHAR(40);
    
    IF sentido = 'L' THEN
        SET cadFinal = LPAD(cad1, len, cad2);
    ELSEIF sentido = 'R' THEN
        SET cadFinal = RPAD(cad1, len, cad2);
    END IF;
    
    RETURN cadFinal;
    
END//
DELIMITER ;
select pad1('hola','x',7,'L');

--6 (trigger insertar numero mas alto de la tabla)
CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;

CREATE TABLE IF NOT EXISTS triggers (
    num INT
);

drop trigger if exists ej6;
DELIMITER //
create trigger ej6
before insert on triggers 
for each row
begin
    declare num2 int default 0;
    select max(num) from triggers into num2;
    if (num2 >= new.num) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite insertar valores menores a los existentes';
    end if;
end //
delimiter ;
--ejecucion: se guarda solo


--7 (trigger insertar saldo mayor a la suma de todas las filas)
CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;

CREATE TABLE IF NOT EXISTS cuentas (
    movimiento INT,
    saldo INT
);

DROP TRIGGER IF EXISTS introtrig;
DELIMITER //
CREATE TRIGGER introtrig
BEFORE INSERT ON cuentas
FOR EACH ROW
BEGIN
    DECLARE acum INT; 
    
    -- Obtener el valor máximo de la columna num
    SELECT sum(saldo) FROM cuentas INTO acum;
    
    -- Comprobar si el nuevo valor es mayor que el valor máximo
    IF NEW.saldo <= acum THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: el numero debe ser mayor';
    END IF;
END//

DELIMITER ;
--ejecucion: se guarda solo



--1
DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;
USE prueba;

DROP TABLE IF EXISTS duraciones;
create table duraciones(
    codigo int,
    salida time,
    llegada time
);
insert into duraciones values (1,"8:00","10:00"),(2,"7:30","11:15"),(3,"10:15","15:45");

DROP FUNCTION IF EXISTS duracion;
DELIMITER //
CREATE FUNCTION duracion (
    codigo_funcion INT, 
    extra INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    DECLARE tiempo_tabla INT;
    select timestampdiff(minute,salida,llegada) from duraciones where codigo=codigo_funcion into tiempo_tabla;

    SET resultado = tiempo_tabla+extra;
    RETURN resultado;
END //
DELIMITER ;
select duracion(1,10);


--3
DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;
USE prueba;

DROP TABLE IF EXISTS original;
create table original( id int, nombre varchar(20));

DROP TABLE IF EXISTS papelera;
create table papelera( id int, nombre varchar(20), numero int);

insert into original values (1,"Piedra"),(2,"Metal"),(3,"Papel"),(4,"Bronce"),(5,"Madera");

set @contador=1;
DROP TRIGGER IF EXISTS original_papelera;
DELIMITER //
CREATE TRIGGER original_papelera
BEFORE DELETE ON original
FOR EACH ROW
BEGIN
    declare id int;
    declare nombre varchar(20);
    declare filas_papelera int;
    declare nombre_papelera varchar(20);

    select count(id) from papelera where id=old.id into filas_papelera;

    if filas_papelera=0 then

        insert into papelera values(old.id,old.nombre,(select @contador));
        set @contador=@contador+1;
    else
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Ya esta en la papelera';
    end if;
    
END//
DELIMITER ;


--2
DROP TABLE IF EXISTS maxpolizas;
create table maxpolizas(
    marca varchar(30),
    max1 int,
    max2 int,
    max3 int
);

delimiter //
drop procedure if exists max3pol //
create procedure max3pol()
begin
    declare marcas varchar(30);  
    
    declare done boolean default false;    
    declare c1 cursor for select distinct marca from automoviles;    
    declare continue handler for SQLSTATE '02000' set done = TRUE; 


    delete from maxpolizas;

   
    open c1;    
        c1_loop: LOOP        
            fetch c1 into marcas;
            if done then
                leave c1_loop;
            end if;

            insert into maxpolizas values (marcas,0,0,0);
            
            end LOOP c1_loop;
    close c1;

end //
delimiter ;

select distinct marca from automoviles;

