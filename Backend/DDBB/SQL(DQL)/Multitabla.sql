+-----------------+
| Tables_in_world |
+-----------------+
| City            | -> Id, Name, CountryCode, District, Population
| Country         | -> Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovermentForm, HeadOfState, Capital, Code2
| CountryLanguage | -> CountryCode, Language, IsOfficial, Percentage
+-----------------+

select a.Name, a.Population, b.Name, b.Continent
from City a 
inner join Country b
on a.CountryCode= b.code
order by b.Continent, b.Name, a.name;

select a.Language, truncate(b.Population*a.Percentage/100000, 2) as hablan
from CountryLanguage a 
inner join Country b 
on a.CountryCode=b.Code and b.Name="Switzerland"
order by hablan desc;

select truncate(sum(a.Population*b.Percentage)/100000000,3)as habitantes
from Country a 
inner join CountryLanguage b
on b.CountryCode=a.Code
where b.Language="Spanish";

select truncate(sum(a.Population*b.Percentage)/100000000,2)as habitantes
from Country a 
inner join CountryLanguage b
on b.CountryCode=a.Code 
where b.Language='Spanish' and (a.Continent='South America' or a.Continent='North America');

select a.Name, b.Name
from Country a
inner join Country b
on locate (a.Name,b.Name)
where a.Name != b.Name;

select a.Name, b.Name
from Country a
inner join Country b
on a.Name like concat('%',b.Name,'%')
where a.Name != b.Name;

select a.Name, a.Code, a.Population
from Country a
inner join Country b
on a.SurfaceArea>b.SurfaceArea
where b.Name="Spain";


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

-- para hacer interseccion hay que hacer esto en el on y where
select a.matricula
from polizas a
inner join polizas b
on a.matricula=b.matricula
where b.matricula=a.matricula and a.descripcion like '%Todo Riesgo%' and b.descripcion like '%Terceros%';

select distinct a.matricula
from polizas a
inner join polizas b
on a.matricula=b.matricula
where b.matricula=a.matricula and a.descripcion like '%Todo Riesgo%' and b.descripcion like '%Terceros%';

select a.nombre, a.fechaNac
from personas a
where timestampdiff(YEAR, a.fechaNac, '2020-01-01')<25
UNION ALL
select b.matricula, b.fechaPermCirc
from automoviles b
where timestampdiff(YEAR, b.fechaPermCirc, '2020-01-01')<11;

select ase.nombre as Aseguradora, count(pol.matricula)as numero
from aseguradoras ase
inner join polizas pol
inner join automoviles auto
inner join modelos mode
on auto.marca=mode.marca and auto.modelo=mode.modelo and auto.matricula=pol.matricula and pol.nombreAseguradora=ase.nombre
where auto.marca='Mercedes' and mode.gama = 'Alta'
group by Aseguradora
having numero>1
order by Aseguradora;

select distinct auto.marca, mode.gama, auto.matricula
from automoviles auto
inner join modelos mode
inner join multas_a_vehiculos mul
on auto.marca=mode.marca and auto.modelo=mode.modelo and auto.matricula!=mul.matricula
where auto.marca='Volkswagen' and mode.gama != 'Alta'
order by auto.matricula;

select a.matricula, a.marca, a.modelo, m.fecha, s.descripcion, s.importe
from automoviles a 
inner join multas_a_vehiculos m
inner join sanciones s
inner join polizas p
on a.matricula=m.matricula and m.codSancion=s.codigo and a.matricula=p.matricula
where p.cuantia < (select avg(cuantia) from polizas)*0.4;

select p.nombre, p.apellido1, avg(po.cuantia)as suma
from personas p
inner join polizas po 
inner join propietarios pro 
on p.DNI=pro.DNI and po.matricula=pro.matricula
where p.ciudad="Murcia" and year(po.fechaAlta)=2005
group by p.nombre, p.apellido1;


select pol.matricula, aseg.telefono
from polizas pol
inner join aseguradoras aseg
on pol.nombreAseguradora=aseg.nombre
where year(pol.fechaAlta)=2000;

