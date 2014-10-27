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
CREATE PROCEDURE [dbo].[SP_InsertarEjercicioEnRutina] 
	-- Add the parameters for the stored procedure here
	@Indicacion varchar(50),
	@Puntuacion float,
	@Repeticiones int,
	@Series int,
	@Pausa int,
	@Avance float,
	@Rutina nchar(10),
	@Ejercicio nchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into DB_RUTINAxEJERCICIO(indicacion,puntuacion,repeticiones,series,pausa,avance, FK_RUTINA, FK_EJERCICIO)
	values (@Indicacion, @Puntuacion, @Repeticiones, @Series, @Pausa, @Avance,
	(select rutina.id_rutina from DB_RUTINA as rutina where rutina.nombre= @Rutina),
	(select ejercicio.id_ejercicio from DB_EJERCICIO as ejercicio where ejercicio.nombre=@Ejercicio))
END
GO
