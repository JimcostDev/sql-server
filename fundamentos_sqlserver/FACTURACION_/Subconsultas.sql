
Select * From dbo.cliente;
Select * From dbo.PRODUCTO;
Select * From dbo.FACTURADETALLE;
Select * From dbo.FACTURAENCABEZADO order by VEN_CODIGO;
Select * From dbo.FORMADEPAGO;
Select * From dbo.VENDEDOR order by BAR_CODIGO;
Select * From dbo.CLIENTE;
Select * From dbo.CIUDAD;
Select * From dbo.DEPARTAMENTO;
Select * From dbo.PAIS;
Select * From dbo.BARRIO;
Select * From dbo.MARCA;

/*Una subconsulta es una consulta que aparece dentro de otra consulta o subconsultas, en la lista de selección o en la cláusula WHERE o HAVING
Una subconsulta puede anidarse en la cláusula WHERE o HAVING de una instrucción externa SELECT, INSERT, UPDATE o DELETE, o bien en otra subconsulta. 
Se puede disponer de hasta 32 niveles de anidamiento, aunque el límite varía dependiendo de la memoria disponible y de la complejidad del resto de las expresiones de la consulta. */

--consultas anidadas(subconsultas)--
--NOTA: ejecutar lo que esta detro de () para entender mejor las subconsultas--
/*Subconsultas con retorno de 1 solo valor*/
select fac_numero, fac_total from FACTURADETALLE where PRO_CODIGO = (select PRO_CODIGO from PRODUCTO where MAR_CODIGO = 127);/*seleccionar fac_numero, fac_total de FACTURADETALLE donde PRO_CODIGO = 1000*/
Select fac_numero, fac_total from FACTURADETALLE where FAC_TOTAL >= (select avg(fac_total) from FACTURADETALLE);/*seleccionar fac_numero, fac_total de FACTURADETALLE donde el promedio de FAC_TOTAL >= 70684.210526*/

/*Subconsultas con retorno de un grupo de valores*/
--IN(Incluyente) me permite utilizar retorno de varios valores(mas de uno)-- 
select ven_codigo, fac_total from FACTURAENCABEZADO where VEN_CODIGO IN (select VEN_CODIGO from VENDEDOR where BAR_CODIGO = 0010);--traigame los vendedores que pertencen al barrio 0010--
select ven_nombre, VEN_APELLIDO, fac_total from FACTURAENCABEZADO inner join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO=VENDEDOR.VEN_CODIGO where VEN_NOMBRE IN (select VEN_NOMBRE from VENDEDOR where BAR_CODIGO = 0010);--traigame los vendedores con su nombre y apellido que pertencen al barrio 0010--
select ven_nombre, VEN_APELLIDO, sum(fac_total) as [facturación total] from FACTURAENCABEZADO inner join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO=VENDEDOR.VEN_CODIGO where VEN_NOMBRE IN (select VEN_NOMBRE from VENDEDOR where BAR_CODIGO = 0010) group by VEN_NOMBRE,VEN_APELLIDO;

select fac_numero,fac_total,VEN_CODIGO from FACTURAENCABEZADO where VEN_CODIGO IN (select VEN_CODIGO from VENDEDOR where VEN_SEXO= 'M');
select FAC_NUMERO,VEN_NOMBRE, VEN_APELLIDO,FAC_TOTAL from FACTURAENCABEZADO inner join VENDEDOR on FACTURAENCABEZADO.VEN_CODIGO=VENDEDOR.VEN_CODIGO where VEN_NOMBRE IN (select VEN_NOMBRE from VENDEDOR where VEN_SEXO= 'M');