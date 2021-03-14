

select C.ciu_codigo, ciu_nombre, [alu_apellidos], [alu_nombres] from ALUMNO A INNER JOIN CIUDAD C ON A.ciu_codigo = C.ciu_codigo  where C.ciu_codigo = '1'
