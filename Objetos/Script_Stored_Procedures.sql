USE Proyecto_Laboratorio;

-- Tabla de pacientes eliminados de la tabla principal
CREATE TABLE Archivo_Pacientes_Anteriores (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_paciente_eliminado INT NOT NULL,
    nombre_paciente VARCHAR (100),
    fecha_nacimiento DATE,
    fecha_eliminacion DATETIME DEFAULT (CURRENT_TIMESTAMP)
);


/*
Stored procedure para archivar pacientes eliminados
y eliminar registros de tabla principal de pacientes y pedidos de análisis
*/
DROP PROCEDURE IF EXISTS Proyecto_Laboratorio.sp_eliminacion_archivo_paciente;

DELIMITER //
CREATE PROCEDURE Proyecto_Laboratorio.sp_eliminacion_archivo_paciente
(IN id_paciente INT)

BEGIN
	DECLARE v_nombre_paciente VARCHAR (100);
    DECLARE v_fecha_nacimiento DATE;
    
	SELECT
		nombre_completo,
		fecha_nacimiento
	INTO v_nombre_paciente, v_fecha_nacimiento
    FROM Proyecto_Laboratorio.Pacientes
    WHERE id_paciente = Pacientes.id_paciente;
    
    INSERT INTO Proyecto_Laboratorio.Archivo_Pacientes_Anteriores
    (id_paciente_eliminado,
    nombre_paciente,
    fecha_nacimiento,
    fecha_eliminacion)
    VALUES
    (id_paciente,
    v_nombre_paciente,
    v_fecha_nacimiento,
    CURRENT_TIMESTAMP());

	DELETE FROM Proyecto_Laboratorio.Pedidos_Analisis
    WHERE id_paciente = Pedidos_Analisis.id_paciente;
    
    DELETE FROM Proyecto_Laboratorio.Pacientes
    WHERE id_paciente = Pacientes.id_paciente;
END; //

DELIMITER ;


-- Ej. de uso:
-- CALL Proyecto_Laboratorio.sp_eliminacion_archivo_paciente (5);

-- Sentencias para visualizar tablas involucradas:
-- SELECT * FROM Proyecto_Laboratorio.Archivo_Pacientes_Anteriores;
-- SELECT * FROM Proyecto_Laboratorio.Pacientes;


-- Stored procedure para actualizar cobertura de obra social
DROP PROCEDURE IF EXISTS Proyecto_Laboratorio.sp_actualizacion_cobertura; 

DELIMITER //
CREATE PROCEDURE Proyecto_Laboratorio.sp_actualizacion_cobertura
(IN id_obra_social INT,
IN cobertura_actualizada VARCHAR (4))

BEGIN
	UPDATE Proyecto_Laboratorio.Obra_Social
    SET cobertura = cobertura_actualizada
    WHERE id_obra_social = Obra_Social.id_obra_social;
END; //

DELIMITER ;


-- Ej. de uso:
-- CALL Proyecto_Laboratorio.sp_actualizacion_cobertura (3, '35%');

-- Sentencia para visualizar tabla involucrada:
-- SELECT * FROM Proyecto_Laboratorio.Obra_Social;