select per.nombre, per.apellido1, pro.matricula, mul.fecha
from personas per
inner join propietarios pro
inner join sanciones san 
inner join multas_a_vehiculos mul 
on per.DNI=pro.DNI and pro.matricula=mul.matricula and mul.codSancion=san.codigo
where per.apellido1 like 'A%' and (mul.codSancion between 6 and 10) and month(mul.fecha)<4;


+------------------+
| Tables_in_cursos |
+------------------+
| alumno           |-> ida, idg, nota
| asignatura       |-> id, nombre
| ciudad           |-> id, nombre
| curso            |-> id, finicio, ffinal
| grupo            |-> id, asignatura, curso
| matriculaHonor   |-> ida, idg, adp, adgp
| persona          |-> id, rol, nombre, apellidos, telefono, ciudad, fnac
| profesor         |-> idp, idg
| rol              |-> id, nombre
+------------------+

select concat(per.nombre, ' ', per.apellidos)as profesor, asig.nombre, concat(date_format(cur.finicio,'%y'),'/', date_format(cur.ffinal,'%y')) as curso
from persona per
inner join profesor pro
inner join curso cur
inner join asignatura asig
inner join grupo gru
on per.id=pro.idp and pro.idp=gru.id and gru.asignatura=asig.id and cur.id=gru.curso
limit 2;

select concat(per.nombre, ' ', per.apellidos)as profesor, count(alu.ida) as alumno
from persona per
inner join persona per2
inner join alumno alu
inner join profesor pro
inner join grupo gru
on per.id=pro.idp and per2.id=alu.ida and pro.idg=gru.id and alu.idg=gru.id
where timestampdiff(YEAR,per.fnac,per2.fnac)>=10
group by profesor;

select concat(per.nombre,' ',per.apellidos) as persona, asig.nombre as asignatura
from persona per
inner join asignatura asig 
inner join profesor pro
inner join grupo grup 
on per.id=pro.idp and pro.idg=grup.id and grup.asignatura=asig.id
where per.ciudad=5;

select concat(per1.nombre,' ',per1.apellidos) as alumno, concat(per2.nombre,' ',per2.apellidos) as profesor, asig.nombre as asignatura
from persona per1
inner join persona per2
inner join alumno alum 
inner join profesor pro
inner join asignatura asig
inner join grupo grup 
inner join curso cur
inner join rol r
on per1.id=alum.ida and per2.id=pro.idp and alum.idg=grup.id and pro.idg=grup.id and grup.asignatura=asig.id and grup.curso=cur.id and per2.rol=r.id
where year(cur.finicio)=2019 and year(cur.ffinal)=2020 and r.id =3
order by asignatura desc;

select concat(per.nombre,' ',per.apellidos) as persona, alum.nota, asig.nombre as asignatura
from persona per
inner join alumno alum 
inner join asignatura asig
inner join grupo grup 
inner join ciudad ciu
on per.id=alum.ida and alum.idg=grup.id and grup.asignatura=asig.id and per.ciudad=ciu.id
where alum.nota>=4 and alum.nota<5 and ciu.nombre='Alcorcon'; 

select concat(a.nombre,' ',a.apellidos)as alumno, count(distinct year(finicio))as numero
from persona a
inner join curso b
inner join alumno c
inner join grupo d
on a.id=c.ida and c.idg=d.id and d.curso=b.id
group by alumno
order by alumno;

select r.nombre as rol, concat(per.nombre,' ',per.apellidos)as persona, ciu.nombre as ciudad
from persona per
inner join rol r 
inner join ciudad ciu
on per.rol=r.id and per.ciudad=ciu.id
where ciu.nombre='Getafe';

select concat(per.nombre,' ',per.apellidos)as alumno, concat(date_format(cur.finicio,'%y'), '/',date_format(cur.ffinal,'%y'))as curso, count(alum.nota) as numero
from persona per
inner join alumno alum 
inner join grupo gru 
inner join curso cur
on per.id=alum.ida and alum.idg=gru.id and gru.curso=cur.id
where alum.nota is not null
group by alumno, curso
having numero>3
order by alumno;

+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
select dep.dept_name, avg((sal.salary))as media, count(emp.emp_no)as num
from departments dep
inner join dept_emp de
inner join employees emp
inner join salaries sal
on dep.dept_no=de.dept_no and de.emp_no=emp.emp_no and emp.emp_no=sal.emp_no
where year(emp.hire_date)>1990
group by dep.dept_name
having media>70000;

