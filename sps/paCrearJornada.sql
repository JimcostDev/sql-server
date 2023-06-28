USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearJornada]    Script Date: 13/03/2021 21:00:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearJornada]
@jor_codigo CHAR(10),
@jor_nombre CHAR (20)
AS
IF NOT EXISTS (SELECT 1 FROM JORNADA WHERE jor_codigo=@jor_codigo)
	BEGIN
		INSERT INTO JORNADA([jor_codigo],[jor_nombre])
		VALUES(@jor_codigo, @jor_nombre)
		SELECT 'SE INSERTO JORNADA CORRECTAMENTE' AS RESULTADO
	END
ELSE
	BEGIN
		SELECT 'JORNADA YA EXISTE' AS RESULTADO
	END
GO

