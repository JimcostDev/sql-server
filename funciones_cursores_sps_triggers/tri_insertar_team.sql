--un trigger es una función especial que se ejecuta automáticamente cuando ocurren ciertos 
--eventos en una tabla, como inserciones, actualizaciones o eliminaciones. Aquí tienes un
--ejemplo de cómo crear un trigger en SQL Server que se activará después de insertar datos 
--en la tabla Team y registrará la información 
--en una tabla de auditoría llamada TeamAudit.

-- Crear la tabla de auditoría si no existe
USE [Test]
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TeamAudit')
BEGIN
    CREATE TABLE TeamAudit (
        AuditID INT IDENTITY(1,1) PRIMARY KEY,
        TeamID INT,
        TeamName NVARCHAR(50),
        AuditDate DATETIME DEFAULT GETDATE()
    )
END
GO

-- Crear el trigger
CREATE OR ALTER TRIGGER trgAfterInsertTeam
ON Team
AFTER INSERT
AS
BEGIN
    INSERT INTO TeamAudit (TeamID, TeamName)
    SELECT ID, Name
    FROM inserted
END

--probrar
SELECT * FROM Team
INSERT INTO Team (Name, LeagueID) VALUES ('Manchester City', 1)
SELECT * FROM TeamAudit

