SELECT grup_codigo, grup_descripcion, G.car_codigo, car_nombre, sem_nombre, jor_nombre
From GRUPO G, CARRERA C, SEMESTRE S, JORNADA J
--Relaciones = Numero de tabla - 1
Where C.car_codigo=G.car_codigo
AND S.sem_codigo=G.sem_codigo
AND J.jor_codigo=G.jor_codigo
