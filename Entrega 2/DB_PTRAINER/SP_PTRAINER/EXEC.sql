exec DB_PTRAINER.dbo.SP_InsertarInfoGimnasio 'Los Jaules', 'Coronado', 'L-V de 9:30 a 8:30'
exec DB_PTRAINER.dbo.SP_InsertarInfoGimnasio 'Ptrainer', 'San Jose', 'L-V de 9:30 a 8:30'
exec SP_InsertarInformacionGimnasio 'PTrainer', 'Moravia', 'L-V de 9:30 a 8:30'

delete from DB_PTRAINER.dbo.DB_GIMNASIO 
delete from DB_PTRAINER.dbo.DB_USUARIO

delete from DB_PTRAINER.dbo.DB_MAQUINA WHERE id_maquina= 4

select * from DB_PTRAINER.dbo.DB_GIMNASIO

select * from DB_PTRAINER.dbo.DB_USUARIO

select * from DB_PTRAINER.dbo.DB_MAQUINA

select * from DB_PTRAINER.dbo.DB_EJERCICIO

select * from DB_PTRAINER.dbo.DB_RUTINA

select * from DB_PTRAINER.dbo.DB_RUTINAxEJERCICIO

insert into DB_RUTINAxEJERCICIO(indicacion,puntuacion,repeticiones,series,pausa,avance, FK_RUTINA, FK_EJERCICIO)
	values ('rett', '6.5', '15', '6', '7', '7.8',
	(select rutina.id_rutina from DB_RUTINA as rutina where rutina.nombre= 'MiRutina'),
	(select ejercicio.id_ejercicio from DB_EJERCICIO as ejercicio where ejercicio.nombre='brazos'))

DBCC CHECKIDENT (DB_USUARIO, RESEED,0)

exec DB_PTRAINER.dbo.SP_InsertarUsuario 'Silvia', 'silviamj', 'hhys65'