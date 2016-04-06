drop database if exists prograbatiz_BadAssHouse;
create database prograbatiz_BadAssHouse;
use prograbatiz_BadAssHouse;

##Tablas principales
create table usuarios(Correo nvarchar(35) primary key,contrasenia blob,nombre nvarchar(30),aPaterno nvarchar(30),aMaterno nvarchar(30));
create table casa(idCasa nvarchar(6) primary key,direccion nvarchar(30),paquete nvarchar(30));
create table dispositivos(idDispositivo int(2) primary key,nombre nvarchar(30));
create table tipoUsuario(idTipo int(2) primary key,tipo nvarchar(30));
create table eventos(idRel int auto_increment primary key,idCasa nvarchar(6),idEvento int(2) ,activado nvarchar(30));
create table catalogoEventos(idTipo int(2) primary key, evento nvarchar(20));
create table despensa(idDespensa int(2) primary key,estatus nvarchar(30));
create table catalogoProductos(idUnico nvarchar(100) primary key, idProducto int(2));##,producto nvarchar(30));

##Tabla pre-Registro
create table preUsuarios(Correo nvarchar(35) primary key,contrasenia blob,nombre nvarchar(30),aPaterno nvarchar(30),aMaterno nvarchar(30), codigo nvarchar(1000));
##Tabla pre-Registro

##Tabla privilegios 
create table privilegios(idRel int(2) auto_increment primary key,idHabitacion int(2), correoJunior nvarchar(35), permiso nvarchar(10));
##Tabla privilegios

##Tabla de Eventos##
insert into catalogoEventos(idTipo,evento) values(1,'Modifico Despensa');
insert into catalogoEventos(idTipo,evento) values(2,'Uso Force Close');

create table notificaciones(idRel int(2) auto_increment primary key,idCasa nvarchar(6),evento nvarchar(30),estado nvarchar(20));
##Tabla de Eventos##

##Tabla NKA
create table relCasaNka(idRel int(2) auto_increment primary key, idCasa nvarchar(6), estado nvarchar(30),alturaMax nvarchar(3), alturaMin nvarchar(3));
##Tabla NKA

##Tabla de Habitaciones##
create table Puertas(idPuerta int primary key auto_increment, nombre nvarchar(35));
create table relCasaPuertas(idRel int primary key auto_increment, idPuerta int(2), idCasa nvarchar(6),estado nvarchar(30));
alter table relCasaPuertas add foreign key(idCasa) references casa(idCasa);
##Tabla de Puertas##

##Tabla de Habitaciones##
create table habitaciones(idHabitacion int primary key auto_increment, nombre nvarchar(35));
create table relCasaHab(idRel int primary key auto_increment, idHabitacion int(2), idCasa nvarchar(6));
alter table relCasaHab add foreign key(idCasa) references casa(idCasa);
##Tabla de Habitaciones##

##Tabla de Enchufes
create table enchufes(idEnchufe int primary key auto_increment, Nombre nvarchar(20),uso int);
create table relEnchuHab(idRel int primary key auto_increment, idHabitacion int, idEnchufe int);
alter table relEnchuHab add foreign key(idHabitacion) references habitaciones(idHabitacion);
alter table relEnchuHab add foreign key(idEnchufe) references enchufes(idEnchufe);
##

##Tabla de Llaves de Gas
create table llavesGas(idLlave int primary key auto_increment, nombre nvarchar(20),usoPpm int);
create table relLlaves(idRel int primary key auto_increment, idCasa nvarchar(6), idLlave int);
alter table relLlaves add foreign key(idCasa) references casa(idCasa);
alter table relLlaves add foreign key(idLlave) references llavesGas(idLlave);
##

##Tablas principales

##Tablas relacionales
create table relUsrCasa(idRel int(2) primary key auto_increment,Correo nvarchar(35),idCasa nvarchar(6));
create table relUsrDispositivo(idRel int(2) primary key auto_increment,Correo nvarchar(35),idDispositivo int(2));
create table relUsrTipo(idRel int(2) primary key auto_increment,Correo nvarchar(35),idTipo int(2));
create table relDispositivoTipo(idRel int(2) primary key auto_increment,idDispositivo int(2),idTipo int(2));
create table relCasaUsrEvento(idRel int(2) primary key auto_increment,idCasa nvarchar(6),Correo nvarchar(35),tipoEvento int(2),evento nvarchar(100),fecha timestamp default current_timestamp);
create table relEventoCatalogo(idRel int(2) primary key auto_increment,idEvento int(2),idTipo int(2));
create table relDispCasa(idRel int(2) primary key auto_increment,idDispositivo int(2),idCasa nvarchar(6));
##create table relCasaDespensa(idRel int(2) primary key auto_increment,Correo nvarchar(35),idDespensa int(2));
create table relCasaDespensa(idRel int(2) primary key auto_increment,idCasa nvarchar(6),idDespensa int(2));
create table relDespensaProductos(idRel int(2) primary key auto_increment,idDespensa int(2),idUnico nvarchar(100),producto nvarchar(100),cantidad int(100), aviso int(100));
##Tablas relacionales

##LLaves Foráneas
alter table relUsrCasa add foreign key(Correo) references usuarios(Correo);
alter table relUsrCasa add foreign key(idCasa) references casa(idCasa);

alter table relUsrDispositivo add foreign key(Correo) references usuarios(Correo);
alter table relUsrDispositivo add foreign key(idDispositivo) references dispositivos(idDispositivo);

alter table relUsrTipo add foreign key(Correo) references usuarios(Correo);
alter table relUsrTipo add foreign key(idTipo) references tipoUsuario(idTipo);

alter table relDispositivoTipo add foreign key(idDispositivo) references dispositivos(idDispositivo);
alter table relDispositivoTipo add foreign key(idDispositivo) references tipoUsuario(idTipo);

/*alter table relUsrEvento add foreign key(Correo) references usuarios(Correo);
alter table relUsrEvento add foreign key(idEvento) references eventos(idEvento);

alter table relEventoCatalogo add foreign key(idEvento) references eventos(idEvento);
alter table relEventoCatalogo add foreign key(idTipo) references catalogoEventos(idTipo)*/

alter table relDispCasa add foreign key(idCasa) references casa(idCasa);
alter table relDispCasa add foreign key(idDispositivo) references dispositivos(idDispositivo);

alter table relCasaDespensa add foreign key(idCasa) references casa(idCasa);
alter table relCasaDespensa add foreign key(idDespensa) references despensa(idDespensa);

alter table relDespensaProductos add foreign key(idDespensa) references despensa(idDespensa);
alter table relDespensaProductos add foreign key(idUnico) references catalogoProductos(idUnico);

##LLaves Foráneas
##create table usu(correo nvarchar(35) primary key, tipo nvarchar(10));
insert into tipoUsuario(idTipo, tipo) values(1,'Premium');
insert into tipoUsuario(idTipo, tipo) values(2,'Junior');