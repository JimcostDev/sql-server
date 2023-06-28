USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearDepartamento]    Script Date: 13/03/2021 20:57:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearDepartamento]
@dep_codigo CHAR(10),
@dep_nombre CHAR (40),
@pai_codigo CHAR (10)
AS
IF EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo = @pai_codigo)
	BEGIN

		IF NOT EXISTS (SELECT 1 FROM DEPARTAMENTO WHERE pai_codigo=@pai_codigo AND dep_codigo = @dep_codigo)
			BEGIN
				INSERT INTO DEPARTAMENTO([dep_codigo],[dep_nombre],[pai_codigo])
				VALUES(@dep_codigo,@dep_nombre, @pai_codigo)
				SELECT 'SE INSERTO EL DEPARTAMENTO CORRECTAMENTE' AS RESULTADO
			END
		ELSE
			BEGIN
				SELECT 'DEPARTAMENTO YA EXISTE' AS RESULTADO
			END
		END
ELSE
	BEGIN
		SELECT 'PAIS NO EXISTE' AS RESULTADO
	END
GO

