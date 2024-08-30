DROP DATABASE IF EXISTS Proyecto_Laboratorio;
CREATE DATABASE Proyecto_Laboratorio;
USE Proyecto_Laboratorio;

-- TABLA Analisis
CREATE TABLE Analisis (
	id_analisis INT NOT NULL AUTO_INCREMENT,
	tipo_analisis VARCHAR (100),
	precio DECIMAL (8,2),

	PRIMARY KEY (id_analisis)
);

-- TABLA Staff_Bioquimica
CREATE TABLE Staff_Bioquimica (
	id_bioquimico INT NOT NULL AUTO_INCREMENT,
	nombre_bioquimico VARCHAR (60),
	matricula VARCHAR (25),

	PRIMARY KEY (id_bioquimico)
);

-- TABLA Staff_Enfermeria
CREATE TABLE Staff_Enfermeria (
	id_enfermero INT NOT NULL AUTO_INCREMENT,
	nombre_enfermero VARCHAR (60),

	PRIMARY KEY (id_enfermero)
);

-- TABLA Insumos
CREATE TABLE Insumos (
	id_insumo INT NOT NULL AUTO_INCREMENT,
    tipo_insumo VARCHAR (100),
    fecha_vencimiento DATE,
    precio DECIMAL (8,2),
    id_proveedor INT NOT NULL,
    
    PRIMARY KEY (id_insumo)
);
    
-- TABLA Proveedores
CREATE TABLE Proveedores (
	id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR (100),
    direccion VARCHAR (100),
    telefono VARCHAR (20),
    
    PRIMARY KEY (id_proveedor)
);
    
-- TABLA Pacientes
CREATE TABLE Pacientes (
	id_paciente INT NOT NULL AUTO_INCREMENT,
    nombre_completo VARCHAR (100),
    fecha_nacimiento DATE,
    sexo VARCHAR (9),
    telefono VARCHAR (20),
    e_mail VARCHAR (100) UNIQUE,
    id_obra_social INT NOT NULL,
    
    PRIMARY KEY (id_paciente)
);
    
-- TABLA Obra_Social
CREATE TABLE Obra_Social (
	id_obra_social INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (100),
	cobertura DECIMAL (8,2),
        
	PRIMARY KEY (id_obra_social)
);

-- TABLA Pedido_Analisis
CREATE TABLE Pedidos_Analisis (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME,
    id_paciente INT NOT NULL,
    id_analisis INT NOT NULL,
    id_bioquimico INT NOT NULL,
    id_enfermero INT,
    insumo_necesario INT,
    
    PRIMARY KEY (id_pedido)
);

-- TABLA Factura
CREATE TABLE Factura (
	id_factura INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_analisis INT NOT NULL,
	id_insumo INT,
    id_obra_social INT,
    precio_total DECIMAL (8,2),
    
    PRIMARY KEY (id_factura)
);


-- DEFINICION DE FOREING KEYS

-- TABLA Insumos
ALTER TABLE Insumos
	ADD CONSTRAINT FK_Insumo_Proveedor
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor);
    
-- TABLA Pacientes
ALTER TABLE Pacientes
	ADD CONSTRAINT FK_Paciente_ObraSocial
    FOREIGN KEY (id_obra_social) REFERENCES Obra_Social (id_obra_social);

-- TABLA Pedidos_Analisis
ALTER TABLE Pedidos_Analisis
	ADD CONSTRAINT FK_Pedido_Paciente
    FOREIGN KEY (id_paciente) REFERENCES Pacientes (id_paciente);
    
ALTER TABLE Pedidos_Analisis
	ADD CONSTRAINT FK_Pedido_IdAnalisis
    FOREIGN KEY (id_analisis) REFERENCES Analisis (id_analisis);

ALTER TABLE Pedidos_Analisis
	ADD CONSTRAINT FK_Pedido_Bioquimico
    FOREIGN KEY (id_bioquimico) REFERENCES Staff_Bioquimica (id_bioquimico);
    
ALTER TABLE Pedidos_Analisis
	ADD CONSTRAINT FK_Pedido_Enfermero
    FOREIGN KEY (id_enfermero) REFERENCES Staff_Enfermeria (id_enfermero);    

ALTER TABLE Pedidos_Analisis
	ADD CONSTRAINT FK_Pedido_Insumo
    FOREIGN KEY (insumo_necesario) REFERENCES Insumos (id_insumo);

-- TABLA Factura
ALTER TABLE Factura
	ADD CONSTRAINT FK_Factura_Pedido
    FOREIGN KEY (id_pedido) REFERENCES Pedidos_Analisis (id_pedido);

ALTER TABLE Factura
	ADD CONSTRAINT FK_Factura_Analisis
    FOREIGN KEY (id_analisis) REFERENCES Analisis (id_analisis);

ALTER TABLE Factura
	ADD CONSTRAINT FK_Factura_Insumo
    FOREIGN KEY (id_insumo) REFERENCES Insumos (id_insumo);

ALTER TABLE Factura
	ADD CONSTRAINT FK_Factura_ObraSocial
    FOREIGN KEY (id_obra_social) REFERENCES Obra_Social (id_obra_social);