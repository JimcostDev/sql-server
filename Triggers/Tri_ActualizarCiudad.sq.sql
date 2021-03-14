CREATE TRIGGER [dbo].[Tri_ActualizarCiudad]
   ON  [dbo].[CIUDAD]
   AFTER UPDATE
AS
BEGIN

SET NOCOUNT ON;

Insert into [dbo].[LogTransaccion] ([Log_Tabla], [Log_Fecha], [Log_Transaccion], [Log_usuario], [Log_Dato])

SELECT 'CIUDAD', GETDATE(), 'Actualizo Anterior CIUDAD', SYSTEM_USER, CIU_NOMBRE
FROM deleted

Insert into [dbo].[LogTransaccion] ([Log_Tabla], [Log_Fecha], [Log_Transaccion], [Log_usuario], [Log_Dato])

SELECT 'CIUDAD', GETDATE(), 'Actualizo  CIUDAD', SYSTEM_USER, CIU_NOMBRE
FROM inserted  


END