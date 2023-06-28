USE FACTURACION_


Select * From dbo.cliente;
Select * From dbo.PRODUCTO;
Select * From dbo.FACTURADETALLE WHERE FAC_NUMERO = 044;
Select * From dbo.FACTURAENCABEZADO WHERE FAC_NUMERO = 044;
Select * From dbo.FORMADEPAGO;
Select * From dbo.VENDEDOR;
Select * From dbo.CLIENTE;
Select * From dbo.CIUDAD;
Select * From dbo.DEPARTAMENTO;
Select * From dbo.PAIS;
Select * From dbo.BARRIO;
select * from dbo.MARCA;



/*COUNT= La función cuenta los valores distintos de NULL que hay en la columna*/
Select count(bar_nombre) from BARRIO; /*Cuenta todos los registros no nulos*/
Select count(DISTINCT CIU_CODIGO) from BARRIO; /*Cuenta todos los registros(valores) unicos sin repeticiones */
Select count(*) from BARRIO where CIU_CODIGO=0004; /*Cuenta todos los registros de la tabla barrio donde el codigo de ciudad es 0004*/
 
 /*MAX= Devuelve el valor máximo de la expresión sin considerar los nulos.*/
 Select max(fac_total) as [Valor Maximo] from FACTURADETALLE; /*Muestra el valor mas alto de las facturas*/
 Select max(fac_cantidad) as [Valor Maximo] from FACTURADETALLE;/*Muestra el valor mas alto de las cantidades*/
 
 /*MIN= Devuelve el valor mínimo de la expresión sin considerar los nulos.*/
 Select min(fac_total) as [Valor Maximo] from FACTURADETALLE; /*Muestra el valor mas bajo de las facturas*/
 Select min(fac_cantidad) as [Valor Maximo] from FACTURADETALLE;/*Muestra el valor mas bajo de las cantidades*/

/*cláusula GROUP BY agrupa los datos de la tabla origen y produce una única fila resultado por cada grupo formado.*/
Select pai_nombre, count(dep_codigo) as [Cantidad Departamentos] from DEPARTAMENTO inner join PAIS on DEPARTAMENTO.PAI_CODIGO=PAIS.PAI_CODIGO group by PAI_NOMBRE;/*Se agrupan los departamentos de cada pais sumandolos*/
/*inner join on siempre va de la fk a pk*/

/*SUM= Devuelve la suma de los valores devueltos por la expresión.*/
select VEN_CODIGO, sum(fac_total) as [Facturación Vendedor] from FACTURAENCABEZADO group by VEN_CODIGO;/* suma los valores de facturas X agrupando por Vendedor*/
select VEN_NOMBRE,VEN_APELLIDO, sum(fac_total) as [Facturación Vendedor]  from FACTURAENCABEZADO inner join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO=VENDEDOR.VEN_CODIGO group by VEN_nombre,VEN_APELLIDO order by  sum(fac_total) DESC ;/* suma los valores de facturas X agrupando por Vendedor y muestra tanto nombre como apellido y ordenar de mayor a menor*/

/*AVG= Devuelve el promedio de los valores de un grupo, para calcular el promedio se omiten los valores nulos.*/
Select avg(fac_impuesto) as [Promedio Impuestos] from FACTURADETALLE; /*Promedio de valor de impuestos*/
Select avg(fac_total) as [Promedio Vendedor ] from FACTURAENCABEZADO where VEN_CODIGO=40;/*Promedio de facturación del vendedor con codigo 40*/

--Ejercicio:

--1-Muestre en Pantalla el menor valor de los numeros de factura.
select min(fac_numero) from FACTURADETALLE
--2-Cuente cuantas productos tiene cada marca.
select MAR_DESCRIPCION, count(PRO_CODIGO) as [CANTIDAD PRODUCTOS]  from PRODUCTO INNER JOIN MARCA ON PRODUCTO.MAR_CODIGO=MARCA.MAR_CODIGO GROUP BY MAR_DESCRIPCION;
select mar_codigo, count(pro_codigo) as [cantidad productos] from producto group by mar_codigo ORDER BY MAR_CODIGO DESC
--3-Sume y la cantidad de la compra de cada cliente y muestre nombre y apellido de cada cual.
select CLI_NOMBRE,CLI_APELLIDO, sum(fac_total) as [CANTIDAD COMPRA] from FACTURAENCABEZADO inner join CLIENTE on FACTURAENCABEZADO.CLI_CODIGO=CLIENTE.CLI_CODIGO group by cli_nombre,CLI_APELLIDO;/* suma los valores de facturas X agrupando por Vendedor y muestra tanto nombre como apellido*/
--4-Muestre el promedio de los impuestos solo de la factura No.044
Select avg(FAC_IMPUESTO) as [PROMEDIO IMPUESTOS ] from FACTURADETALLE where FAC_NUMERO=044;/*Promedio de facturación del vendedor con codigo 40*/

