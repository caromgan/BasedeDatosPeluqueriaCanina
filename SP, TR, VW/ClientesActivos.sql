USE PeluqueriaCanina

GO

CREATE VIEW VW_ClientesActivos AS
	SELECT T1.apellido+','+ T1.nombre AS Persona,  T2.persona_autorizada_retiro, T2.franja_horaria_preferida, T2.observaciones,T3.nombre+','+ T3.raza AS Mascota, T4.fecha, T4.hora
	FROM Personas AS T1
	INNER JOIN Cliente AS T2 ON T1.id_persona = T2.id_persona
	INNER JOIN Mascota AS T3 ON T2.id_cliente = T3.id_cliente
	INNER JOIN Turno AS T4 ON T3.id_mascota = T4.id_mascota
	WHERE T1.activo = 1 AND T2.activo = 1 AND T3.activo = 1 AND (T4.estado = 'programado' OR T4.estado = 'confirmado' OR T4.estado = 'atendido')