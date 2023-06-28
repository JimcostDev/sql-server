use FACTURACION_;

Select * From dbo.cliente;
Select * From dbo.PRODUCTO;
Select * From dbo.FACTURADETALLE;
Select * From dbo.FACTURAENCABEZADO order by VEN_CODIGO;
Select * From dbo.FORMADEPAGO;
Select * From dbo.VENDEDOR;
Select * From dbo.CLIENTE;
Select * From dbo.CIUDAD;
Select * From dbo.DEPARTAMENTO;
Select * From dbo.PAIS;
Select * From dbo.BARRIO;

/*la cláusula HAVING: HAVING funciona igual que la cláusula WHERE pero en vez de actuar sobre las filas del origen de datos, 
actúa sobre las filas del resultado, selecciona grupos de filas por lo que la condición de búsqueda sufrirá alguna limitación*/

Select CIU_CODIGO, count(BAR_CODIGO) NumerodeBarrios from BARRIO group by (CIU_CODIGO) having count(BAR_CODIGO) >= 3; /*Muestra las cantidad de barrios por cada codigo de ciudad donde la cantidad sea igual o mayor que 3*/
Select DEP_CODIGO, count(ciu_codigo) as NumerodeCiudades from CIUDAD group by (DEP_CODIGO) having count(CIU_CODIGO) <=2; /*Muestra las cantidad de Ciudades por cada codigo de Departamento donde la cantidad sea igual o menor que 2*/

Select ven_codigo, sum(fac_total) as ValorVentas from FACTURAENCABEZADO group by (VEN_CODIGO) order by (ValorVentas) desc; 
Select ven_codigo, sum(fac_total) as ValorVentas from FACTURAENCABEZADO group by (VEN_CODIGO) having sum(FAC_TOTAL) between 150000 and 500000 order by (ValorVentas) desc;

Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, fac_fecha as FechadeVentas from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO,FAC_FECHA;
Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, count(VEN_NOMBRE) as CantidaddeVentas from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO order by CantidaddeVentas desc;
Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, count(VEN_NOMBRE) as CantidaddeVentas from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO having count(VEN_NOMBRE) < 3 order by CantidaddeVentas desc;
Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, max(fac_fecha) as VentamasReciente from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO; 
Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, max(fac_fecha) as VentamasReciente from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO having max(fac_fecha) <= '10/15/2013' order by VentamasReciente desc;
Select Ven_nombre As Nombre_Vendedor, ven_apellido as Apellido_Vendedor, max(fac_fecha) as VentamasReciente from FACTURAENCABEZADO inner Join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO = VENDEDOR.VEN_CODIGO group by VEN_NOMBRE, VEN_APELLIDO having max(fac_fecha) > '10/15/2013'order by VentamasReciente desc;

--Ejercicios:
--1- Muestre los Nombres de paises que tengan 2 o mas departamentos asociados
Select PAI_NOMBRE as NombrePais, count(DEP_CODIGO) as NumerodeDepartamentos from DEPARTAMENTO INNER JOIN PAIS ON DEPARTAMENTO.PAI_CODIGO=PAIS.PAI_CODIGO  GROUP BY PAI_NOMBRE HAVING count(DEP_CODIGO) > 2                              

--2- Muestre los clientes (Nombre y Apellido) que tengan un total de descuento inferior o igual a 5000
select [CLI_NOMBRE] as Nombre,[CLI_APELLIDO] as Apellido, sum(fac_descuento) as TotalDescuento from FACTURAENCABEZADO inner join CLIENTE ON FACTURAENCABEZADO.CLI_CODIGO=CLIENTE.CLI_CODIGO GROUP BY [CLI_NOMBRE],[CLI_APELLIDO] HAVING sum(fac_descuento) <= 5000

--3- Muestra las fechas mas antiguas de compra X cada cliente (Nombre y Apellido) solo para aquellos despues del 15/10/2013
Select cli_nombre As Nombre_Cliente, cli_apellido as Apellido_Cliente, min(fac_fecha) as VentaMasAntiguas from FACTURAENCABEZADO inner Join CLIENTE on FACTURAENCABEZADO.CLI_CODIGO = CLIENTE.CLI_CODIGO group by CLI_NOMBRE, CLI_APELLIDO having min(fac_fecha) > '10/15/2013'order by VentaMasAntiguas

--4- Muestre los Vendedores cuyo promedio de ventas sea mayor que 100000
SELECT VEN_NOMBRE AS Nombre,VEN_APELLIDO AS Apellido, AVG(FAC_TOTAL) AS PromedioVentas FROM FACTURAENCABEZADO INNER JOIN VENDEDOR ON FACTURAENCABEZADO.VEN_CODIGO=VENDEDOR.VEN_CODIGO GROUP BY VEN_NOMBRE,VEN_APELLIDO  HAVING  AVG(FAC_TOTAL)  > 100000 

--5- Muestre la cantidad total vendida de cada producto (Nombre) y tambien los que se hayan vendido en 5 o mas cantidad
select pro_nombre as NombreProducto, sum(fac_total) AS CantidadVendida, sum(FAC_CANTIDAD) as TotalCantidad from FACTURADETALLE INNER JOIN PRODUCTO ON FACTURADETALLE.PRO_CODIGO=PRODUCTO.PRO_CODIGO GROUP BY PRO_NOMBRE Having sum(FAC_CANTIDAD) > 5 order by TotalCantidad desc
