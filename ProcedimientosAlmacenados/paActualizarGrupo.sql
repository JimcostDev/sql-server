USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarGrupo]    Script Date: 13/03/2021 20:48:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarGrupo]
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
							IF  EXISTS (SELECT 1 FROM [dbo].[GRUPO] WHERE grup_codigo=@grup_codigo)
								BEGIN
									UPDATE GRUPO SET grup_descripcion = @grup_descripcion,
									jor_codigo=@jor_codigo, 
									sem_codigo=@sem_codigo,
									car_codigo=@car_codigo
									WHERE grup_codigo=@grup_codigo 
								SELECT 'GRUPO SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
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

