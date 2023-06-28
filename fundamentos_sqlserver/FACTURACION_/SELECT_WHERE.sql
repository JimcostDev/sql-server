use FACTURACION_;

Select * From dbo.cliente;
Select * From dbo.PRODUCTO;
Select * From dbo.FACTURADETALLE;
Select * From dbo.FACTURAENCABEZADO;
Select * From dbo.VENDEDOR;
Select * From dbo.CLIENTE;
Select * From dbo.CIUDAD;
Select * From dbo.DEPARTAMENTO;
Select * From dbo.PAIS;
Select * From dbo.BARRIO;

/*Seleccion simple con WHERE */
/* Seleccion del numero de factura, codigo de cliente y valor total filtrando por el codigo de vendedor*/
Select Fac_numero as [Numero Factura], Cli_codigo as [Codigo Cliente], FAC_TOTAL as [Total Factura] from FACTURAENCABEZADO where VEN_CODIGO = 40;

/* Seleccion del numero de factura, unidades y valor total filtrando por el codigo de producto*/
Select fac_numero as [Numero Factura], fac_cantidad as Unidades, fac_total as [Total Factura] from FACTURADETALLE where PRO_CODIGO = 1000;

/*COMPARACIONES SIMPLES: compara un valor menor y muestra todo lo que cumpla esa condición*/
Select fac_numero as [Numero Factura], fac_total as [Total Factura] from FACTURADETALLE where FAC_DESCUENTO > 13000;
Select fac_numero as [Numero Factura], fac_total as [Total Factura], FAC_DESCUENTO from FACTURADETALLE where FAC_DESCUENTO > 16000;

/*COMPARACIONES SIMPLES: compara una fecha y muestra todo lo que cumpla esa condición*/
Select Cli_codigo as [Codigo Cliente], fac_impuesto as [Valor Impuesto] from FACTURAENCABEZADO where FAC_FECHA < '10/10/2013';
Select Cli_codigo as [Codigo Cliente], fac_impuesto as [Valor Impuesto], FAC_FECHA from FACTURAENCABEZADO where day (FAC_FECHA) > '10';

/*BETWEEN (Entre): se  usa para intervalos (RANGO)*/
select pro_codigo as [Codigo Producto], fac_precio as [Precio Unidad] from FACTURADETALLE where fac_precio between 4000 and 10000;
select pro_codigo as [Codigo Producto], fac_precio as [Precio Unidad] from FACTURADETALLE where fac_precio between 20000 and 25000;

/*IN (EN o Incluido): se  usa para examinar pertenencia*/
select ven_codigo as [Codigo Vendedor], Ven_nombre as Nombre, Ven_apellido as [Apellido], BAR_CODIGO as [Codigo Barrio] from VENDEDOR where BAR_CODIGO IN (9,14);
select ven_codigo as [Codigo Vendedor], Ven_nombre as Nombre, Ven_apellido as [Apellido], BAR_CODIGO as [Codigo Barrio] from VENDEDOR where BAR_CODIGO IN (3,10);

/* IS NULL / IS NOT NULL (Valor Nulo)*/
Select Pro_nombre as [Nombre Producto] from PRODUCTO where MAR_CODIGO IS NOT NULL;

/* LIKE (Buscar)*/
select pai_nombre as [Nombre País] from PAIS where PAI_NOMBRE like '%gua%';


--1-Mostrar solo las departamentos cuyo Pais relacionado sea 03 y 18
select DEP_NOMBRE as [Nombre Departamento], PAI_CODIGO AS [Codigo País] from DEPARTAMENTO WHERE PAI_CODIGO IN (3,18);
--2-Mostrar solo clientes cuyo apellido contenga ia
select CLI_NOMBRE as [NOMBRE ],CLI_APELLIDO as [APELLIDO] from CLIENTE where CLI_APELLIDO like '%ia%';
--3-Mostrar Numero Factura, codigo de producto y valor facturado de las ventas cuyo impuesto este entre 4000 y 9000
select FAC_NUMERO as [N° Factura], PRO_CODIGO as [Codigo Producto], FAC_TOTAL as [Valor facturado] from FACTURADETALLE where FAC_IMPUESTO between 4000 and 9000;
--4-ubicar solo las ventas efectuadas el dia 06, mostrar codigo de vendedor y cliente y valor facturado
select ven_codigo as [codigo vendedor], cli_codigo as [codigo cliente],fac_fecha, FAC_TOTAL  from FACTURAENCABEZADO where day(fac_fecha) = 6;