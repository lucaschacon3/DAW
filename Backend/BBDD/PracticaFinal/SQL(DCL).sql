create user "externo1"@"10.230.98.233" identified by "externo1";
grant select on trabajo_daw1_Jorge_Pastor.* to "externo1"@"10.230.98.233" with grant opcion;
create user "externo2"@"localhost" identified by "externo2";

-- creacion de usuario a lucas chacon
create user "lucasC"@"%" identified by "lucasC";
grant select, insert, update, delete on trabajo_daw1_Jorge_Pastor.* to "lucasC"@"%";

-- Acceder la base de datos
mysql -u jorgeP -p -h 10.230.99.199

revoke select, insert, update, delete on trabajo_daw1_Jorge_Pastor.* from "lucasC"@"%";
create user "jorgeP"@"%" identified by "jorgeP";
grant select, insert, update, delete on trabajo_daw1_Lucas_Sanchez.* to "jorgeP"@"%";
revoke select, insert, update, delete on trabajo_daw1_Lucas_Sanchez.* from "jorgeP"@"%";

-- Acceder la base de datos de Lucas C
mysql -u lucasS -p -h 10.230.98.233

create user "externo1_jorgeP"@"10.230.99.187" identified by "jorgeP";
grant select on trabajo_daw1_Lucas_Sanchez.* to "externo1_jorgeP"@"10.230.99.187" with grant option;
create user "externo2_lucasC"@"10.230.98.233" identified by "lucasC";

-- Acceder la base de datos de Lucas C
mysql -u externo1_LucasS -p -h 10.230.98.233
grant select on trabajo_daw1_Lucas_Chacon.* to "externo2_jorgeP"@"10.230.99.187";

-- Acceder la base de datos de Jorge P
mysql -u externo2_lucasS -p -h 10.230.99.187

--Eliminar un usuario:
drop user "externo1_jorgeP"@"10.230.99.187";
drop user "externo2_lucasC"@"10.230.98.233";
