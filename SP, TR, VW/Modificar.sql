USE PeluqueriaCanina

GO

ALTER PROCEDURE SP_ModificarUsuario
(
    @id_usuario INT,
	@id_persona INT,
	@nombre_usuario VARCHAR(50),
    @contraseña VARCHAR(100),
    @tipo_usuario VARCHAR(20),
    @activo BIT = 1
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        -----------------------------------------------------
        -- 1. Verificar que el usuario existe
        -----------------------------------------------------

		---Si no existe un registro que tenga el mismo id de usuario...
        IF NOT EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = @id_usuario)
        BEGIN
            RAISERROR('El usuario indicado no existe.', 16, 1);
        END

        -----------------------------------------------------
        -- 2. Actualizar solo los campos que NO vengan nulos
        -----------------------------------------------------
        UPDATE Usuario
        SET 
            id_persona      = ISNULL(@id_persona, id_persona),
            contraseña      = ISNULL(@contraseña, contraseña),
            tipo_usuario    = ISNULL(@tipo_usuario, tipo_usuario),
            activo          = ISNULL(@activo, activo),
			fecha_modificacion = ISNULL(GETDATE(),fecha_modificacion)
        WHERE id_usuario = @id_usuario;


        COMMIT TRANSACTION;
        PRINT 'Usuario modificado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al modificar usuario: ' + ERROR_MESSAGE();
    END CATCH
END;