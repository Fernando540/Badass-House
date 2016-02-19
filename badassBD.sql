drop database if exists badasshouse;
create database badasshouse;
use badasshouse;

##Tablas principales
create table usuarios(Correo nvarchar(35) primary key,contrasenia blob,nombre nvarchar(30),aPaterno nvarchar(30),aMaterno nvarchar(30));
create table casa(idCasa nvarchar(6) primary key,direccion nvarchar(30),paquete nvarchar(30));
create table dispositivos(idDispositivo int(2) primary key,nombre nvarchar(30));
create table tipoUsuario(idTipo int(2) primary key,tipo nvarchar(30));
create table eventos(idEvento int(2) primary key,fecha timestamp default current_timestamp);
create table catalogoEventos(idTipo int(2) primary key, evento nvarchar(20));
create table despensa(idDespensa int(2) primary key,estatus nvarchar(30));
create table catalogoProductos(idUnico nvarchar(100) primary key, idProducto int(2),producto nvarchar(30));

##Tabla de Eventos##
insert into catalogoeventos(idTipo,evento) values(1,'Modifico Despensa');
insert into catalogoeventos(idTipo,evento) values(2,'Uso Force Close');
##Tabla de Eventos##
##Tabla Paquetes ;)
create table paquetes(idPaquete int(2) primary key, nombre nvarchar(20));
insert into paquetes(idPaquete, nombre) values(1,'Basico');
insert into paquetes(idPaquete, nombre) values(2,'Pro');
insert into paquetes(idPaquete, nombre) values(3,'Platino');
create table relUsrPaquete(idRel int(2) primary key auto_increment, correo nvarchar(35), idPaquete int(2));
alter table relUsrPaquete add foreign key(correo) references usuarios(correo);
alter table relUsrPaquete add foreign key(idPaquete) references paquetes(idPaquete);
##Tabla Paquetes ;)

##tabla de numeros de serie
##create table numSerie(idNumero int(2), serie nvarchar(20));



##Tabla de Habitaciones##
create table habitaciones(idHabitacion int(2) primary key auto_increment, nombre nvarchar(30));
create table relCasaHab(idRel int(2) primary key auto_increment, idHabitacion int(2), idCasa nvarchar(6));
alter table relCasaHab add foreign key(idCasa) references casa(idCasa);
##Tabla de Habitaciones##

##Tabla de Enchufes
create table enchufes(idEnchufe int(2) primary key, Nombre nvarchar(20),uso int);
insert into enchufes(idEnchufe, nombre) values(1,'Enchufe1');
insert into enchufes(idEnchufe, nombre) values(2,'Enchufe2');
insert into enchufes(idEnchufe, nombre) values(3,'Enchufe3');
insert into enchufes(idEnchufe, nombre) values(4,'Apagador');
create table relEnchuHab(idRel int(2) primary key auto_increment, idHabitacion nvarchar(35), idEnchufe int(2));
##


##Tablas principales

##Tablas relacionales
create table relUsrCasa(idRel int(2) primary key auto_increment,Correo nvarchar(35),idCasa nvarchar(6));
create table relUsrDispositivo(idRel int(2) primary key auto_increment,Correo nvarchar(35),idDispositivo int(2));
create table relUsrTipo(idRel int(2) primary key auto_increment,Correo nvarchar(35),idTipo int(2));
create table relDispositivoTipo(idRel int(2) primary key auto_increment,idDispositivo int(2),idTipo int(2));
create table relUsrEvento(idRel int(2) primary key auto_increment,Correo nvarchar(35),idEvento int(2));
create table relEventoCatalogo(idRel int(2) primary key auto_increment,idEvento int(2),idTipo int(2));
create table relDispCasa(idRel int(2) primary key auto_increment,idDispositivo int(2),idCasa nvarchar(6));
##create table relCasaDespensa(idRel int(2) primary key auto_increment,Correo nvarchar(35),idDespensa int(2));
create table relCasaDespensa(idRel int(2) primary key auto_increment,idCasa nvarchar(6),idDespensa int(2));
create table relDespensaProductos(idRel int(2) primary key auto_increment,idDespensa int(2),idUnico nvarchar(100),cantidad int(100));
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

alter table relUsrEvento add foreign key(Correo) references usuarios(Correo);
alter table relUsrEvento add foreign key(idEvento) references eventos(idEvento);

alter table relEventoCatalogo add foreign key(idEvento) references eventos(idEvento);
alter table relEventoCatalogo add foreign key(idTipo) references catalogoEventos(idTipo);

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