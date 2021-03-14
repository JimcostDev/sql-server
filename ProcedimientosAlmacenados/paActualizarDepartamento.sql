USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarDepartamento]    Script Date: 13/03/2021 20:46:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[paActualizarDepartamento]
@dep_codigo CHAR(10),
@dep_nombre CHAR (40),
@pai_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo=@pai_codigo)
	BEGIN
	IF EXISTS (SELECT 1 FROM DEPARTAMENTO WHERE dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo)
		BEGIN
			UPDATE DEPARTAMENTO SET dep_nombre = @dep_nombre, pai_codigo=@pai_codigo WHERE dep_codigo = @dep_codigo AND pai_codigo=@pai_codigo
			SELECT 'DEPARTAMENTO SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
		END
	ELSE
		BEGIN
			SELECT 'DEPARTAMENTO NO EXISTE' AS RESULTADO
		END
	END
ELSE
	BEGIN
		SELECT 'PAIS NO EXISTE' AS RESULTADO
	END
GO

