select P.pai_codigo as 'CODIGO PAIS', 
pai_nombre AS 'NOMBRE PAIS', 
dep_nombre AS 'NOMBRE DEPARTAMENTO', 
ciu_nombre AS 'NOMBRE CIUDAD', 
alu_nombres 'NOMBRE ESTUDIANTE', 
alu_apellidos AS 'APELLIDO ESTUDIANTE'

from PAIS P, DEPARTAMENTO D, CIUDAD C, ALUMNO A
Where 
--NOTA: #TABLAS - 1 = #RELACIONES (como minimo)

--relacion entre pais y departamento
P.pai_codigo=D.pai_codigo AND 

--relacion entre Pais - departamento - ciudad
D.dep_codigo=C.dep_codigo AND D.pai_codigo = C.pai_codigo AND

--relacion entre Pais - Departamento - ciudad - alumno
C.ciu_codigo = A.ciu_codigo AND C.dep_codigo = A.dep_codigo AND C.pai_codigo = A.pai_codigo
