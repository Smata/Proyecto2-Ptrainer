USE [master]
GO
/****** Object:  Database [DB_PTRAINER]    Script Date: 26/10/2014 2:15:40 ******/
CREATE DATABASE [DB_PTRAINER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_PTRAINER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_PTRAINER.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_PTRAINER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_PTRAINER_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_PTRAINER] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_PTRAINER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_PTRAINER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_PTRAINER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_PTRAINER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_PTRAINER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_PTRAINER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_PTRAINER] SET  MULTI_USER 
GO
ALTER DATABASE [DB_PTRAINER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_PTRAINER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_PTRAINER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_PTRAINER] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_PTRAINER] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_PTRAINER', N'ON'
GO
USE [DB_PTRAINER]
GO
/****** Object:  Table [dbo].[DB_EJERCICIO]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_EJERCICIO](
	[id_ejercicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[imagen] [image] NULL,
	[FK_MAQUINA] [int] NULL,
 CONSTRAINT [PK_DB_EJERCICIO] PRIMARY KEY CLUSTERED 
(
	[id_ejercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_GIMNASIO]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_GIMNASIO](
	[id_gimnasio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[lugar] [nchar](10) NULL,
	[horario] [varchar](50) NULL,
 CONSTRAINT [PK_DB_GIMNASIO] PRIMARY KEY CLUSTERED 
(
	[id_gimnasio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_MAQUINA]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_MAQUINA](
	[id_maquina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[imagen] [image] NULL,
	[FK_DB_GIMNASIO] [int] NULL,
 CONSTRAINT [PK_DB_MAQUINA] PRIMARY KEY CLUSTERED 
(
	[id_maquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_RANKING]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_RANKING](
	[id_ranking] [int] IDENTITY(1,1) NOT NULL,
	[posicion] [int] NULL,
	[FK_RUTINAxEJERCICIO] [int] NULL,
 CONSTRAINT [PK_DB_RANKING] PRIMARY KEY CLUSTERED 
(
	[id_ranking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_RUTINA]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_RUTINA](
	[id_rutina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[FK_USUARIO] [int] NULL,
 CONSTRAINT [PK_DB_RUTINA] PRIMARY KEY CLUSTERED 
(
	[id_rutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_RUTINAxEJERCICIO]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_RUTINAxEJERCICIO](
	[id_rutinaXejercicio] [int] IDENTITY(1,1) NOT NULL,
	[indicacion] [varchar](50) NULL,
	[puntuacion] [float] NULL,
	[repeticiones] [int] NULL,
	[series] [int] NULL,
	[pausa] [int] NULL,
	[avance] [float] NULL,
	[FK_RUTINA] [int] NULL,
	[FK_EJERCICIO] [int] NULL,
 CONSTRAINT [PK_DB_RUTINAxEJERCICIO] PRIMARY KEY CLUSTERED 
(
	[id_rutinaXejercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_USUARIO]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_USUARIO](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[username] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
	[FK_DB_GIMNASIO] [int] NULL,
 CONSTRAINT [PK_DB_USUARIO] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DB_EJERCICIO]  WITH CHECK ADD  CONSTRAINT [FK_DB_EJERCICIO_DB_MAQUINA] FOREIGN KEY([FK_MAQUINA])
REFERENCES [dbo].[DB_MAQUINA] ([id_maquina])
GO
ALTER TABLE [dbo].[DB_EJERCICIO] CHECK CONSTRAINT [FK_DB_EJERCICIO_DB_MAQUINA]
GO
ALTER TABLE [dbo].[DB_MAQUINA]  WITH CHECK ADD  CONSTRAINT [FK_DB_MAQUINA_DB_GIMNASIO] FOREIGN KEY([FK_DB_GIMNASIO])
REFERENCES [dbo].[DB_GIMNASIO] ([id_gimnasio])
GO
ALTER TABLE [dbo].[DB_MAQUINA] CHECK CONSTRAINT [FK_DB_MAQUINA_DB_GIMNASIO]
GO
ALTER TABLE [dbo].[DB_RANKING]  WITH CHECK ADD  CONSTRAINT [FK_DB_RANKING_DB_RUTINAxEJERCICIO] FOREIGN KEY([FK_RUTINAxEJERCICIO])
REFERENCES [dbo].[DB_RUTINAxEJERCICIO] ([id_rutinaXejercicio])
GO
ALTER TABLE [dbo].[DB_RANKING] CHECK CONSTRAINT [FK_DB_RANKING_DB_RUTINAxEJERCICIO]
GO
ALTER TABLE [dbo].[DB_RUTINA]  WITH CHECK ADD  CONSTRAINT [FK_DB_RUTINA_DB_USUARIO] FOREIGN KEY([FK_USUARIO])
REFERENCES [dbo].[DB_USUARIO] ([id_usuario])
GO
ALTER TABLE [dbo].[DB_RUTINA] CHECK CONSTRAINT [FK_DB_RUTINA_DB_USUARIO]
GO
ALTER TABLE [dbo].[DB_RUTINAxEJERCICIO]  WITH CHECK ADD  CONSTRAINT [FK_DB_RUTINAxEJERCICIO_DB_EJERCICIO] FOREIGN KEY([FK_EJERCICIO])
REFERENCES [dbo].[DB_EJERCICIO] ([id_ejercicio])
GO
ALTER TABLE [dbo].[DB_RUTINAxEJERCICIO] CHECK CONSTRAINT [FK_DB_RUTINAxEJERCICIO_DB_EJERCICIO]
GO
ALTER TABLE [dbo].[DB_RUTINAxEJERCICIO]  WITH CHECK ADD  CONSTRAINT [FK_DB_RUTINAxEJERCICIO_DB_RUTINA] FOREIGN KEY([FK_RUTINA])
REFERENCES [dbo].[DB_RUTINA] ([id_rutina])
GO
ALTER TABLE [dbo].[DB_RUTINAxEJERCICIO] CHECK CONSTRAINT [FK_DB_RUTINAxEJERCICIO_DB_RUTINA]
GO
ALTER TABLE [dbo].[DB_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_DB_USUARIO_DB_GIMNASIO] FOREIGN KEY([FK_DB_GIMNASIO])
REFERENCES [dbo].[DB_GIMNASIO] ([id_gimnasio])
GO
ALTER TABLE [dbo].[DB_USUARIO] CHECK CONSTRAINT [FK_DB_USUARIO_DB_GIMNASIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearRutina]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CrearRutina]
	-- Add the parameters for the stored procedure here
	@Nombre nchar(10),
	@Username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into DB_Rutina(nombre,FK_USUARIO)
	values (@Nombre,
	(select usuario.id_usuario
	from DB_USUARIO as usuario
	where usuario.username=@Username))
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarEjercicio]    Script Date: 26/10/2014 2:15:40 ******/
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
	@Maquina nchar(10)
	--@Respuesta int OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--IF not Exists (select nombre
		--	   from DB_EJERCICIO 
			--   where nombre=@Nombre)
		--BEGIN

	insert into DB_EJERCICIO(nombre,FK_MAQUINA)
	values (@Nombre,
	(select maquina.id_maquina
	from DB_MAQUINA as maquina
	where maquina.nombre=@Maquina))
			--SET @Respuesta = 1
			
		--END
	--ELSE
		
		--BEGIN
			--SET @Respuesta = 0
		--END
		
	--RETURN @Respuesta
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarEjercicioEnRutina]    Script Date: 26/10/2014 2:15:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_InsertarInformacionGimnasio]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertarInformacionGimnasio]

@Nombre nchar(10),
@Lugar nchar(10),
@Horario varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO DB_GIMNASIO(nombre, lugar, horario)
    VALUES (@Nombre, @Lugar, @Horario)

 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarMaquina]    Script Date: 26/10/2014 2:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertarMaquina]
	-- Add the parameters for the stored procedure here
	@Nombre nchar(10)
	--@Respuesta int OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--IF not Exists (select nombre
			   --from DB_MAQUINA 
			   --where nombre=@Nombre)
		--BEGIN

			insert into DB_MAQUINA(nombre,FK_DB_GIMNASIO)
			values (@Nombre,
			(select gimnasio.id_gimnasio
			from DB_GIMNASIO as gimnasio
			where gimnasio.nombre='PTrainer'))
			--SET @Respuesta = 1
			
		END
	--ELSE
		
		--BEGIN
			--SET @Respuesta = 0
		--END
		
	--RETURN @Respuesta
--END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarUsuario]    Script Date: 26/10/2014 2:15:40 ******/
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
USE [master]
GO
ALTER DATABASE [DB_PTRAINER] SET  READ_WRITE 
GO
