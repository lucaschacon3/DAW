+-----------------+
| Tables_in_DAW2  |
+-----------------+
| Actores         | -----> id_actor, nombre_actor, fecha_nacimiento, fecha_def
| Contenido       | -----> id_contenido, nombre_contenido, tipo, genero, duracion_minutos, clasificacion_edad, sinopsis
| Directores      | -----> id_director, nombre_director, fecha_nacimiento, fecha_def
| Documentales    | -----> id_documental, id_contenido, tematica
| Paga            | -----> id_usuario, id_tarjeta
| Peliculas       | -----> id_pelicula, id_contenido, formato
| Perfiles        | -----> id_perfil, id_usuario, tipo_perfil, num_perfil, nombre_perfil
| Series          | -----> id_serie, id_contenido, num_temporadas
| Suscribe        | -----> id_usuario, id_tarifa, fecha_renovacion, fecha_suscripcion
| Tarifas         | -----> id_tarifa, pais, tipo_tarifa, precio
| Tarjeta         | -----> id_tarjeta, numero_tarjeta, cvv, fecha_caducidad, iban
| Temporadas      | -----> id_temporada, id_serie, num_temporada, num_capitulos 
| TrabajaActor    | -----> id_contenido, id_actor
| TrabajaDirector | -----> id_contenido, id_director
| Usuario         | -----> id_usuario, nombre_usuario, correo_electronico, fecha_registro, edad
| Visualiza       | -----> id_usuario, nombre_usuario, correo_electronico, fecha_registro, edad
+-----------------+

select distinct date_format(fecha_inicio,"%m")as mes, date_format(fecha_inicio,"%j")as dia_del_año 
from Visualiza
where weekday(fecha_inicio)=5 or weekday(fecha_inicio)=6
order by mes,dia_del_año;

SET lc_time_names = 'es_ES';
select nombre_actor, date_format (fecha_nacimiento,"%d de %M %Y")as nac 
from Actores 
where fecha_def is not null or ((nombre_actor like "H%" or nombre_actor like "% L%") and ((year(fecha_nacimiento)>1950)))
order by nombre_actor;


+----------------+
| Tables_in_DAW6 |
+----------------+
| Albumes        | -----> id_album, fecha_lanzamiento, titulo_album, numcancion
| actuan         | -----> id_artista, nombre_evento, fecha_i, fecha_f, hora_i, hora_f
| artistas       | -----> id_artista, nombre, contacto, fechanac 
| canciones      | -----> titulo_cancion, duracion, numcancion
| cd             | -----> id_cd, precio, id_venta, formato, fecha, stock
| contratos      | -----> id_contrato, fechainicio, fechafin, id_artista
| crean          | -----> id_artista, titulo_cancion
| empleados      | -----> id_empleado, nombre_empleado, telefono, cargo, domicilio
| eventos        | -----> nombre_evento, actividades, ubicacion
| genero_musical | -----> id, genero,instrumentos
| pertenece      | -----> id_album, titulo_cancion 
| seAlmacenan    | -----> titulo_cancion, id_cd
| tiene          | -----> id, titulo_cancion  
| trabajan       | -----> nombre_evento, id_empleado 
| ventas         | -----> id_venta, factura, cliente, nombre_evento, fecha
+----------------+

select nombre 
from artistas 
where id_artista in (select id_artista from actuan where nombre_evento in (select nombre_evento from eventos where ubicacion="Madrid" or ubicacion="Valencia" or ubicacion="Galicia" )and year(fecha_i)=2024)and left(nombre,1) != substring(nombre,length(nombre),length(nombre)-1);

select id_artista, concat replace(nombre," ","_")as nombre, date_format(fechanac,"%d de %M del %Y") as fecha
from artistas
where locate(id_artista, fechanac) or (year(fechanac)%id_artista=0);

select nombre, contacto
from artistas
where (year(fechanac) between 1986 and 1994 and nombre like "%n%n%")or(year(fechanac)>2000)
order by nombre, fechanac asc;

