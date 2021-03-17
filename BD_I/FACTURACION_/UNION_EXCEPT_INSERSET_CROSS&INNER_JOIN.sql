
/*La union de tablas UNION
La unión de tablas consiste en coger dos tablas y obtener una tabla con las filas 
de las dos tablas, en el resultado aparecerán las filas de una tabla y, a continuación, 
las filas de la otra tabla. Para poder realizar la operación, las dos tablas tienen que tener el mismo 
esquema (mismo número de columnas y tipos compatibles) y la tabla resultante hereda los encabezados de la primera tabla.*/

--La unión de tablas UNION
Select ciu_nombre [Nombre Ciudad] from CIUDAD union select dep_nombre [Nombre Departamento] from DEPARTAMENTO;
select ven_codigo [Codigo], ven_apellido [Apellido] from VENDEDOR union select cli_codigo, cli_apellido from CLIENTE order by Apellido;

/*La diferencia EXCEPT
Aparecen en la tabla resultante las filas de la primera consulta que no aparecen en la segunda.
Las condiciones son las mismas que las de la unión.*/

/*La diferencia EXCEPT*/
select fac_numero from FACTURAENCABEZADO except select fac_numero from FACTURADETALLE;
 
/* La intersección INTERSECT (LO CONTRARIO A EXCEPT)
Tiene una sintaxis parecida a las anteriores pero en el resultado de la intersección aparecen las filas que están simultáneamente en las dos consultas.
Las condiciones son las mismas que las de la unión.*/
/*La intersección INTERSECT*/
select fac_numero from FACTURAENCABEZADO intersect select fac_numero from FACTURADETALLE;

/*El producto cartesiano CROSS JOIN
El producto cartesiano obtiene todas las posibles concatenaciones de filas de la primera tabla con filas de la segunda tabla.
Se indica escribiendo en la cláusula FROM los nombres de las tablas separados por una coma o utilizando el operador CROSS JOIN.*/
/*El producto cartesiano CROSS JOIN*/
select * from PAIS, DEPARTAMENTO;
select * from DEPARTAMENTO CROSS JOIN CIUDAD;
Select ven_codigo, VEN_IDENTIFICACION, cli_codigo, CLI_IDENTIFICACION from VENDEDOR cross join CLIENTE;

/*La composición interna INNER JOIN
Una composición interna es aquella en la que los valores de las columnas que se están combinando se 
comparan mediante un operador de comparación.
Es otra forma, mejor, de expresar un producto cartesiano con una condición.
Es la operación que más emplearemos ya que lo más frecuente es querer juntar 
los registros de una tabla relacionada con los registros correspondientes en la 
tabla de referencia (añadir a cada factura los datos de su cliente, añadir a 
cada línea de pedido los datos de su producto, etc..,).*/
/*La composición interna INNER JOIN*/
select * from PRODUCTO INNER JOIN MARCA on PRODUCTO.MAR_CODIGO=MARCA.MAR_CODIGO;
select fac_numero, fac_fecha, fac_total, for_nombre from FACTURAENCABEZADO INNER JOIN FORMADEPAGO on FACTURAENCABEZADO.FOR_CODIGO=FORMADEPAGO.FOR_CODIGO;
select fac_numero, fac_fecha, ven_nombre, ven_apellido, fac_total from FACTURAENCABEZADO INNER JOIN VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO order by FAC_TOTAL;

--1-Mostrar la unión de las tablas PAIS, CIUDAD, DEPARTAMENTO.
Select PAI_NOMBRE [Nombre país] from PAIS union select dep_nombre [Nombre Departamento] from DEPARTAMENTO union select ciu_nombre [Nombre ciudad] from CIUDAD;

--2-Mostrar la unión de los campos Nombre de Barrio, nombre de cliente y nombre de vendedor

--3-Mostrar los números de factura con su cliente asociado.
select fac_numero, CLI_NOMBRE, CLI_APELLIDO from FACTURAENCABEZADO INNER JOIN CLIENTE on FACTURAENCABEZADO.CLI_CODIGO=CLIENTE.CLI_CODIGO;
--4-mostrar los numero de factura con su nombre de producto y precio de producto asociado
select fac_numero, pro_nombre, pro_precio from FACTURADETALLE INNER JOIN PRODUCTO on FACTURADETALLE.PRO_CODIGO=PRODUCTO.PRO_CODIGO;

