USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarPais]    Script Date: 13/03/2021 20:49:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarPais]
@pai_codigo CHAR(10),
@pai_nombre CHAR (40)
AS
IF EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo=@pai_codigo)
BEGIN 
	UPDATE PAIS SET pai_nombre = @pai_nombre WHERE pai_codigo = @pai_codigo
	SELECT 'PAIS SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
END
ELSE
	BEGIN
		SELECT 'PAIS NO EXISTE' AS RESULTADO
	END
GO

