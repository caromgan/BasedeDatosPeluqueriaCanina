USE PeluqueriaCanina

GO

ALTER PROCEDURE SP_RegistrarUsuario
(
	@id_persona INT,
    @nombre_usuario VARCHAR(50),
    @contraseña VARCHAR(100),
    @tipo_usuario VARCHAR(20)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
		---Si existe un usuario con el mismo nombre de usuario como el que ingresamos...
        IF EXISTS (SELECT 1 FROM Usuario WHERE nombre_usuario = @nombre_usuario)
        BEGIN
			---Muestra este mensaje
            RAISERROR('El nombre de usuario ya existe.', 16, 1);
        END

		---Si no existe el nombre de usuario, se registra el registro
        INSERT INTO Usuario(id_persona,nombre_usuario, contraseña, tipo_usuario)
        VALUES (@id_persona,@nombre_usuario, @contraseña, @tipo_usuario);

        COMMIT TRANSACTION;
		---Se muestra este mensaje en pantalla para indicar de que el usuario fue registrado
        PRINT 'Usuario registrado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
		---Error de registro
        PRINT 'Error al registrar usuario: ' + ERROR_MESSAGE();
    END CATCH
END;
