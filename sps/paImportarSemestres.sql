USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paImportarSemestres]    Script Date: 13/03/2021 21:06:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure [dbo].[paImportarSemestres]
as


IF  Exists (
Select *
From TempImportarSemetres
where Exists (Select 1 From Semestre where sem_codigo =SemestreCodigo)
)
begin
Select 'El Codigo del semestre existe '  + SemestreCodigo   As resultado
From TempImportarSemetres
where Exists (Select 1 From Semestre where sem_codigo =SemestreCodigo)
Return
end

if Exists ( Select *
From TempImportarSemetres
where Exists (Select 1 From Semestre where sem_nombre =SemestreNombre))
begin
Select 'El nombre  del semestre existe '  + SemestreNombre  As resultado
From TempImportarSemetres
      where Exists (Select 1 From Semestre where sem_nombre =SemestreNombre)
end



Insert into Semestre (sem_codigo, sem_nombre)
Select SemestreCodigo,   SemestreNombre
FROM TempImportarSemetres
WHERE NOT Exists (
Select *
From TempImportarSemetres
where Exists (Select 1 From Semestre where sem_codigo =SemestreCodigo)
) AND
NOT Exists (
Select *
From TempImportarSemetres
where Exists (Select 1 From Semestre where sem_nombre =SemestreNombre))


Select 'Se ejecuto satisfactoriamente el sp' as  Resultado
-- Exec paImportarSemestres
GO

