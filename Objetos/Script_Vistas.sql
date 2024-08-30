USE proyecto_laboratorio;

-- Vista 1: Pacientes por obra social

CREATE OR REPLACE VIEW proyecto_laboratorio.view_pacientes__por_obra_social
(Obra_Social, Id_Paciente, Nombre_Paciente)
AS
SELECT
	o.nombre AS obra_social,
	p.id_paciente,
	p.nombre_completo AS nombre_paciente
FROM Obra_Social o LEFT JOIN Pacientes p
ON (o.id_obra_social = p.id_obra_social);

-- Ej. de uso:
-- SELECT * FROM proyecto_laboratorio.view_pacientes__por_obra_social;


-- Vista 2: Pacientes de la obra social de mayor cobertura

CREATE OR REPLACE VIEW proyecto_laboratorio.view_pacientes_obra_mayor_cobertura
(Id_Paciente, Nombre, Telefono, Correo_Electronico)
AS
(SELECT
	id_paciente,
	nombre_completo,
    telefono,
    e_mail
FROM Proyecto_Laboratorio.Pacientes
WHERE id_obra_social = 6);

-- Ej. de uso:
-- SELECT * FROM proyecto_laboratorio.view_pacientes_obra_mayor_cobertura;


-- Vista 3: Pedidos de análisis de los últimos tres meses (registrados en la DB [mayo - julio])

CREATE OR REPLACE VIEW proyecto_laboratorio.view_pedidos_mayo_julio
(Id_Pedido, Fecha, Id_Paciente, Nombre_Paciente)
AS
SELECT
	p_a.id_pedido,
	p_a.fecha,
	p_a.id_paciente,
	p.nombre_completo
FROM Pedidos_Analisis p_a LEFT JOIN Pacientes p
ON (p_a.id_paciente = p.id_paciente)
WHERE
	p_a.fecha BETWEEN '2024-05-01' AND '2024-07-31'
ORDER BY p_a.fecha DESC;

-- Ej. de uso:
-- SELECT * FROM proyecto_laboratorio.view_pedidos_mayo_julio;