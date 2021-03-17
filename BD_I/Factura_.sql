CREATE DATABASE FACTURA_
USE FACTURA_

CREATE TABLE Pais(
pai_codigo CHAR (3) NOT NULL,
pai_nombre CHAR (30) NOT NULL
CONSTRAINT PK_PAIS PRIMARY KEY (pai_codigo),--PK
)

CREATE TABLE Departamento(
dep_codigo CHAR (6) NOT NULL,
dep_nombre CHAR (40) NOT NULL,
pai_codigo CHAR (3) NOT NULL,
CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (dep_codigo),--PK
)

--CREAR FK ENTRE Pais Y Departamento--
ALTER TABLE Departamento ADD CONSTRAINT FK_PAIS_DEPARTAMENTO FOREIGN KEY (pai_codigo) REFERENCES Pais (pai_codigo);

CREATE TABLE Ciudad (
cui_codigo CHAR (9) NOT NULL,
ciu_nombre CHAR (40) NOT NULL,
dep_codigo CHAR (6) NOT NULL,
CONSTRAINT PK_CIUDAD PRIMARY KEY (cui_codigo),--PK
)
--CREAR FK ENTRE Departamento Y Ciudad--
ALTER TABLE Ciudad ADD CONSTRAINT FK_DEPARTAMENTO_CIUDAD FOREIGN KEY (dep_codigo) REFERENCES Departamento (dep_codigo);

CREATE TABLE Barrio (
bar_codigo CHAR (12) NOT NULL,
bar_nombre CHAR (40) NOT NULL,
cui_codigo CHAR (9) NOT NULL,
CONSTRAINT PK_BARRIO PRIMARY KEY (bar_codigo),--PK
)
--CREAR FK ENTRE  Ciudad Y Barrio--
ALTER TABLE Barrio ADD CONSTRAINT FK_CIUDAD_BARRIO FOREIGN KEY (cui_codigo) REFERENCES Ciudad (cui_codigo);

CREATE TABLE Cliente (
cli_codigo CHAR (10) NOT NULL,
cli_identificacion CHAR (20),
cli_nombre CHAR (30),
cli_apellido CHAR (30),
cli_direccion VARCHAR (120),
cli_telefono VARCHAR (20),
cli_celular VARCHAR (20),
cli_email VARCHAR (120),
cli_sexo CHAR (1),
bar_codigo CHAR (12), 
tip_codigo CHAR (3),
CONSTRAINT PK_CLIENTE PRIMARY KEY (cli_codigo),--PK
)

CREATE TABLE TipoIdentificacion(
tip_codigo CHAR (3) NOT NULL,
tip_nombre CHAR (20) NOT NULL,
)
--CREAR LA PK DE LA TABLA TipoIdentificacion--
ALTER TABLE TipoIdentificacion ADD CONSTRAINT PK_DOCUMENTO PRIMARY KEY (tip_codigo)

--CREAR FK ENTRE  Barrio y Cliente--
ALTER TABLE Cliente ADD CONSTRAINT FK_BARRIO_CLIENTE FOREIGN KEY (bar_codigo) REFERENCES Barrio (bar_codigo);
--CREAR FK ENTRE  Cliente y TipoIdentificacion--
ALTER TABLE Cliente ADD CONSTRAINT FK_DOCUMENTO_CLIENTE FOREIGN KEY (tip_codigo) REFERENCES TipoIdentificacion (tip_codigo);

CREATE TABLE Vendedor (
ven_codigo CHAR (10) NOT NULL,
ven_identificacion CHAR (20) NOT NULL,
ven_nombre CHAR (30) NOT NULL,
ven_apellido CHAR (30) NOT NULL,
ven_direccion VARCHAR (120)NOT NULL,
ven_telefono VARCHAR (20)NOT NULL,
ven_celular VARCHAR (20)NOT NULL,
ven_email VARCHAR (120)NOT NULL,
ven_sexo CHAR (1)NOT NULL,
bar_codigo CHAR (12)NOT NULL, 
tip_codigo CHAR (3)NOT NULL,
CONSTRAINT PK_VENDEDOR PRIMARY KEY (ven_codigo),--PK
)
--CREAR FK ENTRE  Barrio y Vendedor --
ALTER TABLE Vendedor ADD CONSTRAINT FK_BARRIO_VENDEDOR FOREIGN KEY (bar_codigo) REFERENCES Barrio (bar_codigo);
--CREAR FK ENTRE  Vendedor y TipoIdentificacion--
ALTER TABLE Vendedor ADD CONSTRAINT FK_DOCUMENTO_VENDEDOR FOREIGN KEY (tip_codigo) REFERENCES TipoIdentificacion (tip_codigo);

