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