+-------------------------+
| Tables_in_DAW5          |
+-------------------------+
| Entrena                 | -----> id, dorsal, id_dorsal
| Entrenadores            | -----> id, mentor
| Equipò_medico           | -----> ID, Nombre, fecha_ingreso
| Fisio                   | -----> ID
| Historico_de_presidente | -----> DNI, nombre, fecha_de_inicio, fecha_de_cese
| Jugadores               | -----> Dorsal, clausula_de_rescision, fecha_de_inicio, nombre, fecha_de_fin_de_contraro, dni
| Medico                  | -----> ID
| Nutricionista           | -----> ID
| Ojeadores               | -----> ID, lugar
| Participan              | -----> fecha_inicio, fecha_de_fin, Dorsal, ID_posicion, ID_partido
| Partido                 | -----> ID_partido, n_minutos
| Patrocinadores          | -----> ID, historico_presidente, fecha_fin, fecha_inicio, porcentaje_patrocinio
| Personal                | -----> NO TIENE NADA    
| Posicion                | -----> ID_posicion, Nombre_posicion
| Psicologo               | -----> ID
| Temporadas              | -----> jornada, año_de_inicio, año_de_fin, partido
+-------------------------+


select nombre, dorsal
from Jugadores
where dni in (select DNI from Historico_de_presidente where nombre="Eleuterio") and Dorsal in (select Dorsal from Participan where timestampdiff(DAY,fecha_inicio,fecha_de_fin)=1);

select concat("ID:", ID,"Presidente:",historico_presidente)as detalle_patrocinador, concat("Porcentaje patrocinio",porcentaje_patrocinio,"%")as porcentaje_detalles, concat("contrato vencido")as estado_contrato
from Patrocinadores
where fecha_fin is not null;

select fecha_inicio, fecha_de_fin, dorsal, ID_posicion, ID_partido
from Participan
where fecha_inicio > '2022-01-01' and (ID_posicion=10 or ID_posicion=1) and (dorsal<20 or dorsal>30)and (ID_partido<35 or ID_partido>38)
order by dorsal desc, fecha_inicio asc;


+----------------+
| Tables_in_DAW3 |
+----------------+
| ACTOR          | -----> id_actor, nombre, apellido, fecha_nacimiento, fecha_fallecimiento
| ACTUAN         | -----> id_actor, id_pelicula
| BUTACAS        | -----> num_fila, num_butaca, tipo, id_pantalla 
| DIRECTOR       | -----> id_director, nombre, apellido, fecha_nacimiento, fecha_fallecimiento
| DIRIGE         | -----> id_director, id_pelicula
| EMPLEADO       | -----> num_empleado, DNI, nombre, apellido, nom_puesto   
| ENTRADA        | -----> cod_entrada, fecha, precio, num_fila, num_butaca, id_pantalla, DNI, num_empleado 
| ESPECTADOR     | -----> DNI, nombre, apellido, socio, correo_electronico 
| PELICULA       | -----> id_pelicula, nombre, duracion, genero 
| SALA           | -----> id_pantalla, num_sala
| VISUALIZADA    | -----> id_pelicula, id_pantalla, DNI
+----------------+

select cod_entrada,DNI,num_empleado
from ENTRADA
where DNI in (select DNI from VISUALIZADA where id_pelicula in (select id_pelicula from DIRIGE where id_director in (select id_director from DIRECTOR where nombre="Clint")));

select timestampdiff(MINUTE,fecha_nacimiento,curdate())as minutos_vida, nombre, apellido, date_format(fecha_nacimiento,"%a de la semana %u de %y")as fechaNac
from ACTOR
where timestampdiff(YEAR,fecha_nacimiento,curdate())<=52 and not date_format(fecha_nacimiento,'%a')="Sat" and not date_format(fecha_nacimiento,'%a')="Sun"
order by minutos_vida asc;

select replace(concat(nombre,' ', apellido),"e","ç") as NOM_TURCO , timestampdiff(YEAR,"1984-03-01",fecha_nacimiento)as AÑOS_PARA_NACER
from ACTOR
where timestampdiff(YEAR,"1983-03-01",fecha_nacimiento)>0;


