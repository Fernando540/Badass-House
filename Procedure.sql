use badasshouse;
drop procedure if exists valida;
drop procedure if exists validaSerie;
drop procedure if exists registraCasa;
drop procedure if exists altadespensuki;
drop procedure if exists UsoProducto;
drop procedure if exists actualiza;
drop procedure if exists BajaProducto;

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
    
    update casa set direccion = adress where idCasa=seriuki;

    set noDespensas = (select count(*) from despensa);
    if noDespensas = 0 then
		set noDespensas = 1;
		insert into despensa(idDespensa) values(noDespensas);
    else
		set noDespensas = (noDespensas+1);
        insert into despensa(idDespensa) values(noDespensas);
    end if;
	
    
    
    insert into relusrcasa(Correo,idCasa) values(correito,seriuki);
    insert into relcasadespensa(idCasa,idDespensa) values(seriuki,idDespensa);
end;//

create procedure altadespensuki(in correo nvarchar(35), in codigo nvarchar(35),in nombre nvarchar(35))
begin
	declare contador int;
    declare total int;
    set total = (select cantidad from despensapro where cod=codigo);
    set contador=(select count(cod) from despensapro where cod=codigo);
    
    if contador=0 then
		insert into despensapro(correo,produ,cod,cantidad) values(correo,nombre,codigo,1);
    else
        update despensapro set cantidad=(total+1) where cod=codigo;

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

create procedure BajaProducto(in mail nvarchar(35), in codigo nvarchar(35))
begin
    DELETE FROM despensapro WHERE correo=mail and cod=codigo;
end;//
delimiter ;

