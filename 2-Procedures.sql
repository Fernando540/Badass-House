use badasshouse;
drop procedure if exists valida;
drop procedure if exists altaTipo;
drop procedure if exists validaSerie;
drop procedure if exists registraCasa;
drop procedure if exists altadespensuki;
drop procedure if exists UsoProducto;
drop procedure if exists actualiza;
drop procedure if exists BajaProducto;
drop procedure if exists dimeTipo;
drop procedure if exists relacionaDespensa;
drop procedure if exists dimePaquete;
drop procedure if exists inventario;
drop procedure if exists enchufeState;
drop procedure if exists ingresaProteccion;
drop procedure if exists dimeNKA;
drop procedure if exists ingresaAltura;
drop procedure if exists dimeAltura;
drop procedure if exists dimeCuenta;
drop procedure if exists altaUsu;

delimiter //
create procedure valida(in usr nvarchar(45), in pass blob)
begin
	declare msg nvarchar(100);
	declare nombr nvarchar(30);
	declare existe int;
	declare valido int;

	set existe = (select count(*) from usuarios where correo = usr and contrasenia = pass);

	if existe = 0 then
		set msg = '**El usuario NO EXISTE o la CONTRASEÑA es INCORRECTA**';
		set valido = 0;
	else
		set msg = 'Bienvenido';
		set nombr = (select nombre from usuarios where correo = usr);
		set valido = 1;
	end if;
    
	select valido as Estatus, msg as Respuesta, nombr as nName;
end; //

create procedure validaSerie(in numeroSerie nvarchar(6))
begin 
    declare estado nvarchar(6);
    declare mensaje nvarchar(100);
    
	set estado=(select idCasa from casa where idCasa=numeroSerie);
    
    if estado is not null then
		set mensaje='Eres cabron';
	else
		set mensaje='ira men no existe ese numero de serie';
    end if;
    select mensaje as resultado ,estado as estaduki;
end;//

create procedure registraCasa(in adress nvarchar(30),in correito nvarchar(35),in seriuki nvarchar(6))
begin
	declare noDespensas int;
    declare coinDesp int;
    
    set coinDesp = (select count(*)from relCasaDespensa where idCasa= seriuki);
    
    update casa set direccion = adress where idCasa=seriuki;

    set noDespensas = (select count(*) from despensa);
    if noDespensas = 0 then
		set noDespensas = 1;
		insert into despensa(idDespensa,estatus) values(noDespensas,'activo');
        insert into relcasadespensa(idCasa,idDespensa) values(seriuki,noDespensas);
    else
		set noDespensas = (noDespensas+1);
		if (coinDesp = 0) then
			insert into despensa(idDespensa,estatus) values(noDespensas,'activo');
            insert into relcasadespensa(idCasa,idDespensa) values(seriuki,noDespensas);
        end if;
    end if;
    insert into relusrcasa(Correo,idCasa) values(correito,seriuki);
end;//

create procedure altadespensuki(in correin nvarchar(35), in barcode nvarchar(35),in nombre nvarchar(35),in alert nvarchar(100))
begin
	declare iDesp int;
    declare homeID nvarchar(6);
    declare total int;
    declare coincidencia int;
    declare coinCat int;
    declare idUnique nvarchar(100);
    set homeID = (select idCasa from relUsrCasa where Correo = correin);
    set iDesp = (select idDespensa from relCasaDespensa where idCasa = homeID);
	set idUnique=CONCAT(homeId,'',barcode);
	set coinCat = (select count(idUnico) from catalogoProductos where idUnico=idUnique);
    
    if (coinCat=0) then
		insert into catalogoProductos (idUnico,idProducto) values (idUnique,barcode);
    end if;
    
    set coincidencia = (select count(idUnico) from relDespensaProductos where idDespensa=iDesp and idUnico=idUnique);
    
    if (coincidencia = 1) then
		set total = (select cantidad from relDespensaProductos where idDespensa=iDesp and idUnico=idUnique);
		update relDespensaProductos set cantidad=(total+1) where idDespensa=iDesp and idUnico=idUnique;
	else
    if alert='' then
		insert into relDespensaProductos(idDespensa,idUnico,producto,cantidad) values (iDesp,idUnique,nombre,1);
	else
		insert into relDespensaProductos(idDespensa,idUnico,producto,cantidad,aviso) values (iDesp,idUnique,nombre,1,alert);
    end if;
		
    end if;
