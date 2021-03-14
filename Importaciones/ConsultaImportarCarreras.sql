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