select concat(em.first_name,' ',em.last_name)as emp, sal.salary
from employees em
inner join salaries sal
inner join dept_emp dep
on em.emp_no=sal.emp_no and dep.emp_no=em.emp_no
where sal.salary>90000 and year(dep.from_date)=year(sal.from_date) and year(dep.from_date)>2000 and day(sal.from_date)=31;

select distinct dep.dept_name, concat(left(em.first_name,3),'.', right(em.last_name,3)) as ext_empleado, sal.salary
from departments dep
inner join employees em
inner join salaries sal
inner join dept_manager dm
on dep.dept_no=dm.dept_no and dm.emp_no=em.emp_no and em.emp_no=sal.emp_no
where sal.salary>100000;

select concat(left(em.first_name,1),'.',left(em.last_name,3))as cod_emp, tit.title 
from employees em
inner join titles tit
inner join dept_manager dm
inner join dept_emp de
on em.emp_no=tit.emp_no and em.emp_no=dm.emp_no and em.emp_no=de.emp_no
where timestampdiff(YEAR,em.hire_date,dm.from_date)<5 and year(dm.to_date)=9999;

select concat(em.first_name,' ',em.last_name) as emp, tit.title, sal.salary
from employees em
inner join titles tit
inner join salaries sal
on em.emp_no=sal.emp_no and em.emp_no=tit.emp_no and sal.from_date=em.hire_date
where tit.title like '%Senior%'
order by salary desc
limit 10;

select dep.dept_name, concat(em.first_name,' ', em.last_name)as empleado, timestampdiff(YEAR,tit.from_date,tit.to_date)as tardaron_años
from departments dep
inner join employees em
inner join titles tit
inner join dept_emp de
on dep.dept_no=de.dept_no and de.emp_no=em.emp_no and em.emp_no=tit.emp_no
where (timestampdiff(YEAR,tit.from_date,tit.to_date) between 16 and 17)and tit.title not like '%Senior%' and tit.to_date!=9999
order by dep.dept_name;

--rango de dias
select count(*) as num,truncate(timestampdiff(YEAR,tit.from_date,tit.to_date)/1+1,0)*1 as anios
from employees em
inner join titles tit
on em.emp_no=tit.emp_no
where em.gender='F' and year(tit.to_date) < 9999
group by anios,truncate(timestampdiff(YEAR,tit.from_date,tit.to_date)/1,0)
order by truncate(timestampdiff(YEAR,tit.from_date,tit.to_date)/1,0);

--rango de años
select timestampdiff(year,t.from_date,t.to_date) as anios, count(*) as num 
from titles t 
join employees e 
join salaries s 
on e.emp_no = t.emp_no and e.emp_no = s.emp_no 
where year(t.to_date) < 9999 and e.gender = "F" and s.salary > 100000 
group by anios 
having num < 1000 
order by anios;

--decadas
select (truncate(year(hire_date)/10,0)%10)*10 as decada_contrato, (truncate(year(t.from_date)/10,0)%10)*10 as decada_titulo, count(*) as num 
from titles t join employees e 
on t.emp_no = e.emp_no 
where title like "%Engi%" 
group by decada_contrato, decada_titulo 
having num > 1000 
order by decada_contrato;

--2 tablas (trienios y un total)

select trienio, num, millones, trienio*millones*0.02 as coste 
from (select truncate(timestampdiff(year,hire_date,"2002-01-01")/3,0) as trienio, count(*) as num, sum(salary)/1000000 as millones 
    from employees e join salaries s 
    on e.emp_no = s.emp_no 
    where year(s.to_date) = 9999 
    group by trienio 
    order by trienio) s1 

union 

select "total", sum(num),sum(millones), sum(millones*trienio*0.02) 
from (select truncate(timestampdiff(year,hire_date,"2002-01-01")/3,0) as trienio, count(*) as num, sum(salary)/1000000 as millones 
    from employees e join salaries s 
    on e.emp_no = s.emp_no 
    where year(s.to_date) = 9999 
    group by trienio 
    order by trienio) as s2;

