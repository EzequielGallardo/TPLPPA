USE [TP_Integrador_G4_LPPA]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 06/04/2022 12:22:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permiso](
	[per_Id] [int] NOT NULL,
	[per_Cod_Permiso] [varchar](50) NOT NULL,
	[per_detalle_Permiso] [varchar](100) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[per_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Permiso] ([per_Id], [per_Cod_Permiso], [per_detalle_Permiso]) VALUES (1, N'ABM Productos ', N'Gestión de Productos del e-Commerce')
INSERT [dbo].[Permiso] ([per_Id], [per_Cod_Permiso], [per_detalle_Permiso]) VALUES (2, N'ABM Categorías Productos', N'Gestión de Categorías del e-Commerce')
/****** Object:  StoredProcedure [dbo].[PERMISO_LISTARID]    Script Date: 06/04/2022 12:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PERMISO_LISTARID]
@ID int
as
BEGIN
	SELECT per_Id, per_Cod_Permiso, per_detalle_Permiso
	FROM permiso
	WHERE per_Id = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_LISTAR]    Script Date: 06/04/2022 12:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PERMISO_LISTAR]
AS 
BEGIN
	SELECT a.per_Id, a.per_Cod_Permiso, a.per_detalle_Permiso
	FROM Permiso a;
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_INSERTAR]    Script Date: 06/04/2022 12:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PERMISO_INSERTAR]
	@COD_PERMISO VARCHAR(50), 
	@DESCRIPCION_PERMISO VARCHAR(MAX)
AS 
BEGIN
	DECLARE @ID INT
	
	SET @ID = ISNULL ((SELECT MAX(per_Id) FROM Permiso) ,0) + 1;
	
	INSERT INTO Permiso  (per_Id, per_Cod_Permiso, per_detalle_Permiso)
	VALUES (@ID, @COD_PERMISO, @DESCRIPCION_PERMISO );
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_EDITAR]    Script Date: 06/04/2022 12:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PERMISO_EDITAR]
	@ID INT,
	@COD_PERMISO VARCHAR(50), 
	@DESCRIPCION_PERMISO VARCHAR(100)
AS 
BEGIN
	
	UPDATE PERMISO
	SET
		per_Cod_Permiso = @COD_PERMISO ,
		per_detalle_Permiso=  @DESCRIPCION_PERMISO
	WHERE per_Id = @ID;
	
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_BORRAR]    Script Date: 06/04/2022 12:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PERMISO_BORRAR]
	@ID INT
AS 
BEGIN
	
	DELETE FROM PERMISO 
	WHERE per_ID = @ID;
	
END
GO
