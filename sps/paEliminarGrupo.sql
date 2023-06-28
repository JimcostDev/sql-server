USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paEliminarGrupo]    Script Date: 13/03/2021 21:04:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paEliminarGrupo]
@grup_codigo char(20)
AS
IF EXISTS (SELECT 1 FROM GRUPO WHERE grup_codigo=@grup_codigo)
BEGIN 
	DELETE FROM GRUPO WHERE grup_codigo=@grup_codigo
	SELECT 'SE ELIMINO GRUPO CORRECTAMENTE' AS RESULTADO
END
ELSE
	BEGIN
		SELECT 'GRUPO NO EXISTE' AS RESULTADO
	END
GO

