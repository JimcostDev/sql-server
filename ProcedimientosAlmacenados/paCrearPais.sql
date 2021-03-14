USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearPais]    Script Date: 13/03/2021 21:00:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearPais]
@pai_codigo CHAR(10),
@pai_nombre CHAR (40)
AS
IF NOT EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo=@pai_codigo)
	BEGIN
		INSERT INTO PAIS ([pai_codigo],[pai_nombre])
		VALUES(@pai_codigo, @pai_nombre)
		SELECT 'SE INSERTO EL PAIS CORRECTAMENTE' AS RESULTADO
	END
ELSE
	BEGIN
		SELECT 'CODIGO DEL PAIS YA EXISTE' AS RESULTADO
	END
GO

