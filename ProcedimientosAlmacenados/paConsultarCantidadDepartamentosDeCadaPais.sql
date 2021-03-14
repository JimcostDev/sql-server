USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paConsultarCantidadDepartamentosDeCadaPais]    Script Date: 13/03/2021 20:51:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paConsultarCantidadDepartamentosDeCadaPais]
@pai_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo=@pai_codigo)
	BEGIN
		Select P.pai_nombre as 'Nombre de País', count(D.dep_codigo) as 'Numero de Departamentos' from DEPARTAMENTO D INNER JOIN 
		PAIS P ON D.pai_codigo=P.pai_codigo where P.pai_codigo=@pai_codigo  GROUP BY pai_nombre 
		                       
	END
ELSE
	BEGIN
		SELECT 'PAIS NO EXISTE' AS RESULTADO
	END
	
GO

