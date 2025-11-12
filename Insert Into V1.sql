use PeluqueriaCanina;

INSERT INTO Personas (apellido, nombre, documento, direccion, email, telefono)
VALUES 
('Pérez', 'Ana', '40111222', 'Av. Libertador 1234', 'ana.perez@gmail.com', '1158749632'),
('Gómez', 'Lucía', '39222000', 'Calle Belgrano 450', 'lucia.gomez@gmail.com', '1132045879'),
('Ruiz',  'Carlos', '37001999', 'San Martín 850', 'carlos.ruiz@gmail.com', '1169045590'),
('Fernández', 'María', '40800777', 'Av. Mitre 2300', 'maria.fernandez@gmail.com', '1123415678');

INSERT INTO Usuario (id_persona, nombre_usuario, [contraseña], tipo_usuario)
VALUES 
(1, 'ana.perez', '1234', 'Cliente'),
(2, 'lucia.gomez', 'abcd', 'Cliente'),
(3, 'carlos.ruiz', 'admin','Empleado'),
(4, 'maria.fernandez', 'manager','Administrador');

INSERT INTO Empleado (id_persona, especialidad, fecha_ingreso)
VALUES
(3, 'Peluquero',     '2023-02-10'),
(4, 'Administrativo','2022-09-05');

INSERT INTO Cliente (id_persona, persona_autorizada_retiro, franja_horaria_preferida, observaciones)
VALUES
(1, 'Juan Pérez',  '09:00 - 13:00', 'Prefiere turnos matutinos'),
(2, 'Sofía Gómez', '14:00 - 18:00', 'Cliente frecuente');

INSERT INTO Mascota (id_cliente, nombre, raza, especie, sexo, fecha_nacimiento, observaciones)
VALUES
(1, 'Rocky','Labrador','Perro','M','2020-06-15','Muy tranquilo'),
(1, 'Luna', 'Persa',   'Gato', 'F','2021-03-22','Asustadiza con desconocidos'),
(2, 'Max',  'Caniche', 'Perro','M','2019-11-05','Le teme al secador');

INSERT INTO Servicio (descripcion, precio, duracion_minutos)
VALUES
('Baño completo',   4000, 60),
('Corte de pelo',   5000, 45),
('Desparasitación', 2500, 30),
('Baño y Corte',    7000, 90);

INSERT INTO Promocion (descripcion, fecha_inicio, fecha_fin, descuento)
VALUES
('Promo Primavera', '2025-09-01', '2025-11-30', 15.00),
('Promo Verano',    '2025-12-01', '2026-02-28', 20.00);

INSERT INTO PromocionServicio (id_promocion, id_servicio)
VALUES
(1,1),(1,2),(2,1),(2,4);

INSERT INTO Turno (fecha, hora, estado, id_mascota, id_servicio, id_empleado, id_promocion_aplicada, observaciones, precio_final)
VALUES
('2025-11-15','10:00','confirmado', 1,1,1,1,   'Cliente puntual', 3400),
('2025-11-16','15:00','programado',  2,2,1,NULL,'Corte básico',    5000),
('2025-11-17','11:00','confirmado',  3,4,2,2,   'Combo verano',    5600);

INSERT INTO ActividadUsuario (id_usuario, descripcion)
VALUES
(1,'Ingreso al sistema'),
(2,'Solicitó turno'),
(3,'Atendió servicio'),
(4,'Revisó agenda del día');

