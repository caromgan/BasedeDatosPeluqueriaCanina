USE PeluqueriaCanina

GO

CREATE PROCEDURE SP_ActivarUsuario
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
        -- 2. Activar usuario
        -----------------------------------------------------
        UPDATE Usuario
        SET activo = 1, fecha_modificacion = GETDATE()
        WHERE nombre_usuario = @nombre_usuario;

        COMMIT TRANSACTION;
        PRINT 'Usuario activado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al activar usuario: ' + ERROR_MESSAGE();
    END CATCH
END;