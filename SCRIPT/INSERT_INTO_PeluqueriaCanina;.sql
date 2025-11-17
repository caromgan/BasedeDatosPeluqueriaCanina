USE PeluqueriaCanina;
GO

---
--- 1. INSERTS para la tabla Personas (12 registros)
---
INSERT INTO Personas (apellido, nombre, documento, direccion, email, telefono)
VALUES
('García', 'Ana', '28123456', 'Av. Rivadavia 1234', 'ana.garcia@email.com', '1145678901'),
('Rodríguez', 'Juan', '30987654', 'Calle Falsa 123', 'juan.rodriguez@email.com', '1123456789'),
('López', 'María', '32555444', 'Bv. San Juan 500', 'maria.lopez@email.com', '1160001000'),
('Martínez', 'Carlos', '25678901', 'Libertador 7000', 'carlos.m@email.com', '1158889999'),
('Sánchez', 'Laura', '35111222', 'Salta 85', 'laura.s@email.com', '1134445555'),
('Pérez', 'Emilio', '29333444', 'Corrientes 987', 'emilio.perez@email.com', '1141112222'),
('Fernández', 'Sofía', '38777888', 'Las Heras 40', 'sofia.f@email.com', '1169990000'),
('Gómez', 'Ricardo', '26000111', 'Belgrano 321', 'ricardo.g@email.com', '1157778888'),
('Díaz', 'Valeria', '34222333', 'Montevideo 150', 'valeria.d@email.com', '1143334444'),
('Ruiz', 'Pablo', '27555666', 'Peru 789', 'pablo.r@email.com', '1120003000'),
('Acosta', 'Julieta', '36999000', 'Sarmiento 100', 'julieta.a@email.com', '1165557777'),
('Torres', 'Hector', '24111222', 'Roca 55', 'hector.t@email.com', '1148880000');
GO

---
--- 2. INSERTS para la tabla Usuario (4 registros - Solo Empleados/Admin)
---
INSERT INTO Usuario (id_persona, nombre_usuario, contraseña, tipo_usuario)
VALUES
(1, 'ana.g', HASHBYTES('SHA2_256', 'pass123'), 'Administrador'), -- Ana García
(2, 'juan.r', HASHBYTES('SHA2_256', 'pass123'), 'Empleado'),    -- Juan Rodríguez
(3, 'maria.l', HASHBYTES('SHA2_256', 'pass123'), 'Empleado'),   -- María López
(4, 'carlos.m', HASHBYTES('SHA2_256', 'pass123'), 'Empleado');  -- Carlos Martínez
GO

---
--- 3. INSERTS para la tabla Empleado (4 registros)
---
INSERT INTO Empleado (id_persona, especialidad, fecha_ingreso)
VALUES
(1, 'Administracion', '2020-01-15'),  -- Ana García
(2, 'Peluquería Canina', '2021-03-01'), -- Juan Rodríguez
(3, 'Estética Felina', '2022-05-20'),   -- María López
(4, 'Baño y Corte', '2023-11-10');     -- Carlos Martínez
GO

---
--- 4. INSERTS para la tabla Cliente (8 registros)
---
INSERT INTO Cliente (id_persona, persona_autorizada_retiro, franja_horaria_preferida, observaciones)
VALUES
(5, 'Laura Sánchez (Yo)', 'Mañana (9hs-12hs)', 'Llamar antes de la visita.'), -- Laura Sánchez
(6, 'Mario Pérez (Hermano)', 'Tarde (14hs-17hs)', NULL),                     -- Emilio Pérez
(7, 'Sofía Fernández (Yo)', 'Cualquiera', 'Mascota nerviosa con ruidos fuertes.'), -- Sofía Fernández
(8, 'Ricardo Gómez (Yo)', 'Mañana (9hs-12hs)', NULL),                        -- Ricardo Gómez
(9, 'Valeria Díaz (Yo)', 'Tarde (17hs-20hs)', 'Solo los Sábados.'),          -- Valeria Díaz
(10, 'Pablo Ruiz (Yo)', 'Cualquiera', 'Avisar si es necesario sedación.'),    -- Pablo Ruiz
(11, 'Julieta Acosta (Yo)', 'Mañana (10hs-13hs)', NULL),
(12, 'Héctor Torres (Yo)', 'Tarde (15hs-18hs)', 'Solo pide corte de uñas.');
GO

---
--- 5. INSERTS para la tabla Mascota (10 registros)
---
INSERT INTO Mascota (id_cliente, nombre, raza, especie, sexo, fecha_nacimiento, observaciones)
VALUES
(1, 'Fido', 'Golden Retriever', 'Perro', 'M', '2019-05-10', 'Alergia al shampoo con perfume.'), -- Cliente 1 (Laura Sánchez)
(1, 'Mishi', 'Siamés', 'Gato', 'F', '2021-01-20', NULL),                                      -- Cliente 1 (Laura Sánchez)
(2, 'Lulú', 'Caniche Toy', 'Perro', 'F', '2020-08-01', 'Necesita corte de pelo muy corto.'),   -- Cliente 2 (Emilio Pérez)
(3, 'Toby', 'Labrador', 'Perro', 'M', '2018-03-15', NULL),                                    -- Cliente 3 (Sofía Fernández)
(4, 'Sasha', 'Pastor Alemán', 'Perro', 'F', '2022-06-25', 'Miedosa al agua.'),                 -- Cliente 4 (Ricardo Gómez)
(5, 'Ronnie', 'Gato Persa', 'Gato', 'M', '2023-02-14', 'Cuidado con el cepillado excesivo.'),  -- Cliente 5 (Valeria Díaz)
(6, 'Princesa', 'Yorkshire Terrier', 'Perro', 'F', '2017-11-30', 'Cliente habitual, solo baño.'),-- Cliente 6 (Pablo Ruiz)
(7, 'Rocky', 'Pitbull', 'Perro', 'M', '2020-09-09', NULL),                                    -- Cliente 7 (Julieta Acosta)
(8, 'Kitty', 'Mestizo', 'Gato', 'F', '2022-12-05', 'Uñas muy filosas.'),                      -- Cliente 8 (Héctor Torres)
(8, 'Max', 'Boxer', 'Perro', 'M', '2021-04-12', NULL);                                        -- Cliente 8 (Héctor Torres)
GO