CREATE TABLE FormaPago(
for_codigo CHAR (3) NOT NULL,
for_nombre CHAR (30) NOT NULL,
CONSTRAINT PK_FORMA_DE_PAGO PRIMARY KEY (for_codigo),--PK
)

CREATE TABLE FacturaEncabezado (
fac_numero CHAR (10) NOT NULL,
fac_fecha DATETIME,
ven_codigo CHAR (10) NOT NULL,
cli_codigo CHAR (10) NOT NULL,
fac_subtotal DECIMAL(18,2) NOT NULL,
fac_descuento DECIMAL(18,2) NOT NULL,
fac_impuesto DECIMAL(18,2) NOT NULL,
fac_total DECIMAL(18,2) NOT NULL,
for_codigo CHAR (3) NOT NULL,
CONSTRAINT PK_FACTURA_ENCABEZADO PRIMARY KEY (fac_numero),--PK
)

--CREAR FK ENTRE  Cliente y FacturaEncabezado --
ALTER TABLE FacturaEncabezado ADD CONSTRAINT FK_CLIENTE_FACTURA_ENCABEZADO FOREIGN KEY (cli_codigo) REFERENCES Cliente (cli_codigo);
--CREAR FK ENTRE  Vendedor  y FacturaEncabezado--
ALTER TABLE FacturaEncabezado ADD CONSTRAINT FK_VENDEDOR_FACTURA_ENCABEZADO FOREIGN KEY (ven_codigo) REFERENCES Vendedor (ven_codigo);
--CREAR FK ENTRE FormaPago   y FacturaEncabezado--
ALTER TABLE FacturaEncabezado ADD CONSTRAINT FK_FORMA_DE_PAGO_FACTURA_ENCABEZADO FOREIGN KEY (for_codigo) REFERENCES FormaPago (for_codigo);

CREATE TABLE FacturaDetalle (
facd_numero CHAR(10) NOT NULL,
pro_codigo CHAR(10) NOT NULL,
facd_cantidad INT,
facd_precio DECIMAL(18,2) NOT NULL, 
facd_subtotal DECIMAL(18,2) NOT NULL,
facd_descuento DECIMAL(18,2) NOT NULL,
facd_impuesto DECIMAL(18,2) NOT NULL,
facd_total DECIMAL(18,2) NOT NULL,
CONSTRAINT PK_FACTURA_DEATALLE PRIMARY KEY (facd_numero),--PK
)
--CREAR FK ENTRE  FacturaDetalle y Producto--
ALTER TABLE FacturaDetalle ADD CONSTRAINT FK_FACTURA_DETALLE_PRODUCTO FOREIGN KEY (pro_codigo) REFERENCES Producto (pro_codigo);

CREATE TABLE Producto(
pro_codigo CHAR (10) NOT NULL,
pro_nombre CHAR (40) NOT NULL,
pro_precio DECIMAL(18,2) NOT NULL,
mar_codigo CHAR (3) NOT NULL
CONSTRAINT PK_PRODUCTO PRIMARY KEY (pro_codigo),--PK
)

--CREAR FK ENTRE  Marca y Producto--
ALTER TABLE Producto ADD CONSTRAINT FK_MARCAPRODUCTO FOREIGN KEY (mar_codigo) REFERENCES Marca (mar_codigo);

CREATE TABLE Marca(
mar_codigo CHAR (3) NOT NULL,
mar_descripcion CHAR (30) NOT NULL
CONSTRAINT PK_MARCA PRIMARY KEY (mar_codigo),--PK
)