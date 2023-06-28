CREATE DATABASE ESCUELA_FUTBOL
USE ESCUELA_FUTBOL
--CREAR TABLA PROFESOR--
CREATE TABLE PROFESOR(
	proCodigo CHAR (4) NOT NULL,
	proNomnbre VARCHAR (30) NOT NULL,
   	proApellido VARCHAR (30)  NOT NULL,
   	proEdad INT  NOT NULL,
	proProfesion  VARCHAR (30)  NOT NULL,
   	CONSTRAINT PK_PROFESOR PRIMARY KEY (proCodigo),--PK
	)
CREATE TABLE DEPORTISTA(
	depCodigo CHAR (4) NOT NULL,
	depNomnbre VARCHAR (30) NOT NULL,
   	depApellido VARCHAR (30)  NOT NULL,
	depResidencia VARCHAR (30)  NOT NULL,
   	depEdad INT  NOT NULL,
	depPosicion VARCHAR (30)  NOT NULL,
   	CONSTRAINT PK_DEPORTISTA PRIMARY KEY (depCodigo),--PK
	)

--AÑADIR CAMPO proCodigo --
ALTER TABLE DEPORTISTA ADD proCodigo CHAR (4) NOT NULL;
--CREAR FK ENTRE PROFESOR Y DEPORTISTA--
ALTER TABLE DEPORTISTA ADD CONSTRAINT FK_PROFESOR_DEPORTISTA FOREIGN KEY (proCodigo) REFERENCES PROFESOR (proCodigo);

--REGISTROS PROFESOR--
INSERT INTO PROFESOR(proCodigo,proNomnbre,proApellido,proEdad, proProfesion)
SELECT '0001','Carlos','Angulo', 35, 'Deportologo' UNION ALL
SELECT '0002','Juan Camilo','Marin', 38, 'Terapeuta' UNION ALL
SELECT '0003','Andrea','Jaramillo', 30, 'Preparadora Fisica'

 --REGISTROS DEPORTISTA--
 INSERT INTO DEPORTISTA(depCodigo,depNomnbre,depApellido,depResidencia,depEdad,depPosicion, proCodigo)
SELECT '1001','Andres','Perafan', 'Jamundi', 10 ,'delantero', '0002' UNION ALL
SELECT '1002','Javier','Giraldo', 'Tulua', 13 ,'delantero', '0002' UNION ALL
SELECT '1003','Antonio','Viafara', 'Cali', 13 ,'arquero', '0003' UNION ALL
SELECT '1004','Jair','Valoyes', 'Cali', 12 ,'defensa', '0001' UNION ALL
SELECT '1005','Ivan','Acevedo', 'Palmira', 11 ,'Medio Campista', '0001' 

--SELECIONAR LOS DEPORTISTAS QUE PERTENECEN AL GRUPO DEL PROFESOR Carlos Angulo--
SELECT depNomnbre, depApellido, depPosicion, proNomnbre, proApellido
FROM  PROFESOR,DEPORTISTA
WHERE  DEPORTISTA.proCodigo = PROFESOR.proCodigo 
AND proCodigo = '0001'