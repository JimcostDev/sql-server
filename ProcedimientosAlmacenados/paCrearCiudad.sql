USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearCiudad]    Script Date: 13/03/2021 20:56:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearCiudad]
@ciu_codigo CHAR(10),
@ciu_nombre CHAR (40),
@dep_codigo CHAR (10),
@pai_codigo CHAR (10)
AS
IF EXISTS (SELECT 1 FROM DEPARTAMENTO WHERE dep_codigo= @dep_codigo AND pai_codigo = @pai_codigo  )
	BEGIN

		IF NOT EXISTS (SELECT 1 FROM [dbo].[CIUDAD] WHERE [pai_codigo]=@pai_codigo AND [dep_codigo]= @dep_codigo AND [ciu_codigo]=@ciu_codigo)
			BEGIN
				INSERT INTO [dbo].[CIUDAD]([ciu_codigo],[ciu_nombre],[dep_codigo],[pai_codigo])
				VALUES(@ciu_codigo, @ciu_nombre, @dep_codigo, @pai_codigo)
				SELECT 'SE INSERTO LA CIUDAD CORRECTAMENTE' AS RESULTADO
			END
			ELSE
				BEGIN
					SELECT 'CIUDAD YA EXISTE' AS RESULTADO
				END
			END
ELSE
	BEGIN
		SELECT 'DEPARTAMENTO NO EXISTE' AS RESULTADO
	END
GO

