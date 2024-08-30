USE Proyecto_Laboratorio;

-- 1er Trigger: Checker para actualización de medio de contacto de pacientes
DROP TRIGGER IF EXISTS Proyecto_Laboratorio.trg_checker_paciente_contacto;

DELIMITER //
CREATE TRIGGER Proyecto_Laboratorio.trg_checker_paciente_contacto
AFTER UPDATE ON Proyecto_Laboratorio.Pacientes
FOR EACH ROW
BEGIN
IF NEW.telefono IS NULL AND
NEW.e_mail IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Solicitar medio de contacto';
END IF;
END;//

DELIMITER ;

-- Ej. de uso para comprobar error y mensaje de signal sqlstate:
/*
UPDATE Proyecto_Laboratorio.Pacientes
SET telefono = NULL
WHERE id_paciente = 10;
*/



-- 2do Trigger: Checker de medio de contacto en la inserción de pacientes
DROP TRIGGER IF EXISTS Proyecto_Laboratorio.trg_checker_insert_paciente_contacto;

DELIMITER //
CREATE TRIGGER Proyecto_Laboratorio.trg_checker_insert_paciente_contacto
BEFORE INSERT ON Proyecto_Laboratorio.Pacientes
FOR EACH ROW
BEGIN
IF NEW.telefono IS NULL AND
NEW.e_mail IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Es necesario algún medio de contacto';
END IF;
END;//

DELIMITER ;

-- Ej. de uso para comprobar error y mensaje de signal sqlstate:
/*
INSERT INTO Proyecto_Laboratorio.Pacientes
(nombre_completo,
fecha_nacimiento,
sexo,
telefono,
e_mail,
id_obra_social)
VALUES
('Paciente_Prueba', '1949-10-21', 'M', NULL, NULL, 5);
*/



-- Tabla de auditoría
CREATE TABLE logs_precio_insumos (
	id INT NOT NULL AUTO_INCREMENT, 
    id_tabla_insumos INT NOT NULL,
    tipo_insumo VARCHAR (100),
    precio_actualizado DECIMAL (8,2),
    precio_anterior DECIMAL (8,2),
    usuario_updater VARCHAR (100),
    fecha_modificacion DATETIME,
    PRIMARY KEY (id)
);


-- 3er Trigger: Logger de cambios de precio de insumos
DROP TRIGGER IF EXISTS Proyecto_Laboratorio.trg_logger_actualizacion_insumos;

DELIMITER //
CREATE TRIGGER Proyecto_Laboratorio.trg_logger_actualizacion_insumos
AFTER UPDATE ON Proyecto_Laboratorio.Insumos
FOR EACH ROW
BEGIN
	INSERT INTO Proyecto_Laboratorio.logs_precio_insumos
	(id_tabla_insumos,tipo_insumo,precio_actualizado,precio_anterior,usuario_updater,fecha_modificacion)
    VALUES
    (
		OLD.id_insumo,
        OLD.tipo_insumo,
        NEW.precio,
        OLD.precio,
        SESSION_USER(),
        NOW()
    );
END;//

DELIMITER ;

-- Ej. de uso para comprobar error y mensaje de signal sqlstate:
/*
UPDATE Proyecto_Laboratorio.Insumos
SET precio = 625.00
WHERE id_insumo = 2;
*/
-- Sentencias para visualizar tablas involucradas:
-- SELECT * FROM Proyecto_Laboratorio.Insumos;
-- SELECT * FROM Proyecto_Laboratorio.logs_precio_insumos;