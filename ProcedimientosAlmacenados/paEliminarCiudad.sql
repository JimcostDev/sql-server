USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paEliminarCiudad]    Script Date: 13/03/2021 21:02:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paEliminarCiudad]
@ciu_codigo CHAR(10),
@dep_codigo CHAR(10),
@pai_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM CIUDAD WHERE ciu_codigo=@ciu_codigo AND dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo)
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM ALUMNO WHERE ciu_codigo=@ciu_codigo AND dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo)
		BEGIN
			DELETE FROM  CIUDAD WHERE ciu_codigo=@ciu_codigo AND dep_codigo=@dep_codigo AND pai_codigo=@pai_codigo
			SELECT 'CIUDAD SE ELIMINO CORRECTAMENTE' AS RESULTADO
		END
	ELSE
		BEGIN
			SELECT 'NO SE PUEDE ELIMINAR CIUDAD, TIENE RELACIONES EN ALUMNO.' AS RESULTADO
		END
END
ELSE
	BEGIN
		SELECT 'CIUDAD NO EXISTE' AS RESULTADO
	END
GO

