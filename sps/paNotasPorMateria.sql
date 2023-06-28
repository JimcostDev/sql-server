USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paNotasPorMateria]    Script Date: 13/03/2021 21:06:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paNotasPorMateria]
@materia char(30)
as

select * from View_Notas

Where mat_nombre = @materia
GO