---
--- 6. INSERTS para la tabla Servicio (10 registros)
---
INSERT INTO Servicio (descripcion, precio, duracion_minutos)
VALUES
('Baño completo Perro Pequeño', 1500.00, 45),
('Baño completo Perro Mediano', 2000.00, 60),
('Baño completo Perro Grande', 2800.00, 75),
('Corte de Pelo Estándar', 3500.00, 90),
('Corte Higiénico y Uñas', 1000.00, 30),
('Limpieza de Oídos y Dientes', 800.00, 20),
('Baño y Estética Felina', 4000.00, 120),
('Día de Spa (Completo + Masaje)', 6000.00, 150),
('Corte de Uñas', 500.00, 15),
('Tratamiento Antiparásitos', 1200.00, 30);
GO

---
--- 7. INSERTS para la tabla Promocion (4 registros)
---
INSERT INTO Promocion (descripcion, fecha_inicio, fecha_fin, descuento)
VALUES
('Descuento de Invierno', '2025-06-01', '2025-08-31', 15.00),
('Martes de Perros Chicos', '2025-11-01', '2025-12-31', 10.00),
('Promo Gatos Mensual', '2025-11-01', '2025-11-30', 20.00),
('Especial Cumpleaños', '2025-01-01', '2025-12-31', 5.00); -- Descuento permanente
GO

---
--- 8. INSERTS para la tabla PromocionServicio (6 registros)
---
INSERT INTO PromocionServicio (id_promocion, id_servicio)
VALUES
(1, 1), -- Invierno en Baño Pequeño
(1, 2), -- Invierno en Baño Mediano
(2, 1), -- Martes de Perros Chicos en Baño Pequeño
(3, 7), -- Promo Gatos Mensual en Estética Felina
(4, 4), -- Cumpleaños en Corte de Pelo Estándar
(4, 5); -- Cumpleaños en Corte Higiénico
GO

---
--- 9. INSERTS para la tabla Turno (10 registros) -- Modificado
---
INSERT INTO Turno (fecha, hora, estado, id_mascota, id_servicio, id_empleado,
                   id_promocion_aplicada, observaciones, precio_final)
VALUES
-- 1. Fido - Baño pequeño + Promo Invierno (15%)
('2025-11-10', '09:00', 'programado', 1, 1, 2, 1,
 'Aplicado descuento de invierno 15%.', 1500 - (1500 * 0.15)),

-- 2. Mishi - Estética Felina + Promo Gatos Mensual (20%)
('2025-11-11', '10:30', 'confirmado', 2, 7, 3, 3,
 'Gata muy tranquila, promo mensual aplicada.', 4000 - (4000 * 0.20)),

-- 3. Lulú - Baño mediano + Promo Invierno (15%)
('2025-11-12', '11:00', 'confirmado', 3, 2, 2, 1,
 'Cliente pidió corte más corto.', 2000 - (2000 * 0.15)),

-- 4. Toby - Corte estándar + Promo Cumpleaños (5%)
('2025-11-13', '14:00', 'programado', 4, 4, 4, 4,
 'Promo cumpleaños aplicada por aniversario del cliente.', 3500 - (3500 * 0.05)),

-- 5. Sasha - Baño grande (sin promo)
('2025-11-14', '15:30', 'programado', 5, 3, 2, NULL,
 'Mascota nerviosa con secador.', 2800),

-- 6. Ronnie - Corte higiénico + Promo Cumpleaños (5%)
('2025-11-15', '09:15', 'atendido', 6, 5, 1, 4,
 'Cliente conforme con el resultado.', 1000 - (1000 * 0.05)),

-- 7. Princesa - Corte de uñas (sin promo)
('2025-11-16', '17:00', 'atendido', 7, 9, 4, NULL,
 'Corte rápido y sin inconvenientes.', 500),

-- 8. Rocky - Baño grande (sin promo)
('2025-11-17', '13:00', 'cancelado', 8, 3, 2, NULL,
 'Cancelado por enfermedad de la mascota.', 2800),

-- 9. Kitty - Estética felina + Promo Gatos Mensual (20%)
('2025-11-18', '11:30', 'confirmado', 9, 7, 3, 3,
 'Cliente pidió cuidado extra de uñas.', 4000 - (4000 * 0.20)),

-- 10. Max - Día de Spa (sin promo)
('2025-11-19', '16:45', 'programado', 10, 8, 4, NULL,
 'Servicio completo, incluye masaje.', 6000);
GO

---
--- 10. INSERTS para la tabla ActividadUsuario (8 registros)
---
INSERT INTO ActividadUsuario (id_usuario, descripcion)
VALUES
(1, 'Creación de la base de datos PeluqueriaCanina.'),
(1, 'Inserción inicial de 12 registros en la tabla Personas.'),
(2, 'Agendó un turno para Fido (id_mascota 1).'),
(3, 'Modificó el precio del Servicio 7.'),
(4, 'Registró un nuevo Empleado (id_persona 4).'),
(2, 'Confirmó el turno de Ronnie (id_turno 3).'),
(1, 'Actualizó la descripción de la Promoción 1.'),
(3, 'Canceló el turno de Mishi (id_turno 6).');
GO

