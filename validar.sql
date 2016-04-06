use prograbatiz_BadAssHouse;
#insert into usuarios(correo,contrasenia,nombre,aPaterno,aMaterno) values('correo','contrasenia','nom','pat','mat');#

select * from usuarios;
select * from casa;
select * from despensa;
select * from relCasaDespensa;
select * from relUsrCasa;
select * from relDespensaProductos;
select * from catalogoProductos;
select * from relUsrTipo;

select * from habitaciones;
select * from relCasaHab;

select * from enchufes;
select * from relEnchuHab;

select * from llavesGas;
select * from relLlaves;

delete from usuarios where Correo = 'fernandojos44@gmail.com';

select * from relCasaHab;

select habitaciones.idHabitacion from habitaciones inner join relcasahab on habitaciones.idHabitacion = relcasahab.idHabitacion where idCasa='abcdef' and habitaciones.nombre='Habitacion 1';
select enchufes.uso as estatus, enchufes.Nombre as switchName from enchufes inner join relenchuhab on enchufes.idEnchufe = relenchuhab.idEnchufe where relenchuhab.idHabitacion=2;
select enchufes.idEnchufe from enchufes inner join relEnchuHab on enchufes.idEnchufe = relEnchuHab.idEnchufe where relEnchuHab.idHabitacion=2 and enchufes.Nombre='Enchufe1';
select habitaciones.nombre as habiName from habitaciones inner join relCasaHab on habitaciones.idHabitacion = relCasaHab.idHabitacion where relcasahab.idCasa='abc123';

select * from notificaciones;
select * from privilegios;
select habitaciones.nombre as roomName from privilegios inner join habitaciones on habitaciones.idHabitacion = privilegios.idHabitacion where privilegios.correoJunior='fer@fer.com' and privilegios.permiso='SI';
call flujogas('fer@gmail.com',900,'Llave principal');

insert into casa(idCasa,paquete) values('PEENES','Huevos1');