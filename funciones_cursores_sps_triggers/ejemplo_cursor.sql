-- recorrer las filas de la tabla Team e imprimir el nombre de cada equipo junto 
-- con el nombre de su liga correspondiente:
USE [Test]
-- Declarar variables
DECLARE @TeamID INT
DECLARE @TeamName NVARCHAR(50)
DECLARE @LeagueID INT
DECLARE @LeagueName NVARCHAR(50)

-- Crear el cursor
DECLARE teamCursor CURSOR FOR
SELECT ID, Name, LeagueID
FROM Test.dbo.Team

-- Abrir el cursor
OPEN teamCursor

-- Obtener la primera fila del cursor
FETCH NEXT FROM teamCursor INTO @TeamID, @TeamName, @LeagueID

-- Comenzar a recorrer las filas
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Obtener el nombre de la liga para el equipo actual
    SELECT @LeagueName = Name
    FROM Test.dbo.League
    WHERE ID = @LeagueID

    -- Mostrar la información del equipo y su liga
    PRINT 'Equipo: ' + @TeamName + ', Liga: ' + @LeagueName

    -- Obtener la siguiente fila del cursor
    FETCH NEXT FROM teamCursor INTO @TeamID, @TeamName, @LeagueID
END

-- Cerrar y liberar recursos del cursor
CLOSE teamCursor
DEALLOCATE teamCursor


