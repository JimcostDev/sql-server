ALTER PROCEDURE paImportarGrupos
AS
--exec paImportarGrupos

--VALIDAR QUE CARRERA  EXISTA POR SU DESCRIPCIÓN
if  exists (select 1 from TempImportarGrupo t where
			not exists (select 1 from CARRERA where car_nombre = t.Carrera))
begin
	select 'Error carrera no existe ' + CARRERA AS RESULTADO from TempImportarGrupo t where
			not exists (select 1 from CARRERA where car_nombre = t.Carrera)
			return
end
--VALIDAR QUE JORNADA  EXISTA POR SU DESCRIPCIÓN
if  exists (select 1 from TempImportarGrupo t where
			not exists (select 1 from JORNADA where jor_nombre = t.Jornada))
begin
	select 'Error Jornada no existe ' + JORNADA AS RESULTADO from TempImportarGrupo t where
			not exists (select 1 from JORNADA where jor_nombre = t.Jornada)
			return
end
--VALIDAR QUE SEMESTRE  EXISTA POR SU DESCRIPCIÓN
if  exists (select 1 from TempImportarGrupo t where
			not exists (select 1 from SEMESTRE where sem_nombre = t.Semestre))
begin
	select 'Error Semestre no existe ' + SEMESTRE AS RESULTADO from TempImportarGrupo t where
			not exists (select 1 from SEMESTRE where sem_nombre = t.Semestre)
			return
end
--VALIDAR QUE GRUPO NO EXISTA POR SU ID
if  exists (select 1 from TempImportarGrupo t where
			 exists (select 1 from GRUPO where grup_codigo = t.CodigoGrupo))
begin
	select 'Error Grupo ya existe ' + CodigoGrupo AS RESULTADO from TempImportarGrupo t where
			 exists (select 1 from GRUPO where grup_codigo = t.CodigoGrupo)
			return
end
--PARA INSETAR LOS GRUPOS,  DEBO HACERLO POR SUS CODIGOS Y NO POR DESCRIPCION
--POR ELLO IMPLEMENTAMOS UNA CONSULTA ANTES DE HACER EL INSERT
insert into Grupo([grup_codigo],[jor_codigo],[sem_codigo],[car_codigo],[grup_descripcion])
select CodigoGrupo, jor_codigo,  sem_codigo, car_codigo, NombreGrupo
from TempImportarGrupo t, JORNADA, SEMESTRE, CARRERA-- tablas
WHERE t.Jornada = jor_nombre --campos
AND t.Semestre = sem_nombre
AND  t.Carrera = car_nombre
