USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarCiudad]    Script Date: 13/03/2021 20:46:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarCiudad]
@ciu_codigo CHAR(10),
@ciu_nombre CHAR (40),
@dep_codigo CHAR(10),
@pai_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM  DEPARTAMENTO WHERE dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo)
	BEGIN
	IF EXISTS (SELECT 1 FROM CIUDAD WHERE ciu_codigo =@ciu_codigo AND dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo)
		BEGIN
			UPDATE CIUDAD SET ciu_nombre = @ciu_nombre,dep_codigo=@dep_codigo , pai_codigo=@pai_codigo WHERE ciu_codigo =@ciu_codigo AND dep_codigo = @dep_codigo AND pai_codigo=@pai_codigo
			SELECT 'CIUDAD SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
		END
	ELSE
		BEGIN
			SELECT 'CIUDAD NO EXISTE' AS RESULTADO
		END
	END
ELSE
	BEGIN
		SELECT 'DEPARTAMENTO NO EXISTE' AS RESULTADO
	END
GO

