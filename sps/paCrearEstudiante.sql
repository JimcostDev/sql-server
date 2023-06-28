USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearEstudiante]    Script Date: 13/03/2021 20:59:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearEstudiante]
@alu_codigo CHAR (10),
@alu_nombres CHAR (40),
@alu_apellidos CHAR (40),
@alu_direccion VARCHAR(120),
@alu_telefono VARCHAR (20),
@alu_email VARCHAR (50),
@alu_fechaNacimiento DATE,
@alu_sexo CHAR(1),
@ciu_codigo CHAR(10),
@dep_codigo CHAR(10),
@pai_codigo CHAR(10),
@alu_dni CHAR (20)

AS
IF EXISTS (SELECT 1 FROM CIUDAD WHERE ciu_codigo=@ciu_codigo AND dep_codigo= @dep_codigo AND pai_codigo = @pai_codigo  )
	BEGIN

		IF NOT EXISTS (SELECT 1 FROM [dbo].[ALUMNO] WHERE [pai_codigo]=@pai_codigo AND [dep_codigo]= @dep_codigo AND ciu_codigo = @ciu_codigo AND alu_codigo=@alu_codigo)
			BEGIN
				INSERT INTO [dbo].[ALUMNO]([alu_codigo],
				[alu_nombres],
				[alu_apellidos],
				[alu_direccion],
				[alu_telefono],
				[alu_email],
				[alu_fechaNacimiento],
				[alu_sexo],
				[ciu_codigo],
				[dep_codigo],
				[pai_codigo],
				[alu_dni])

				VALUES(@alu_codigo,
				@alu_nombres,
				@alu_apellidos,
				@alu_direccion,
				@alu_telefono,
				@alu_email,
				@alu_fechaNacimiento,
				@alu_sexo,
				@ciu_codigo,
				@dep_codigo,
				@pai_codigo,
				@alu_dni)

				SELECT 'SE INSERTO ESTUDIANTE CORRECTAMENTE' AS RESULTADO
			END
			ELSE
				BEGIN
					SELECT 'CIUDAD YA EXISTE' AS RESULTADO
				END
			END
ELSE
	BEGIN
		SELECT 'CIUDAD NO EXISTE' AS RESULTADO
	END
GO

