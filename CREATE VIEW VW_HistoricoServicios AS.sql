USE PeluqueriaCanina

GO
--puedo ver los servicios atendidos historicos 
CREATE  VIEW VW_HistoricoServicios AS
SELECT M.nombre, M.raza, PC.Nombre+','+ PC.Apellido AS Ciente_Dueño, S.Descripcion, T.Fecha, T.precio_final, P.Nombre+ ',' + P.Apellido AS Empleado
From Mascota M
INNER JOIN Turno T ON T.id_mascota = M.id_mascota
INNER JOIN Cliente C ON M.Id_Cliente = C.Id_Cliente
INNER JOIN Servicio S ON T.Id_servicio = S.Id_Servicio
INNER JOIN Empleado E ON T.Id_Empleado = E.Id_Empleado
INNER JOIN Personas P ON E.Id_Persona = P.Id_Persona
INNER JOIN PersonaS pc ON C.id_persona = pc.id_persona
WHERE T.estado = 'Atendido';


