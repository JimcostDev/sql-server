SELECT * FROM CIUDAD
SELECT * FROM CIUDAD_ESPEJO

INSERT INTO CIUDAD ([ciu_codigo],[ciu_nombre],[dep_codigo],[pai_codigo])
SELECT '8', 'Restrepo', '76', '169'

DELETE FROM CIUDAD WHERE ciu_codigo = '5'

UPDATE CIUDAD SET ciu_nombre = 'Cali' WHERE ciu_codigo = '1'