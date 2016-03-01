use badasshouse;
#insert into usuarios(correo,contrasenia,nombre,aPaterno,aMaterno) values('correo','contrasenia','nom','pat','mat');#

select * from usuarios;
select * from casa;
select * from despensa;
select * from relCasaDespensa;
select * from relUsrCasa;
select * from relDespensaProductos;
select * from catalogoProductos;

select * from habitaciones;
select * from relCasaHab;

select * from enchufes;
select * from relEnchuHab;

delete from usuarios where Correo = 'fernandojos44@gmail.com';

select * from relCasaHab;

select habitaciones.idHabitacion from habitaciones inner join relcasahab on habitaciones.idHabitacion = relcasahab.idHabitacion where idCasa='abcdef' and habitaciones.nombre='Habitacion 1';
select enchufes.uso as estatus, enchufes.Nombre as switchName from enchufes inner join relenchuhab on enchufes.idEnchufe = relenchuhab.idEnchufe where relenchuhab.idHabitacion=2;
select enchufes.idEnchufe from enchufes inner join relEnchuHab on enchufes.idEnchufe = relEnchuHab.idEnchufe where relEnchuHab.idHabitacion=2 and enchufes.Nombre='Enchufe1';
select habitaciones.nombre as habiName from habitaciones inner join relCasaHab on habitaciones.idHabitacion = relCasaHab.idHabitacion where relcasahab.idCasa='abc123';

select * from notificaciones;