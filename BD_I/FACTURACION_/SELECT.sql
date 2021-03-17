USE FACTURACION_
/* EJERCICIOS DE SELECCIÓN SIMPLE*/
Select * From dbo.marca; /*Selecciona toda la tabla*/
SELECT PAI_CODIGO AS Id, PAI_NOMBRE AS  País FROM PAIS; /*Muestra la columna con el nombre deseado*/
SELECT PAI_CODIGO, PAI_NOMBRE AS  [Nombre País] FROM PAIS; /*Muestra la columna con el nombre deseado con espacio entre corchetes*/

Select * from dbo.facturadetalle; /*Selecciona toda la tabla*/
Select * from dbo.producto; /*Selecciona toda la tabla*/
Select pro_nombre, (pro_precio * 500) as [Valor Mercancia] from dbo.producto; /* Seleccionar columna calculada*/
Select pro_nombre, (pro_precio * 800) as [Valor Mercancia] from dbo.producto Where pro_codigo=1000; /* Seleccionar columna calculada incluye Where*/

Select * from FACTURAENCABEZADO; /*Selecciona toda la tabla*/
Select fac_numero, ven_codigo as [CODIGO VENDEDOR], cli_codigo as [CODIGO CLIENTE], MONTH (fac_fecha) as [Mes Factura] FROM FACTURAENCABEZADO;
select Ven_codigo as [CODIGO VENDEDOR], 'Ha vendido' AS [ ], FAC_TOTAL from FACTURAENCABEZADO;

/* EJERCICIOS DE SELECCIÓN Y AGRUPAMIENTO*/
Select * from PAIS order by Pai_nombre; /* Seleccionar y ordena en la columna PAI_NOMBRE*/
Select * from PAIS order by Pai_nombre DESC; /* Seleccionar y ordena en la columna PAI_NOMBRE en orden descendente*/

Select pro_nombre, (pro_precio * 1000) as [Valor Mercancia] from dbo.producto order by pro_nombre DESC;/*Seleccionar y ordenar en la columna Calculada*/

Select DISTINCT FAC_NUMERO  from FACTURADETALLE; /* Seleccionar datos unicos en el campo FAC_NUMERO, SOLO LOS NUMEROS DE FACTURA, SIN REPETIR*/
Select DISTINCT FAC_NUMERO, PRO_CODIGO  from FACTURADETALLE; /* Seleccionar datos unicos en el campo FAC_NUMERO pero incluyendo PRO_CODIGO*/

Select top 3 Fac_numero, Pro_codigo, fac_total FROM dbo.facturadetalle order by fac_total; /* Seleccionar top 3 de toda la tabla y ordena por fac_total */
Select top 3 WITH TIES *  from dbo.facturadetalle order by fac_total DESC; /* Seleccionar top 3 e incluye valores repetidos */
Select top 5 * from dbo.facturadetalle order by fac_total;
Select top 10 percent * from dbo.facturadetalle order by fac_total; /* Seleccionar top 10% del total de la tabla */


Ejercicio:
--En la tabla CLIENTE muestre solo la columna BAR_CODIGO cambiando el nombre de la columna por CODIGO BARRIO.
Select BAR_CODIGO AS [CODIGO BARRIO] FROM dbo.CLIENTE; 
--En la tabla de PRODUCTO calcule el valor de 8 artículos (PRO_PRECIO * 8) Y muéstrelo en una columna llamada VALOR PEDIDO ordene por nombre.
Select TOP 8 PRO_NOMBRE, (PRO_PRECIO * 8) AS [VALOR PEDIDO] FROM dbo.PRODUCTO ORDER BY PRO_NOMBRE;
--En la tabla FACTURADETALLE muestre solo los numero de factura sin repeticiones, ordene de mayor a menor y muestre también su top 5
Select  DISTINCT top 5  FAC_NUMERO  FROM dbo.FACTURADETALLE ORDER BY FAC_NUMERO DESC;
