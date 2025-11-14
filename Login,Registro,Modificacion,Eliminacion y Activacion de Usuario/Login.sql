USE PeluqueriaCanina

GO

CREATE PROCEDURE SP_LoginUsuario
(
    @nombre_usuario VARCHAR(50),
    @contraseña VARCHAR(100)
)
AS
BEGIN

    BEGIN TRY
        BEGIN TRANSACTION;

        -----------------------------------------------------
        -- 1. Verificar si el usuario existe
        -----------------------------------------------------
		---Si no hay un usuario con el mismo nombre de usuario que el que ingresamos...
		IF NOT EXISTS (SELECT 1 FROM Usuario WHERE nombre_usuario =@nombre_usuario)
        BEGIN
			---Se muestra este mensaje y evita el ingreso del usuario
            PRINT 'El usuario no existe. Debe registrarse para continuar.';
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -----------------------------------------------------
        -- 2. Verificar contraseña
        -----------------------------------------------------
		---Si no hay un usuario con el mismo nombre de usuario y contraseña que el que ingresamos, ademas de que no este activo...
        IF NOT EXISTS (
            SELECT 1
            FROM Usuario
            WHERE nombre_usuario = @nombre_usuario
              AND contraseña = @contraseña
              AND activo = 1
        )
        BEGIN
			---Muestra el mensaje de error
            RAISERROR('Contraseña incorrecta o usuario inactivo.', 16, 1);
        END

		---Si no hay ningun error, el usuario ingresa al sistema 

        COMMIT TRANSACTION;
        PRINT 'Login exitoso. Bienvenido al sistema.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error en login: ' + ERROR_MESSAGE();
    END CATCH
END;
