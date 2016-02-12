use badasshouse;
drop trigger if exists creaRel;
drop procedure if exists relacionaDespensa;

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
create trigger creaRel after insert on despensa for each row
begin
	update relcasadespensa set idDespensa=new.idDespensa;
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
