USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearGrupo]    Script Date: 13/03/2021 20:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearGrupo]
@grup_codigo char(20),
@jor_codigo char(10),
@sem_codigo char(10),
@car_codigo char(10),
@grup_descripcion varchar(60)
AS
IF EXISTS (SELECT 1 FROM CARRERA WHERE car_codigo=@car_codigo)
	BEGIN
		IF EXISTS (SELECT 1 FROM SEMESTRE WHERE sem_codigo=@sem_codigo)
			BEGIN
				IF EXISTS (SELECT 1 FROM JORNADA WHERE jor_codigo=@jor_codigo)
					BEGIN
						IF NOT EXISTS (SELECT 1 FROM [dbo].[GRUPO] WHERE grup_codigo=@grup_codigo )
							BEGIN
								INSERT INTO [dbo].[GRUPO]([grup_codigo],
								[jor_codigo],
								[sem_codigo],
								[car_codigo],
								[grup_descripcion])

								VALUES(@grup_codigo,
								@jor_codigo,
								@sem_codigo,
								@car_codigo,
								@grup_descripcion)

								SELECT 'SE INSERTO GRUPO CORRECTAMENTE' AS RESULTADO
							END
						END
					ELSE
					  BEGIN
						SELECT ' JORNADA NO EXISTE' AS RESULTADO
					  END
			END
			ELSE
				BEGIN
					SELECT 'SEMESTRE NO EXISTE' AS RESULTADO
				END
		END
 ELSE
	BEGIN
	 SELECT 'CARRERRA NO EXISTE' AS RESULTADO
	END


	
GO

