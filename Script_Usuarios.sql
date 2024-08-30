USE Proyecto_Laboratorio;

-- Creación de usuarios:

-- Usuario 1
CREATE USER 'empleado_administrativo'@'%' IDENTIFIED BY 'passw1234' ;
-- Usuario 2
CREATE USER 'empleado_recepcionista'@'%' IDENTIFIED BY 'passwabcd' ;
-- Usuario 3
CREATE USER 'empleado_supervisor'@'%' IDENTIFIED BY 'passw5678' ;



-- Asignación de permisos:

-- Permisos de usuario 1
GRANT SELECT ON Proyecto_Laboratorio.Analisis TO 'empleado_administrativo'@'%' ;
GRANT UPDATE ON Proyecto_Laboratorio.Analisis TO 'empleado_administrativo'@'%' ;

-- Permisos de usuario 2
GRANT SELECT ON Proyecto_Laboratorio.Pacientes TO 'empleado_recepcionista'@'%' ;
GRANT SELECT ON Proyecto_Laboratorio.view_pacientes__por_obra_social TO 'empleado_recepcionista'@'%' ;
GRANT INSERT ON Proyecto_Laboratorio.Pacientes TO 'empleado_recepcionista'@'%' ;

-- Permisos de usuario 3
GRANT ALL PRIVILEGES ON Proyecto_Laboratorio.* TO 'empleado_supervisor'@'%' WITH GRANT OPTION;


-- Query para visualizar usuarios:
-- SELECT * FROM mysql.user;