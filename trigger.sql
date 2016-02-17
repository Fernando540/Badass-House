use badasshouse;
drop trigger if exists creaRel;
drop procedure if exists relacionaDespensa;
drop procedure if exists relHab;
drop procedure if exists dimePaquete;
drop procedure if exists inventario;

delimiter //


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

create procedure relHab(in mail nvarchar(35),in nombre nvarchar(30))
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

create procedure dimePaquete(in mail nvarchar(35))
begin
	declare paquete nvarchar(20);
    declare tipo int(2);
    set tipo=(select idTipo from relUsrPaquete where correo=mail);
    set paquete=(select nombre from paquetes where idTipo=tipo);
    select paquete as tipo;
end;//

create procedure inventario(in mail nvarchar(35))
begin
    declare idCasi nvarchar(6);
    declare idDespi int(2);
    set idCasi=(select idCasa from relUsrCasa where correo=mail);
    set idDespi=(select idDespensa from relCasaDespensa where idCasa=idCasi);
    
	select cantidad as numero, idProducto as barcode from relDespensaProductos where idDespensa = idDespi;
    
end;//
/*create trigger altaDespensa after insert on usuarios for each row
begin
	declare idDesp int;
	declare idDespRel int;
    
    set idDesp = (select count(idDespensa) from despensa);
    set idDespRel=(select count(idRel) from relCasaDespensa);
    
	if idDesp=0 then
		insert into despensa(idDespensa) values(1);
	else
        insert into despensa(idDespensa) values((idDesp+1));
    end if;
    
    if idDespRel= 0 and idDesp=0 then
		insert into relCasaDespensa(idRel,Correo,idDespensa) values(1,new.Correo,1);
	else
		insert into relCasaDespensa(idRel,Correo,idDespensa) values((idDespRel+1),new.Correo,(idDesp+1));
    end if;

end;***/
