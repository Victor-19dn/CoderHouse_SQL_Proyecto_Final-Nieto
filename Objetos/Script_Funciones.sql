USE Proyecto_Laboratorio;

-- Función para obtener edad de paciente a partir de su id

DROP FUNCTION IF EXISTS Proyecto_Laboratorio.edad_paciente;
DELIMITER //
CREATE FUNCTION Proyecto_Laboratorio.edad_paciente(id_paciente INT)
RETURNS INT
READS SQL DATA

BEGIN
    DECLARE fecha_nacimiento DATE;
	DECLARE edad_paciente INT;
    
	SELECT Pacientes.fecha_nacimiento INTO fecha_nacimiento
    FROM Proyecto_Laboratorio.Pacientes
    WHERE Pacientes.id_paciente = id_paciente;
    
    SET edad_paciente = TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE());
    RETURN edad_paciente;
END; //
DELIMITER ;

-- Ej. de uso:
-- SELECT Proyecto_Laboratorio.edad_paciente(1) AS Edad_Paciente;


-- Función que retorna pedidos de análisis asignados a un bioquímico indicando su nombre

DROP FUNCTION IF EXISTS Proyecto_Laboratorio.pedidos_bioquimico;
DELIMITER //
CREATE FUNCTION Proyecto_Laboratorio.pedidos_bioquimico (bioquimico VARCHAR (60))
RETURNS VARCHAR (200)
DETERMINISTIC
BEGIN
	DECLARE lista_pedidos VARCHAR (200);
    SELECT GROUP_CONCAT(p_a.id_pedido SEPARATOR ', ')
    INTO lista_pedidos
    FROM Staff_Bioquimica s_b
    JOIN Pedidos_Analisis p_a ON s_b.id_bioquimico = p_a.id_bioquimico
    WHERE s_b.nombre_bioquimico = bioquimico;
    RETURN lista_pedidos;
END; //
DELIMITER ;

-- Ej. de uso:
-- SELECT Proyecto_Laboratorio.pedidos_bioquimico ('Eda Sawell');