+----------------+
| Tables_in_DAW4 |
+----------------+
| AUTORES        | -----> nombre_autor, fecha_nac, nacionalidad
| COMPRAN        | -----> nombre_museo, cod_entrada, dni
| CON            | -----> cod_salas, nombre_exposiciones, nombre_museo 
| CONTIENEN      | -----> nombre_exposiciones, id_obras
| ENTRADAS       | -----> nombre_museo, fecha, precio, descuento, cod_entrada
| ESCULTURA      | -----> id_obras, material
| EXPOSICIONES   | -----> nombre_exposiciones, fecha_inicio, fecha_fin
| FOTOGRAFIA     | -----> id_obras, plano
| GUIAS          | -----> id_personal
| LIMPIEZA       | -----> id_personal
| MUSEO          | -----> nombre_museo, direccion
| OBRAS          | -----> id_obras, nombre_obra, museo, nombre_autor
| PERSONAL       | -----> id_personal, nombre, fecha_nacimiento, horario_trabajo, nombre_museo
| PINTURA        | -----> id_obras, tecnica 
| RECEPCIONISTAS | -----> id_personal
| SALAS          | -----> nombre_museo, cod_salas
| SEGURIDAD      | -----> id_personal
| VISITANTES     | -----> dni, fecha_nacimiento
+----------------+ 

select nombre_obra, nombre_autor
from OBRAS 
where id_obras in (select id_obras from PINTURA where tecnica="Óleo") and museo = (select nombre_museo from PERSONAL where id_personal like 'S%' group by nombre_museo order by count(*) desc limit 1);

select nombre, horario_trabajo
from PERSONAL
where id_personal like "S%"
group by horario_trabajo, nombre
having horario_trabajo>= (select round(avg(horario_trabajo)) from PERSONAL);

select date_format(fecha,"%d de %m de %Y"), cod_entrada
from ENTRADAS
where date_format(fecha,"%d")%2=0 and date_format(fecha,"%m")<05;

DAW7

+------------------+
| Tables_in_DAW7   |
+------------------+
| Cliente          | -----> cod_socio, fecha_nac, tlf, nombre, direccion 
| Consola          | -----> ID_videojuego, tipo
| Desarrolladora   | -----> nombre, direccion, video_desarollados, tlf 
| Empleado         | -----> ID_empleado, ID_tienda, nombre, sueldo, tlf, fecha_nac 
| Gen_Video        | -----> ID_videojuego, tipo
| Genero           | -----> tipo
| PC               | -----> ID_videojuego
| Ped_Video        | -----> ID_videojuego, cod_pedido
| Pedido           | -----> cod_pedido, cod_socio, ID_tienda, articulo, direccion 
| Recaudacion      | -----> fecha, ID_tienda, cantidad 
| Secuela          | -----> ID_videosec, ID_videojuego, orden
| Tienda           | -----> ID_tienda, direccion, nombre, tlf
| Video_Desarrolla | -----> ID_videojuego, nombre_des
| Videojuego       | -----> ID_videojuego, nombre, precio, fec_estreno, stock
+------------------+

select nombre
from Empleado 
where ID_tienda = (select ID_tienda from Recaudacion where ID_tienda in (select ID_tienda from Tienda where nombre like 'G%') group by ID_tienda order by sum(cantidad) desc limit 1);

select ID_tienda, sum(cantidad)as total_recaudado
from Recaudacion
where cantidad>1000
group by ID_tienda
having total_recaudado>1000
order by total_recaudado desc;

select ID_videojuego, nombre, fec_estreno, date_format(fec_estreno,"%d / %m / %y") 
from Videojuego 
where year(fec_estreno)<2022
order by fec_estreno desc;

Vehículos

+---------------------+
| Tables_in_vehiculos |
+---------------------+
| aseguradoras        | -> nombre, telefono
| automoviles         | -> matricula, fechaPermCirc, marca, modelo
| backupvehiculos     | -> matricula, fechaPermCirc, marca, modelo
| modelos             | -> marca, modelo, gama('Alta','Media','Baja')
| multas_a_vehiculos  | -> codSancion, matricula, fecha
| personas            | -> DNI, nombre, apellido1, apellido2, direccion, ciudad, cp, telefono, fechaNac
| polizas             | -> matricula, fechaAlta, fechaBaja, nombreAseguradora, numero, descripcion, cuantia
| propietarios        | -> matricula, DNI
| sanciones           | -> codigo, descripcion, categoria, rango('Leve','Grave','Muy Grave'), importe, retiradaCarnet('S¡','No')
+---------------------+

