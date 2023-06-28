USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearSemestre]    Script Date: 13/03/2021 21:01:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearSemestre]
@sem_codigo CHAR(10),
@sem_nombre CHAR (40)
AS
IF NOT EXISTS (SELECT 1 FROM SEMESTRE WHERE sem_codigo=@sem_codigo)
	BEGIN
		INSERT INTO SEMESTRE([sem_codigo],[sem_nombre])
		VALUES(@sem_codigo, @sem_nombre)
		SELECT 'SE INSERTO SEMESTRE CORRECTAMENTE' AS RESULTADO
	END
ELSE
	BEGIN
		SELECT 'SEMESTRE YA EXISTE' AS RESULTADO
	END
GO

