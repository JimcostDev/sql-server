
--insertar pais a traves de pa
EXEC paCrearPais 063, 'Argentina'
SELECT * FROM PAIS

--insertar departamento a traves de pa
EXEC paCrearDepartamento 63, 'Quindio', 169
SELECT * FROM DEPARTAMENTO

--insetar Ciudad a traves de pa
EXEC paCrearCiudad 147, 'Cartago', 76, 169
SELECT * FROM CIUDAD

--insertar Estudiante a traves de pa
EXEC  paCrearEstudiante  1, 'Ronaldo', 'Jimenez Acosta', 'Borrero Ayerbe, Km 30','3219071059','ronaldo.jimenez.0ds@utap.edu.co',
'07/27/1999', 'M', '1','76', '169', '1114736854'
SELECT * FROM ALUMNO