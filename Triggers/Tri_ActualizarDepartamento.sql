create TRIGGER [dbo].[Tri_ActualizarDepartamento]
   ON  [dbo].[DEPARTAMENTO]
   AFTER UPDATE
AS
BEGIN

SET NOCOUNT ON;

Insert into [dbo].[LogTransaccion] ([Log_Tabla], [Log_Fecha], [Log_Transaccion], [Log_usuario], [Log_Dato])

SELECT 'DEPARTAMENTO', GETDATE(), 'Actualizo Anterior DEPARTAMENTO', SYSTEM_USER, dep_nombre
FROM deleted

Insert into [dbo].[LogTransaccion] ([Log_Tabla], [Log_Fecha], [Log_Transaccion], [Log_usuario], [Log_Dato])

SELECT 'DEPARTAMENTO', GETDATE(), 'Actualizo  DEPARTAMENTO', SYSTEM_USER, dep_nombre
FROM inserted  


END