end;//

create procedure UsoProducto(in mail nvarchar(35), in codigo nvarchar(35),in canti int)
begin
    declare total int;
    declare ntotal int;
    declare iDesp int;
    declare homeID nvarchar(6);
    
    set homeID = (select idCasa from relUsrCasa where Correo = mail);
    set iDesp = (select idDespensa from relCasaDespensa where idCasa = homeID);
    
    set total = (select cantidad from relDespensaProductos where idUnico=codigo and idDespensa=iDesp);
	set ntotal = (total-canti);
    update relDespensaProductos set cantidad=(ntotal) where idUnico=codigo and idDespensa=iDesp;

end;//

create procedure actualiza(in mail nvarchar(45), in usr nvarchar(45), in ap nvarchar(45), in am nvarchar(45), in opass blob, in npass blob)
begin
	declare existe int;
    declare msj nvarchar(100);
    set existe = (select count(*) from usuarios where correo=mail and contrasenia=opass);
    if existe=1 then
		set msj='1';
		if npass =' ' then 
			update usuarios set nombre = usr, aPaterno = ap, aMaterno = am where Correo = mail and contrasenia = opass;
		else
			update usuarios set nombre = usr, aPaterno = ap, aMaterno = am, contrasenia= npass where Correo = mail and contrasenia = opass;
		end if;
	else
		set msj='0';
    end if;
	select msj as mensaje;
end; //

create procedure altaTipo(in mail nvarchar(35), in tipo nvarchar(20))
begin 
	declare privilegio int(2);
    if tipo='Premium' then
		set privilegio=1;
        insert into relusrtipo(Correo,idTipo) values(mail,privilegio);
	else
		set Privilegio=2;
        insert into relusrtipo(Correo,idTipo) values(mail,privilegio);
    end if;
end;//

create procedure BajaProducto(in mail nvarchar(35), in codigo nvarchar(35))
begin
	declare iDesp int;
    declare homeID nvarchar(6);
    
    set homeID = (select idCasa from relUsrCasa where Correo = mail);
    set iDesp = (select idDespensa from relCasaDespensa where idCasa = homeID);
    DELETE FROM relDespensaProductos WHERE idDespensa=iDesp and idUnico=codigo;
    DELETE FROM catalogoproductos WHERE idUnico=codigo;
end;//


create procedure dimeTipo(in mail nvarchar(35))
begin
	declare tipo nvarchar(10);
    set tipo=(select idTipo from relusrtipo where correo=mail);
    select tipo as privilegio;
end;//

create procedure relacionaDespensa(in correo nvarchar(35),in numeroSerie nvarchar(6))
begin 
	declare idRelacion int;
    declare coincidencia int;
    declare estado nvarchar(6);
    
	set estado=(select serie from numSerie where serie=numeroSerie);
    set coincidencia=0;
    
    if estado is not null then
		set coincidencia=(select count(*) from relCasaDespensa where idCasa=numeroSerie);
		if coincidencia<=0 then
			insert into relCasaDespensa(idRel,idCasa,idDespensa) values(1,numeroSerie,1);
        else
			insert into relUsrCasa(correo,idCasa) values(correo,numeroSerie);
        end if;
    end if;
end;//

/*create procedure relHab(in mail nvarchar(35),in nombre nvarchar(30))
begin
	declare idHabi int(2);
    declare idCasuki nvarchar(6);
    declare coincidencia int(2);
    set idHabi=(select count(*) from habitaciones);
	set idCasuki=(select idCasa from relUsrCasa where relUsrCasa.Correo=mail);
    if idHabi=0 then
		set idHabi=1;
        insert into habitaciones(idHabitacion,nombre) values(idHabi,nombre);
        insert into relCasaHab(idHabitacion, idCasa) values(idHabi,idCasuki);
    else
		set idHabi=idHabi+1;
		set coincidencia=(select count(*) from relCasaHab where idHabitacion=idHabi);
        if coincidencia<=0 then
			
			insert into habitaciones(idHabitacion,nombre) values(idHabi,nombre);
			insert into relCasaHab(idHabitacion, idCasa) values(idHabi,idCasuki);
		end if;
		
    end if;    
end;//
*/

