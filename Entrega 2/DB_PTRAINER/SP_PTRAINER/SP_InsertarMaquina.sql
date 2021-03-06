USE [DB_PTRAINER]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarMaquina]    Script Date: 25/10/2014 22:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_InsertarMaquina]
	-- Add the parameters for the stored procedure here
	@Nombre nchar(10),
	@Respuesta int OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF not Exists (select nombre
			   from DB_MAQUINA 
			   where nombre=@Nombre)
		BEGIN

			insert into DB_MAQUINA(nombre,FK_DB_GIMNASIO)
			values (@Nombre,
			(select gimnasio.id_gimnasio
			from DB_GIMNASIO as gimnasio
			where gimnasio.nombre='PTrainer'))
			SET @Respuesta = 1
			
		END
	ELSE
		
		BEGIN
			SET @Respuesta = 0
		END
		
	RETURN @Respuesta
END
