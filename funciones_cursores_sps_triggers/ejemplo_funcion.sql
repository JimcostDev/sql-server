USE [Test]
-- Crear la función
CREATE FUNCTION dbo.ObtenerNombreEquipo
(
    @TeamID INT  -- Parámetro de entrada: ID del equipo
)
RETURNS NVARCHAR(50)  -- Tipo de dato que devuelve la función
AS
BEGIN
    DECLARE @TeamName NVARCHAR(50)

    SELECT @TeamName = Name
    FROM Test.dbo.Team
    WHERE ID = @TeamID

    RETURN @TeamName
END


-- Llamar a la función para obtener el nombre de un equipo específico (supongamos que el ID del equipo es 1)
DECLARE @EquipoID INT = 1
SELECT dbo.ObtenerNombreEquipo(@EquipoID) AS NombreEquipo