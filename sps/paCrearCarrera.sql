USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paCrearCarrera]    Script Date: 13/03/2021 20:56:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paCrearCarrera]
@car_codigo CHAR(10),
@car_nombre CHAR (80)
AS
IF NOT EXISTS (SELECT 1 FROM CARRERA WHERE car_codigo=@car_codigo)
	BEGIN
		INSERT INTO CARRERA([car_codigo],[car_nombre])
		VALUES(@car_codigo, @car_nombre)
		SELECT 'SE INSERTO  CARRERA CORRECTAMENTE' AS RESULTADO
	END
ELSE
	BEGIN
		SELECT 'CARRERA YA EXISTE' AS RESULTADO
	END
GO

