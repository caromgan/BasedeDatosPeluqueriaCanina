--PROCEDIMIENTO

ALTER PROCEDURE SP_CancelarTurno(
    @id_turno INT,
    @motivo VARCHAR(200)
)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Turno WHERE id_turno = @id_turno)
    BEGIN
        RAISERROR('El turno no existe.', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM Turno WHERE id_turno = @id_turno AND estado = 'atendido')
    BEGIN
        RAISERROR('No se puede cancelar un turno ya atendido.', 16, 1);
        RETURN;
    END

    UPDATE Turno
    SET estado = 'cancelado',
        observaciones = @motivo,
        fecha_modificacion = GETDATE()
    WHERE id_turno = @id_turno;
END;
GO


-- TRIGGER

CREATE TRIGGER TR_ActualizarHistorialServicio ON Turno
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ActividadUsuario (id_usuario, descripcion)
    SELECT TOP 1 
        1 AS id_usuario, 
        CONCAT(
            'Turno ', i.id_turno,
            ' completado para Mascota ', i.id_mascota,
            ' con Servicio ', i.id_servicio
        ) AS descripcion
    FROM inserted i
    JOIN deleted d ON i.id_turno = d.id_turno
    WHERE d.estado <> 'atendido'
      AND i.estado = 'atendido';
END
GO