-- rangos por inicial de empleados
select left(emp.first_name,1)as inicial, year(tit.to_date) as finaliza, count(*)as num, max(sal.salary)
from employees emp
inner join titles tit
inner join salaries sal
on emp.emp_no=tit.emp_no and emp.emp_no=sal.emp_no
group by inicial, finaliza
having num<3
order by finaliza, num;

--ej1 
select concat(emp.first_name,' ',emp.last_name)as empleado, sal.from_date, sal.to_date, sal.salary
from employees emp
inner join salaries sal
on emp.emp_no=sal.emp_no
where timestampdiff(year, emp.birth_date,emp.hire_date)>41 and emp.first_name like 'G%' and year(emp.hire_date)=1994
having empleado like '%a%a%a%a%a%';

--ej2 falta ajustar el num

select dep.dept_name, count(*)as num
from departments dep
inner join dept_emp de
inner join employees emp
on de.dept_no=de.dept_no and de.emp_no=emp.emp_no
where emp.hire_date>emp.birth_date + '0000-00-05'
group by dep.dept_name;

--ej3 falta poner las 3 mejores

select dep.dept_name, avg((select sal.salary
    from departments dep
    inner join dept_emp de
    inner join employees emp
    inner join salaries sal
    on dep.dept_no= de.dept_no and de.emp_no=emp.emp_no and emp.emp_no=sal.emp_no
    where dep.dept_name like '%Marketing%'
    order by salary desc
    limit 1))as Media_top_3
from departments dep
inner join dept_emp de
inner join employees emp
inner join salaries sal
on dep.dept_no= de.dept_no and de.emp_no=emp.emp_no and emp.emp_no=sal.emp_no
where dep.dept_name like '%Marketing%'
group by dep.dept_name;

--ej4 faltan los incrementos salariales
select distinct emp.first_name, emp.last_name, (date_add(dm.from_date,interval 10 year)) as 10años
from employees emp
inner join dept_manager dm
inner join salaries sal
on emp.emp_no=dm.emp_no and emp.emp_no=sal.emp_no
where date_add(dm.from_date,interval 10 year)>dm.to_date and sal.salary>2400;

--ej5
select concat(count(emp.emp_no),' ','managers')as cantidad
from employees emp
inner join dept_manager dm
on emp.emp_no=dm.emp_no
where month(emp.hire_date)=(select month(hire_date)
from employees
group by month(hire_date)
order by count(*)
limit 1)

union

select concat(count(emp.emp_no),' ','empleados')as cantidad
from employees emp
inner join dept_emp de
on emp.emp_no=de.emp_no
where month(emp.hire_date)= (select month(hire_date)
from employees
group by month(hire_date)
order by count(*)
limit 1);



select month(hire_date)
from employees
group by month(hire_date)
order by count(*)
limit 1;

+----------------+
| Tables_in_ropa |
+----------------+
| calzado        |
| camiseta       |
| llevar         |
| marca          |
| pantalon       |
| persona        |
+----------------+

select lle.fecha, cam.talla, mar.nombre
from llevar lle
inner join camiseta cam
inner join marca mar
inner join persona per
on mar.id=cam.marca and cam.id=lle.camiseta and lle.pers=per.id
where per.nombre='Eva';

select sum(cal.precio+pan.precio+cam.precio) as suma, day(lle.fecha) as dia
from calzado cal
inner join pantalon pan
inner join camiseta cam
inner join llevar lle
on cal.id=lle.calzado and pan.id=lle.pantalon and cam.id=lle.camiseta
group by dia;


--DAW 3

select count(*)as personas, pel.nombre as titulo, sal.num_sala
from PELICULA pel
inner join ACTOR ac
inner join ACTUAN act
inner join VISUALIZADA vis
inner join ESPECTADOR esp 
inner join SALA sal
on pel.id_pelicula=act.id_pelicula and act.id_actor=ac.id_actor and pel.id_pelicula=vis.id_pelicula and vis.id_pantalla=sal.id_pantalla and vis.DNI=esp.DNI
where act.id_actor = (select id_actor from ACTUAN group by id_actor having count(id_pelicula)>1 )
group by titulo, sal.num_sala
order by personas;

