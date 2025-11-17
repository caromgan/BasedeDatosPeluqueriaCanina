

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