create procedure dimePaquete(in serie nvarchar(35),in mail nvarchar(35))
begin
	declare numSerie nvarchar(40);
	if serie='' then
		set numSerie=(select idCasa from relUsrCasa where correo=mail);
        select paquete as pkte from casa where idCasa=numSerie;
	else
		select paquete as pkte from casa where idCasa=serie;
    end if;
    
end;//

create procedure inventario(in mail nvarchar(35))
begin
    declare idCasi nvarchar(6);
    declare idDespi int(2);
    set idCasi=(select idCasa from relUsrCasa where correo=mail);
    set idDespi=(select idDespensa from relCasaDespensa where idCasa=idCasi);
    
    
	select cantidad as numero, idUnico as barcode, producto as produ, aviso as alertuki from relDespensaProductos where idDespensa = idDespi;
    
end;//
create procedure enchufeState(in mail nvarchar(35),habi nvarchar(15))
begin
    declare idCasi nvarchar(6);
    
    
    set idCasi=(select idCasa from relUsrCasa where correo=mail);
    
    
    
	select cantidad as numero, idUnico as barcode from relDespensaProductos where idDespensa = idDespi;
    
end;//

create procedure ingresaProteccion(in mail nvarchar(35),in estadots nvarchar(30))
begin
declare idCasuki nvarchar(6);
declare coin int(2);
set idCasuki=(select idCasa from relUsrCasa where correo=mail);
set coin=(select count(*) from relCasaNka where idCasa=idCasuki);
if coin=0 then
	if estadots='SI' then
		insert into relCasaNka(idCasa,estado) values(idCasuki,estadots);
	else
		insert into relCasaNka(idCasa,estado) values(idCasuki,'no hay chavots');
    end if;
end if;
end;//

create procedure dimeNKA(in mail nvarchar(35))
begin
declare idCasuki nvarchar(6);
set idCasuki=(select idCasa from relUsrCasa where correo=mail);
select estado as estadots from relCasaNka where idCasa=idCasuki;
end;//

create procedure ingresaAltura(in mail nvarchar(20), in heightM nvarchar(3), in heightMin nvarchar(3))
begin
declare idCasuki nvarchar(6);
set idCasuki=(select idCasa from relUsrCasa where correo=mail);
update relCasaNka set alturaMax=heightM where idCasa=idCasuki;
update relCasaNka set alturaMin=heightMin where idCasa=idCasuki;
end;//
create procedure dimeAltura(in mail nvarchar(35))
begin
declare idCasuki nvarchar(6);
set idCasuki=(select idCasa from relUsrCasa where correo=mail);
select alturaMax as alto, alturaMin as bajo from relCasaNka where idCasa=idCasuki;
end;//
create procedure dimeCuenta(in serie nvarchar(35))
begin
declare dir nvarchar(35);
declare mensaje nvarchar(100);
set dir=(select direccion from casa where idCasa=serie);
if dir!='' then
	set mensaje='Ya hay usuario principal';
else
	set mensaje='adelante';
end if;
select mensaje as msj;
end;//
create procedure altaUsu(in serie nvarchar(6), in mail nvarchar(35),in pass blob,in nom nvarchar(30), in aPat nvarchar(30), in aMat nvarchar(30), in tipoUsu nvarchar(20),in uldMail nvarchar(35), in passOrig blob)
begin
declare usuCoin int;
declare mensaje nvarchar(100);
set usuCoin=(select count(*) from usuarios where correo=uldMail and contrasenia=passOrig);
if usuCoin=0 then
	set mensaje='contra invalida';
else
	insert into usuarios(Correo,contrasenia,nombre,aPaterno,aMaterno) values(mail,pass,nom,aPat,aMat);
    call registraCasa('',mail,serie);
    call altaTipo(mail,tipoUsu);
    set mensaje='alta';
end if;
select mensaje as msj;
end;//
delimiter ;