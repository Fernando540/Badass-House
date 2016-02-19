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