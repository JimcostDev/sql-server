USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paImportarMatriculaAcademica]    Script Date: 13/03/2021 21:06:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[paImportarMatriculaAcademica]
AS
--exec paImportarMatriculaAcademica

--VALIDAR QUE ALUMNO  EXISTA POR SU ID
if  exists (select 1 from TempImportarMatriculaAcademica t where
			  not exists (select 1 from ALUMNO where alu_codigo = t.EstudianteCodigo))
begin
	select 'Error codigo de alumno no existe ' + EstudianteCodigo AS RESULTADO from TempImportarMatriculaAcademica t where
			not exists (select 1 from ALUMNO where alu_codigo = t.EstudianteCodigo)
			return
end
--VALIDAR QUE Periodo  EXISTA POR SU ID
if  exists (select 1 from TempImportarMatriculaAcademica t where
			not exists (select 1 from Periodo where per_codigo = t.periodoCodigo))
begin
	select 'Error Codigo de periodo no existe ' + periodoCodigo AS RESULTADO from TempImportarMatriculaAcademica t where
			not exists (select 1 from Periodo where per_codigo = t.periodoCodigo)
			return
end
--VALIDAR QUE GRUPO  EXISTA POR SU DESCRIPCIÓN
if  exists (select 1 from TempImportarMatriculaAcademica t where
			not exists (select 1 from GRUPO where grup_codigo = t.GrupoCodigo))
begin
	select 'Error codigo de grupo no existe ' + GrupoCodigo AS RESULTADO from TempImportarMatriculaAcademica t where
			not exists (select 1 from GRUPO where grup_codigo = t.GrupoCodigo)
			return
end

--VALIDAR QUE MatriculaAcademica NO EXISTA POR SU ID
if  exists (select 1 from TempImportarMatriculaAcademica t where
			 exists (select 1 from MatriculaAcademica where mat_codigo = t.matriculaCodigo))
begin
	select 'Error Grupo ya existe ' + matriculaCodigo AS RESULTADO from TempImportarMatriculaAcademica t where
			 exists (select 1 from MatriculaAcademica where mat_codigo = t.matriculaCodigo)
			return
end
--INSERTAR MATRICULA_ACADEMICA
insert into MatriculaAcademica([mat_codigo], [alu_codigo], [per_codigo], [grup_codigo], [mat_fecha])
select [matriculaCodigo], [EstudianteCodigo], [periodoCodigo], [GrupoCodigo], [FechaMatricula]
FROM TempImportarMatriculaAcademica t
WHERE NOT Exists (
Select *
From TempImportarMatriculaAcademica 
where Exists (select 1 from MatriculaAcademica where mat_codigo = t.matriculaCodigo)
) AND
NOT Exists (
Select *
From TempImportarMatriculaAcademica 
where Exists (select 1 from MatriculaAcademica where mat_codigo = t.matriculaCodigo))
GO

