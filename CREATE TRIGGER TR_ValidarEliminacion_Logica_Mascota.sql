CREATE TRIGGER TR_ValidarEliminacionMascota
ON Mascota
INSTEAD OF DELETE -- Ejecuta este código *en lugar de* el comando DELETE original
AS
BEGIN
    begin try
                             
             IF EXISTS ( SELECT d.id_mascota FROM DELETED d INNER JOIN Turno T ON T.id_mascota= d.id_mascota where T.estado IN ('programado', 'confirmado','atendido')) -- verifico si la mascota tiene turnos pendientes o realizados            
                BEGIN
                    RAISERROR ('No se puede eliminar la mascota porque tiene turnos asociados en estado programado, confirmado o atendido.', 16, 1);
                END
            ELSE
                BEGIN-- genero un abaja logica sino tiene turnos asociados 
                    UPDATE  Mascota SET activo = 0  WHERE id_mascota IN (SELECT id_mascota FROM deleted);
                END
        

    END TRY
    BEGIN CATCH
        
    END CATCH
    END

GO



