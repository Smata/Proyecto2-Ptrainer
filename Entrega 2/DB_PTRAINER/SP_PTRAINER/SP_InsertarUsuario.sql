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
CREATE PROCEDURE [dbo].[SP_InsertarUsuario]

@Nombre nchar(10),
@Username varchar(50),
@Password varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into DB_USUARIO(nombre, username, contraseña, FK_DB_GIMNASIO)
    values (@Nombre, @Username, @Password,
		(select gimnasio.id_gimnasio
		from DB_GIMNASIO as gimnasio
		where gimnasio.nombre='PTrainer'))

 
END
GO
