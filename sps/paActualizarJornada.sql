USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarJornada]    Script Date: 13/03/2021 20:49:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarJornada]
@jor_codigo CHAR(10),
@jor_nombre CHAR (20)
AS
IF EXISTS (SELECT 1 FROM JORNADA WHERE jor_codigo=@jor_codigo)
BEGIN 
	UPDATE JORNADA SET jor_nombre = @jor_nombre WHERE jor_codigo=@jor_codigo
	SELECT 'JORNADA SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
END
ELSE
	BEGIN
		SELECT 'JORNADA NO EXISTE' AS RESULTADO
	END
GO

