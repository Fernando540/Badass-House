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
    select mensaje as resultado,estado as estaduki;
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

create procedure altadespensuki(in correin nvarchar(35), in barcode nvarchar(35),in nombre nvarchar(35))
begin
	declare iDesp int;
    declare homeID nvarchar(6);
    declare total int;
    declare coincidencia int;
    declare coinCat int;
    
    set homeID = (select idCasa from relUsrCasa where Correo = correin);
    set iDesp = (select idDespensa from relCasaDespensa where idCasa = homeID);
    set coinCat = (select count(idProducto) from catalogoProductos where idProducto=barcode);
    
    if (coinCat=0) then
		insert into catalogoProductos (idProducto,producto) values (barcode,nombre);
    end if;
    
    set coincidencia = (select count(idProducto) from relDespensaProductos where idDespensa=iDesp and idProducto=barcode);
    
    if (coincidencia = 1) then
		set total = (select cantidad from relDespensaProductos where idDespensa=iDesp and idProducto=barcode);
		update relDespensaProductos set cantidad=(total+1) where idDespensa=iDesp and idProducto=barcode;
	else
		insert into relDespensaProductos (idDespensa,idProducto,cantidad) values (iDesp,barcode,1);
    end if;
end;//

create procedure UsoProducto(in mail nvarchar(35), in codigo nvarchar(35),in canti int)
begin
    declare total int;
    declare ntotal int;
    set total = (select cantidad from despensapro where cod=codigo and correo=mail);
	set ntotal = (total-canti);
    update despensapro set cantidad=(ntotal) where cod=codigo and correo=mail;

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
    DELETE FROM despensapro WHERE correo=mail and cod=codigo;
end;//
create procedure dimeTipo(in mail nvarchar(35))
begin
	declare tipo nvarchar(10);
    set tipo=(select idTipo from relusrtipo where correo=mail);
    select tipo as privilegio;
end;//

delimiter ;

