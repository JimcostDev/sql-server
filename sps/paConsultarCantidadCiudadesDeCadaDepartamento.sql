USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paConsultarCantidadCiudadesDeCadaDepartamento]    Script Date: 13/03/2021 20:50:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paConsultarCantidadCiudadesDeCadaDepartamento]
@dep_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM DEPARTAMENTO WHERE dep_codigo=@dep_codigo)
	BEGIN
		Select D.dep_nombre as 'Nombre de Departamento', count(C.ciu_codigo) as 'Numero de Ciudades' from CIUDAD C INNER JOIN 
		DEPARTAMENTO D ON C.dep_codigo=D.dep_codigo WHERE D.dep_codigo=@dep_codigo  GROUP BY D.dep_nombre                        
	END
ELSE
	BEGIN
		SELECT 'DEPARTAMENTO NO EXISTE' AS RESULTADO
	END
	
GO

