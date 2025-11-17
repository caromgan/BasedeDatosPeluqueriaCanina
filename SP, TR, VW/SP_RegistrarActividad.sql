USE PeluqueriaCanina

GO

CREATE PROCEDURE SP_RegistrarActividad(
	@id_usuario INT,
	@descripcion VARCHAR(200)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
		---Si no existe el usuario...
        IF NOT EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = @id_usuario)
        BEGIN
			---Muestra este mensaje
            RAISERROR('El usuario ingresado no existe', 16, 1);
        END
		---Si existe el usuario, se registra la actividad
        INSERT INTO ActividadUsuario(id_usuario,fecha,descripcion)
        VALUES (@id_usuario,GETDATE(),@descripcion);

        COMMIT TRANSACTION;
		---Se muestra este mensaje en pantalla para indicar que la actividad fue registrada
        PRINT 'Se registro la actividad correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
		---Error de registro
        PRINT 'Error al registrar la actividad: ' + ERROR_MESSAGE();
    END CATCH
END