USE FACTURACION_
--1
SELECT * FROM DEPARTAMENTO
Select PAI_CODIGO, count(DEP_CODIGO) NumeroDepartamentos from DEPARTAMENTO group by (PAI_CODIGO) having PAI_CODIGO = 18 ;

--2
select mar_codigo, count(pro_codigo)as [cantidad productos] , avg(pro_precio) as [promedio precios] from producto group by mar_codigo ORDER BY count(pro_codigo) DESC

--3
SELECT * FROM FACTURAENCABEZADO
Select cli_nombre As Nombre_Cliente, cli_apellido as Apellido_Cliente, sum(fac_impuesto) as Impuestos,sum(fac_descuento)as Descuentos,avg(fac_total) as TotalFactura from FACTURAENCABEZADO inner Join CLIENTE on FACTURAENCABEZADO.CLI_CODIGO = CLIENTE.CLI_CODIGO group by cli_nombre, cli_apellido having avg(fac_total) > 70000 