select count(*)as num_actores, concat(dir.nombre,' ',dir.apellido)as director, pel.nombre as pelicula, sum(timestampdiff(YEAR,ac.fecha_nacimiento,dir.fecha_nacimiento))as anios
from PELICULA pel
inner join ACTOR ac
inner join DIRECTOR dir
inner join DIRIGE diri
inner join ACTUAN act
on dir.id_director=diri.id_director and diri.id_pelicula=pel.id_pelicula and pel.id_pelicula=act.id_pelicula and act.id_actor=ac.id_actor
where year(ac.fecha_nacimiento) < year(dir.fecha_nacimiento)
group by pelicula, director
having anios>52;

select pel.nombre as nombre_pelicula, concat(left(ac.nombre,1),'.',ac.apellido) as nombre_actor, concat(left(dir.nombre,1),'.',dir.apellido) as nombre_director
from PELICULA pel
inner join ACTOR ac
inner join DIRECTOR dir
inner join DIRIGE diri
inner join ACTUAN act
on dir.id_director=diri.id_director and diri.id_pelicula=pel.id_pelicula and pel.id_pelicula=act.id_pelicula and act.id_actor=ac.id_actor
where year(ac.fecha_nacimiento)<1940 and pel.genero like "%Drama%";

--DAW6

select art.nombre, art.fechanac, contra.fechainicio, timestampdiff(YEAR,art.fechanac,contra.fechainicio)
from artistas art
inner join contratos contra
on art.id_artista=contra.id_artista
where timestampdiff(YEAR,art.fechanac,contra.fechainicio)>20 and timestampdiff(YEAR,art.fechanac,contra.fechainicio)<37;


select emple.nombre_empleado as empleado, emple.cargo as cargo, even.nombre_evento as nombre_evento, even.ubicacion as ubicacion, actu.fecha_i as fecha_i, sum(even.actividades) as total_actuaciones
from empleados emple
inner join trabajan traba
inner join eventos even
inner join actuan actu
on emple.id_empleado=traba.id_empleado and traba.nombre_evento=even.nombre_evento and even.nombre_evento=actu.nombre_evento
where even.actividades like '%concierto%'
group by empleado, cargo, nombre_evento, ubicacion, fecha_i;


--DAW2

select direc.nombre_director, date_format(direc.fecha_nacimiento, '%d de %M del %Y') as fecha_nacimiento, timestampdiff(YEAR,direc.fecha_nacimiento,curdate()) as edad
from Directores direc
where direc.fecha_def is null and timestampdiff(YEAR,direc.fecha_nacimiento,curdate())>((year(curdate())-1984)*2)

UNION

select acto.nombre_actor, date_format(acto.fecha_nacimiento, '%d de %M del %Y') as fecha_nacimiento , timestampdiff(YEAR,acto.fecha_nacimiento,curdate()) as edad
from Actores acto
where acto.fecha_def is null and timestampdiff(YEAR,acto.fecha_nacimiento,curdate())>((year(curdate())-1984)*2);


select distinct concat(usu.nombre_usuario,'-', tarj.iban) as nombre, perf.nombre_perfil, tarj.cvv, tari.pais 
from Usuario usu
inner join Paga pag
inner join Tarjeta tarj
inner join Suscribe sus 
inner join Tarifas tari
inner join Perfiles perf
on perf.id_usuario=usu.id_usuario and usu.id_usuario=pag.id_usuario and pag.id_tarjeta=tarj.id_tarjeta and usu.id_usuario=sus.id_usuario and sus.id_tarifa=tari.id_tarifa
where tarj.fecha_caducidad <'2026-01-01' and tari.pais in (select pais from Tarifas group by pais having avg(precio)>10)
group by nombre_perfil;


--DAW5

select pos.Nombre_posicion, count(jug.nombre), sum(par.n_minutos)
from Jugadores jug
inner join Posicion pos
inner join Participan parti 
inner join Partido par
inner join Temporadas temp
on jug.Dorsal=parti.Dorsal and parti.ID_posicion=pos.ID_posicion and parti.ID_partido=par.ID_partido and par.ID_partido=temp.partido 
where temp.año_de_inicio=2022
group by pos.Nombre_posicion, par.n_minutos;


