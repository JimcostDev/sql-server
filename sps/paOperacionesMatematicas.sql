USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paOperacionesMatematicas]    Script Date: 13/03/2021 21:06:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paOperacionesMatematicas]
@NumeroUno DECIMAL (13,2),
@NumeroDos DECIMAL (13,2),
@Operacion CHAR (1)
AS
DECLARE @Resultado DECIMAL(13,2)
IF @Operacion = '+'
	BEGIN
		SET  @Resultado = @NumeroUno + @NumeroDos
	END
IF @Operacion = '-'
	BEGIN
		SET  @Resultado = @NumeroUno - @NumeroDos
	END
IF @Operacion = '/' AND @NumeroDos > 0
	BEGIN
		SET  @Resultado = @NumeroUno / @NumeroDos
	END

IF @Operacion = '*'
	BEGIN
		SET  @Resultado = @NumeroUno * @NumeroDos
	END
ELSE
	BEGIN 
		 SELECT 'No se puede hacer una división entre cero (n/0)' 
	END
SELECT @Resultado AS RESULTADO

--EXEC paOperacionesMatematicas 10, 0, '/'
GO

