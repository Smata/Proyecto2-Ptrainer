-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertarEjercicio]
	-- Add the parameters for the stored procedure here
	@Nombre nchar(10),
	@Maquina nchar(10),
	@Respuesta int OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF not Exists (select nombre
			   from DB_EJERCICIO 
			   where nombre=@Nombre)
		BEGIN

			insert into DB_EJERCICIO(nombre,FK_MAQUINA)
			values (@Nombre,
			(select maquina.id_maquina
			from DB_MAQUINA as maquina
			where maquina.nombre=@Maquina))
			SET @Respuesta = 1
			
		END
	ELSE
		
		BEGIN
			SET @Respuesta = 0
		END
		
	RETURN @Respuesta
END
