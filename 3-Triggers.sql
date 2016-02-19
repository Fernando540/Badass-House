use badasshouse;
drop trigger if exists creameHabs;
drop trigger if exists creaEnchufes;

delimiter //

create trigger creameHabs after insert on casa for each row
begin
	declare homeID nvarchar(6);
    declare paktazo nvarchar(30);
    declare noHabs int;
    
	set homeID = (NEW.idCasa);
	set paktazo = (NEW.paquete);
    set noHabs = (select count(*) from habitaciones);
    
	if (paktazo = 'Basico')then
		insert into habitaciones (nombre) values ('Habitacion 1');
        set noHabs = (noHabs+1);
        insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
		insert into habitaciones (nombre) values ('Habitacion 2');
		set noHabs = (noHabs+1);
        insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
	else
		if (paktazo = 'Pro')then
			insert into habitaciones (nombre) values ('Habitacion 1');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 2');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 3');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 4');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
		else
			insert into habitaciones (nombre) values ('Habitacion 1');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 2');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 3');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 4');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 5');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
			insert into habitaciones (nombre) values ('Habitacion 6');
            set noHabs = (noHabs+1);
			insert into relCasaHab (idHabitacion,idCasa) values (noHabs,homeID);
		end if;
	end if;

end;//

create trigger creaEnchufes after insert on habitaciones for each row
begin
	declare totEnchufe int;
    declare room int;
	
	set room = (NEW.idHabitacion);
    
    set totEnchufe = (select count(*) from enchufes);
    
    set totEnchufe = (totEnchufe+1);
    insert into enchufes(idEnchufe, nombre) values(totEnchufe,'Enchufe1');
    insert into relEnchuHab(idHabitacion,idEnchufe) values (room,totEnchufe);
    
    set totEnchufe = (totEnchufe+1);
    insert into enchufes(idEnchufe, nombre) values(totEnchufe,'Enchufe2');
    insert into relEnchuHab(idHabitacion,idEnchufe) values (room,totEnchufe);
    
    set totEnchufe = (totEnchufe+1);
    insert into enchufes(idEnchufe, nombre) values(totEnchufe,'Enchufe3');
    insert into relEnchuHab(idHabitacion,idEnchufe) values (room,totEnchufe);
    
    set totEnchufe = (totEnchufe+1);
    insert into enchufes(idEnchufe, nombre) values(totEnchufe,'Luz');
    insert into relEnchuHab(idHabitacion,idEnchufe) values (room,totEnchufe);
	
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
