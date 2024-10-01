-- plantilla para crear tabla
DROP DATABASE IF EXISTS nombre_base_de_datos;
CREATE DATABASE nombre_base_de_datos;
USE nombre_base_de_datos;

DROP TABLE IF EXISTS nombre_tabla;
CREATE TABLE nombre_tabla (
    columna1 tipo_de_dato restricciones,
    columna2 tipo_de_dato restricciones
);





--plantilla para procedure
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
--para ejecutar call ejercicio1(6);







--ejemplo de while
DROP PROCEDURE IF EXISTS generar_tabla_multiplicar;
DELIMITER //
CREATE PROCEDURE generar_tabla_multiplicar(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    DELETE FROM tabla_multiplicar WHERE numero = num;

    WHILE i <= 10 DO
        INSERT INTO tabla_multiplicar (numero, multiplicador, resultado)
        VALUES (num, i, num * i);
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;








--plantilla para function
DROP FUNCTION IF EXISTS sumar;
DELIMITER //
CREATE FUNCTION sumar (
    num1 INT, 
    num2 INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT;

    SET resultado = num1 + num2;
    RETURN resultado;
END //
DELIMITER ;
-- SELECT sumar(5, 3);

--plantilla para function con select
DROP FUNCTION IF EXISTS sumar;
DELIMITER //
CREATE FUNCTION sumar (
    num1 INT, 
    num2 INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    select num1 + num2 into resultado;
    RETURN resultado;
END //
DELIMITER ;
-- SELECT sumar(5, 3);






--plantilla trigger
DROP TRIGGER IF EXISTS nombre_del_trigger;
DELIMITER //
CREATE TRIGGER nombre_del_trigger
BEFORE INSERT ON nombre_de_la_tabla
FOR EACH ROW
BEGIN

    IF NEW.columna <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El valor debe ser positivo';
    END IF;
END;
DELIMITER ;
--se ejecuta solo al insertar







--plantilla de eventos
DROP EVENT IF EXISTS limpiar_tabla;
DELIMITER //
CREATE EVENT limpiar_tabla
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
ENABLE
DO
BEGIN
    -- Eliminar filas antiguas basadas en una condición de tiempo
    DELETE FROM nombre_de_la_tabla
    WHERE fecha < DATE_SUB(NOW(), INTERVAL 30 DAY);
END//
DELIMITER ;

--hay que activar esta variable
set global event_scheduler=on;

--para activar o desactivar evento
alter event limpiar_tabla disable;
alter event limpiar_tabla enable;









--plantilla de cursores y loop
drop procedure if exists procursor;
delimiter //
create procedure procursor()
begin
	declare acumulador int default 0;
	declare x int;
	declare y int;
	
	declare done boolean default false;
	declare c1 cursor for select a,b from tab1;
	declare continue handler for SQLSTATE '02000' set done = TRUE;
	
	open c1;
	c1_loop: LOOP
		fetch c1 into x,y;
		if done then
			leave c1_loop;
		end if;
		set acumulador = x + y + acumulador;
		insert into tab2 values (acumulador);
	end LOOP c1_loop;
	close c1;
end //
delimiter ;