select hp.nombre as presidente, count(patro.id)as total_patrocinado
from Historico_de_presidente hp
inner join Patrocinadores patro
on hp.DNI = patro.Historico_presidente
group by presidente;


--DAW4

select pers.nombre as nombre
from PERSONAL pers 
where month(pers.fecha_nacimiento)=4
union
select auto.nombre_autor as nombre
from AUTORES auto 
where month(auto.fecha_nac)=5;


select sum(entra.precio)as total, year(visi.fecha_nacimiento)as años
from ENTRADAS entra 
inner join COMPRAN compra
inner join VISITANTES visi 
on compra.dni=visi.dni
where timestampdiff(YEAR,visi.fecha_nacimiento,curdate())>=18
group by años
having sum(entra.precio)>300
order by años;


select count(per.id_personal) as Personal, mus.nombre_museo, avg(entra.precio)as media_precio
from PERSONAL per 
inner join MUSEO mus 
inner join ENTRADAS entra 
on per.nombre_museo=mus.nombre_museo and mus.nombre_museo=entra.nombre_museo
where avg(entra.precio)>10 and pers.horario_trabajo>=8
group by mus.nombre_museo;


select concat('343') as Personal, mus.nombre_museo, avg(entra.precio)as media_precio
from PERSONAL per 
inner join MUSEO mus 
inner join ENTRADAS entra 
on per.nombre_museo=mus.nombre_museo and mus.nombre_museo=entra.nombre_museo
where mus.nombre_museo='Sorolla'
group by mus.nombre_museo;

--DAW7

select tien.nombre, count(ped.cod_pedido), max(recau.cantidad), avg(emple.sueldo)
from Tienda tien
inner join Empleado emple
inner join Recaudacion recau
inner join Pedido ped
on emple.ID_tienda=tien.ID_tienda and tien.ID_tienda= recau.ID_tienda and ped.ID_tienda=tien.ID_tienda
group by tien.nombre;

select video.nombre, video.fec_estreno, vd.nombre_des
from Videojuego video
inner join Video_Desarrolla vd
inner join Desarrolladora desa
inner join Consola cons
on video.ID_videojuego=vd.ID_videojuego and vd.nombre_des=desa.nombre and video.ID_videojuego=cons.Id_videojuego
where desa.direccion like '%Estados Unidos%' and cons.tipo like '%PS4%' or cons.tipo like '%Nintendo Switch%'
order by video.fec_estreno;

--unir dos tablas y ordenarlas
select * from (select video.nombre, video.precio as precio_videojuego, video.stock, cons.tipo
from Videojuego video 
inner join Consola cons
on video.ID_videojuego=cons.Id_videojuego
union 
select video.nombre, video.precio as precio_videojuego, video.stock, concat('PC')
from Videojuego video 
inner join PC pc
on video.ID_videojuego=pc.Id_videojuego) temp
order by precio_videojuego desc;



+----------------+
| Tables_in_ropa |
+----------------+
| calzado        |
| camiseta       |
| llevar         |
| marca          |
| pantalon       |
| persona        |
+----------------+

select mar.nombre, cal.color, cal.precio, cal.talla, mar2.nombre, cal2.color, cal2.precio, cal2.talla
from marca mar
inner join calzado cal on mar.id=cal.id
inner join marca mar2
inner join calzado cal2 on mar2.id=cal2.id
where cal.talla>cal2.talla+4;

select mar1.nombre as pantalon, mar2.nombre as camiseta, mar3.nombre as calzado, sum(cal.precio+pan.precio+cam.precio)as precio, lle.fecha, per.nombre
from marca mar1
inner join marca mar2
inner join marca mar3
inner join calzado cal
inner join pantalon pan
inner join camiseta cam
inner join llevar lle 
inner join persona per
on mar3.id=cal.id and mar1.id=pan.id and mar2.id=cam.id and cal.id=lle.calzado and pan.id=lle.pantalon and cam.id=lle.camiseta and lle.pers=per.id
where day(lle.fecha)>day(per.fnac)
group by pantalon, camiseta, calzado, fecha, nombre;


