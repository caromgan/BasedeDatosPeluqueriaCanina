USE PeluqueriaCanina

GO

ALTER PROCEDURE SP_DesactivarUsuario
(
    @nombre_usuario VARCHAR(50)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -----------------------------------------------------
        -- 1. Verificar que el usuario existe
        -----------------------------------------------------
        IF NOT EXISTS (SELECT 1 FROM Usuario WHERE nombre_usuario = @nombre_usuario)
        BEGIN
            RAISERROR('El usuario indicado no existe.', 16, 1);
        END

        -----------------------------------------------------
        -- 2. Desactivar usuario
        -----------------------------------------------------
        UPDATE Usuario
        SET activo = 0, fecha_modificacion = GETDATE()
        WHERE nombre_usuario = @nombre_usuario;

        COMMIT TRANSACTION;
        PRINT 'Usuario desactivado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al desactivar usuario: ' + ERROR_MESSAGE();
    END CATCH
END;