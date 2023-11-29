use Test
-- Crear el procedimiento almacenado
GO
CREATE OR ALTER PROCEDURE ObtenerEquiposPorLiga
    @LeagueID INT  -- Parámetro de entrada: ID de la liga
AS
BEGIN
    SELECT ID, Name
    FROM Test.dbo.Team
    WHERE LeagueID = @LeagueID
END


-- Llamar al procedimiento almacenado y pasar el ID de la liga (por ejemplo, 1)
EXEC ObtenerEquiposPorLiga @LeagueID = 2