--Control
    select nombre, apellido1 
    from personas
    where DNI in (select DNI from propietarios where matricula in (select matricula from multas_a_vehiculos where year(fecha) between 2002 and 2004 and codSancion in (select codigo from sanciones where not categoria="Exceso de Velocidad" and not categoria="Señalizacion" and not categoria="Otras")))and year(fechaNac)<1979 and (ciudad like 'H%' or ciudad like 'M%');

    select count(*)as num,concat(marca,"(",substring(gama,1,1),")")as marcas
    from modelos
    group by marcas
    having num>5
    order by marcas, num DESC;

    select marca, count(*)as numero 
    from automoviles
    where length(marca)<8
    group by marca
    having numero>50;

    select concat(substring(matricula,5,3),"-",substring(matricula,1,4)) as matriculas, date_format(fechaPermCirc,"%j")as dia
    from automoviles
    where fechaPermCirc>="2007-01-01" and fechaPermCirc<="2007-04-10";

ej1
select DNI
from personas
where DNI in (select DNI from propietarios where matricula in (select matricula from multas_a_vehiculos where (day(fecha) between 24 and 31) and month(fecha)=12 ));

ej2
select matricula, concat(modelo, ' (', marca, ')')as modelo
from automoviles
where left(matricula,2)*3 < substring(matricula, 3,3);

ej3(falta la desviacion)
select DNI, timestampdiff(YEAR,fechaNac,'2020-01-01')as edad, timestampdiff(YEAR,fechaNac,'2020-01-01') - (select avg(timestampdiff(YEAR,fechaNac,'2020-01-01')) from personas where DNI in (select DNI from propietarios where matricula in (select matricula from automoviles where marca='BMW'))) as desviacion
from personas 
order by abs(desviacion) desc
limit 10;

ej4 (falta agrupar rango de 100 en 100)
select count(*) as num, cuantia as rango
from polizas
group by rango
having rango between 200 and 2300
order by rango;

ej5
select matricula, date_format(fechaAlta,'%a')as diaAlta, date_format(fechaBaja,'%a')as diaBaja, timestampdiff(YEAR,fechaAlta,fechaBaja)as años, cuantia
from polizas
having (años * 400 > cuantia) and (((diaAlta='Sat' or diaAlta='Sun') and (diaBaja='Mon'or diaBaja='Tue'or diaBaja='Wed'or diaBaja='Thu' or diaBaja='Fri')) or ((diaBaja='Sat' or diaBaja='Sun') and (diaAlta='Mon'or diaAlta='Tue'or diaAlta='Wed'or diaAlta='Thu' or diaAlta='Fri')));

ej6
select truncate(avg(cuantia),2) as media, descripcion
from polizas
where timestampdiff(YEAR, fechaAlta, fechaBaja)>=2 
group by descripcion
having media>750;

ej7
select concat(left(nombre,1),".", apellido1," ",apellido2)as Nombre_y_apellidos
from personas
where ciudad="Madrid" and DNI in (select DNI from (select DNI, count(*)as cont from propietarios group by DNI having cont>17)as temp);

ej8
select concat(left(nombre,1),".",apellidos) as persona, date_format(fnac, "%d de %M de %y")as fechaNac 
from persona 
where ciudad in (select ciudad from (select ciudad, count(*)as cont from persona group by ciudad having cont<3)as temp);

ej9
select year(fechaAlta)as ano, avg(cuantia) 
from polizas 
where nombreAseguradora in (select nombreAseguradora from (select nombreAseguradora, count(*) as cont from polizas group by nombreAseguradora having cont>15)as temp) group by ano order by ano;

ej10
select concat((substring(matricula,1,4)),"-",(substring(matricula,5,3)))as matricula 
from multas_a_vehiculos 
where matricula in (select matricula from automoviles where marca="Mercedes")and (codSancion=8 or codSancion=9 or codSancion=10) and (fecha>"2005-03-01" and fecha<"2005-5-31");

ej11
select nombre, apellido1, concat(year(fechaNac),'-',date_format(fechaNac, "%a"))as diaNacimiento
from personas where DNI in (select DNI from propietarios where matricula in (select matricula from polizas where fechaBaja is not NULL or year(fechaAlta)<2001))and telefono in (select telefono from aseguradoras where not locate("00",telefono)= 0);

ej12
select concat(substring(matricula,5,1),"-",substring(matricula,1,4),substring(matricula,6,2)) as matricula
from automoviles where marca in (select marca from (select marca, count(*)as contador from modelos group by marca having contador<4)as temp);

ej13
select concat(left(apellido1,4),right(nombre,4))as persona
from personas
where DNI in (select DNI from propietarios where matricula in (select matricula from multas_a_vehiculos where year(fecha)< 2002 and codSancion in (select codigo from sanciones where importe<100)));

