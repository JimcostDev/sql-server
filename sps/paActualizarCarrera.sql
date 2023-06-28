USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paActualizarCarrera]    Script Date: 13/03/2021 20:45:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paActualizarCarrera]
@car_codigo CHAR(10),
@car_nombre CHAR (80)
AS
IF EXISTS (SELECT 1 FROM CARRERA WHERE car_codigo=@car_codigo)
BEGIN 
	UPDATE CARRERA SET car_nombre = @car_nombre WHERE car_codigo=@car_codigo
	SELECT 'CARRERA SE ACTUALIZO CORRECTAMENTE' AS RESULTADO
END
ELSE
	BEGIN
		SELECT 'CARRERA NO EXISTE' AS RESULTADO
	END
GO

