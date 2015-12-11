use badasshouse;
drop procedure if exists valida;
drop procedure if exists registraCasa;
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

create procedure registraCasa(in direccion nvarchar(30))
begin
	declare idcasuki int;
    
    set idcasuki= (select count(idCasa) from casa)+1;
    if idcasuki>1 then
		insert into casa(idCasa,direccion) values(idcasuki,direccion);
	else
		set idcasuki=1;
        insert into casa(idCasa,direccion) values(idcasuki,direccion);
	end if;
end;//
delimiter ;

