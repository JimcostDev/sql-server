USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paImportarCarreras]    Script Date: 13/03/2021 21:05:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create  procedure [dbo].[paImportarCarreras]
as


IF  Exists (
Select *
From [TempImportarCarreras]
where Exists (Select 1 From Carrera where Car_Codigo =[CodigoCarrera])
)
begin
Select 'El Codigo de la carrera existe '  + CodigoCarrera   As resultado
From [TempImportarCarreras]
where Exists (Select 1 From Carrera where Car_Codigo =[CodigoCarrera])
Return
end

if Exists ( Select *
From [TempImportarCarreras]
where Exists (Select 1 From Carrera where Car_nombre =nombreCarrera))
begin
Select 'El nombre  de la carrera existe '  + NombreCarrera  As resultado
From [TempImportarCarreras]
      where Exists (Select 1 From Carrera where Car_nombre =nombreCarrera)
end

-- Exec Pa_ImportarCarreras

Insert into Carrera (car_codigo, Car_nombre)
Select [CodigoCarrera],   nombreCarrera
FROM [TempImportarCarreras]
WHERE NOT Exists (
Select *
From [TempImportarCarreras]
where Exists (Select 1 From Carrera where Car_Codigo =[CodigoCarrera])
) AND
NOT Exists (
Select *
From [TempImportarCarreras]
where Exists (Select 1 From Carrera where Car_nombre =nombreCarrera))


Select 'Se ejecuto satisfactoriamente el sp' as  Resultado
-- Exec Pa_ImportarCarreras
GO

