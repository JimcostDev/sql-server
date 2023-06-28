USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paImportarAlumnos]    Script Date: 13/03/2021 21:05:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[paImportarAlumnos]
AS
--exec paImportarAlumnos

--VALIDAR QUE EXISTA CIUDAD
if   exists (select 1 from TempImportAlumnos t where
			not exists (select 1 from CIUDAD where  ciu_nombre = t.Ciudad))
begin
	select 'CIUDAD NO EXISTE: ' + Ciudad AS RESULTADO from TempImportAlumnos t where
			 not exists (select 1 from CIUDAD where  ciu_nombre = t.Ciudad)
			return
end
--VALIDAR QUE EXISTA DEPARTAMENTO
if  exists (select 1 from TempImportAlumnos t where
			 NOT exists (select 1 from DEPARTAMENTO where dep_nombre = t.Departamento))
begin
	select 'DEPARTAMENTO NO EXISTE: ' + Departamento AS RESULTADO from TempImportAlumnos t where
			 NOT exists (select 1 from DEPARTAMENTO where dep_nombre = t.Departamento)
			return
end
--VALIDAR QUE PAIS EXISTA
if  exists (select 1 from TempImportAlumnos t where
			 not exists (select 1 from PAIS where pai_nombre = t.Pais))
begin
	select 'PAIS NO EXISTE: ' + Pais AS RESULTADO from TempImportAlumnos t where
			not exists (select 1 from PAIS where pai_nombre = t.Pais)
			return
end
--VALIDAR QUE CEDULA NO SE REPITA
if   exists (select 1 from TempImportAlumnos t where
			  exists (select 1 from ALUMNO where alu_dni = t.cedula))
begin
	select 'CEDULA EXISTE: ' + cedula AS RESULTADO from TempImportAlumnos t where
			 exists (select 1 from ALUMNO where alu_dni = t.cedula)
			return
end


--VALIDAR QUE NO EXISTA PERSONA POR SU ID
if   exists (select 1 from TempImportAlumnos t where
			  exists (select 1 from ALUMNO where alu_codigo = t.Codigo))
begin
	select 'CODIGO EXISTE: ' + Codigo AS RESULTADO from TempImportAlumnos t where
			 exists (select 1 from ALUMNO where alu_codigo = t.Codigo)
			return
end
--PARA INSETAR ALUMNOS,  DEBO HACERLO POR SUS CODIGOS Y NO POR DESCRIPCION
--POR ELLO IMPLEMENTAMOS UNA CONSULTA ANTES DE HACER EL INSERT
insert into ALUMNO([alu_codigo], [alu_nombres], [alu_apellidos], [alu_direccion],[alu_telefono], [alu_email], [alu_fechaNacimiento], [alu_sexo], [ciu_codigo], [dep_codigo], [pai_codigo], [alu_dni])
select Codigo, nombres, apellidos, direccion, telefono, email, fechaNacimiento, sexo, Ciudad, Departamento, Pais, cedula

from TempImportAlumnos t, CIUDAD, DEPARTAMENTO, PAIS-- tablas
WHERE t.Ciudad = ciu_nombre --campos
AND t.Departamento = dep_nombre
AND  t.Pais = pai_nombre
--exec paImportarAlumnos
GO

