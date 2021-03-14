USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarSemestre]    Script Date: 13/03/2021 20:49:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarSemestre]
@sem_codigo CHAR(10),
@sem_nombre CHAR (40)
AS
IF EXISTS (SELECT 1 FROM SEMESTRE WHERE sem_codigo=@sem_codigo)
BEGIN 
	UPDATE SEMESTRE SET sem_nombre = @sem_nombre WHERE sem_codigo=@sem_codigo
	SELECT 'SEMESTRE SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
END
ELSE
	BEGIN
		SELECT 'SEMESTRE NO EXISTE' AS RESULTADO
	END
GO

