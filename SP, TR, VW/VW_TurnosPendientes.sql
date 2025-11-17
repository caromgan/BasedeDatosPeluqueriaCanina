USE PeluqueriaCanina
GO
CREATE OR ALTER VIEW VW_TurnosPendientes
AS
SELECT
    t.id_turno,
    t.fecha,
    t.hora,
    t.estado,                  
    t.precio_final,
    m.nombre              AS nombre_mascota,
    s.descripcion         AS servicio,
    pC.apellido + ', ' + pC.nombre AS nombre_cliente,
    pE.apellido + ', ' + pE.nombre AS nombre_empleado,
    pr.descripcion        AS promocion_aplicada
FROM Turno t
    INNER JOIN Mascota  m  ON t.id_mascota  = m.id_mascota
    INNER JOIN Cliente  c  ON m.id_cliente  = c.id_cliente
    INNER JOIN Personas pC ON c.id_persona  = pC.id_persona
    INNER JOIN Empleado e  ON t.id_empleado = e.id_empleado
    INNER JOIN Personas pE ON e.id_persona  = pE.id_persona
    INNER JOIN Servicio s  ON t.id_servicio = s.id_servicio
    LEFT  JOIN Promocion pr ON t.id_promocion_aplicada = pr.id_promocion
WHERE
    t.estado = 'programado';
GO
