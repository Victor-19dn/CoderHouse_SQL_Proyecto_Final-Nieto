# CoderHouse_SQL_Proyecto_Final-Nieto

# CoderHouse - Curso SQL: Proyecto Final
## Victor Daniel Nieto



# Proyecto_Laboratorio


## Introducción y descripción de la temática:
En este proyecto me propongo trabajar a partir de una problemática relacionada a la administración de un laboratorio de análisis clínicos. Esta idea se origina a partir de un interés personal por este modelo de negocio relacionado al ámbito de la salud. Dicho interés surge a través de un vínculo familiar y me gustaría aprovechar lo aprendido a lo largo del curso para plantear una aplicación de un proyecto basado en un laboratorio real.


## Objetivos:
A lo largo de las distintas entregas del proyecto el objetivo principal fue la implementación de una base de datos que fuera funcional al modelo de negocio de un laboratorio de análisis clínicos.
En la primera instancia el objetivo estuvo centrado principalmente en la creación de una base de datos que permitiera almacenar de manera óptima la información sobre los distintos pedidos de análisis que se realizan en el laboratorio.
Luego en la segunda instancia, junto con esta presentación final, el objetivo fue llevar a cabo la inserción de datos y el trabajo el trabajo a partir de estos junto a la creación de distintos objetos de la base de datos. La idea a partir de todo esto es poder aportar a una mejora en la eficiencia del trabajo para el modelo de negocio elegido; trabajar con la base de datos y el lenguaje SQL para realizar consultas, el mantenimiento y la optimización de la DB; y aprovechar esto para una posible utilización en una etapa analítica del negocio y la toma de decisiones.


## Diagrama Entidad-Relación (D-E-R)



## Listado de tablas:
```
•   Analisis: Contiene la lista de análisis clínicos que pueden realizarse en el laboratorio y el precio de cada uno.
    o	id_analisis
    o	tipo_analisis
    o	precio

•	Staff_Bioquimica: Almacena información sobre los empleados del área de bioquímica.
    o	id_bioquimico
    o	nombre_bioquimico
    o	matricula

•	Staff_Enfermeria: Almacena información sobre los empleados del área de enfermería.
    o	id_enfermero
    o	nombre_enfermero

•	Insumos: Almacena información sobre los insumos necesarios para los análisis clínicos.
    o	id_insumo
    o	tipo_insumo
    o	fecha_vencimiento
    o	precio
    o	id_proveedor

•	Proveedor: Contiene la lista de proveedores de los cuales se obtienen los insumos así como datos generales de contacto de los mismos.
    o	id_proveedor
    o	nombre_proveedor
    o	direccion
    o	telefono

•	Pacientes: Almacena información sobre los pacientes que se realizan análisis clínicos.
    o	id_paciente
    o	nombre_completo
    o	fecha_nacimiento
    o	sexo
    o	telefono
    o	e_mail
    o	id_obra_social

•	Obra_Social: Contiene la lista de obras sociales con las cuales trabaja el laboratorio y la cobertura que proporciona cada una con respecto al precio de los análisis.
    o	id_obra_social
    o	nombre
    o	cobertura

•	Pedido_Analisis: Almacena información sobre los pedidos de análisis clínicos que se realizan en el laboratorio.
    o	id_pedido
    o	fecha
    o	id_paciente
    o	id_analisis
    o	id_bioquimico
    o	id_enfermero
    o	insumo_necesario

•	Factura: Registra las facturas emitidas por cada pedido de análisis.
    o	id_factura
    o	id_pedido
    o	id_analisis
    o	id_insumo
    o	id_obra_social
    o	precio_total

•	Archivo_Pacientes_Anteriores: Almacena información sobre pacientes eliminados de la tabla principal de pacientes y el momento en que se realizó dicha eliminación.
    o	id
    o   id_paciente_eliminado
    o   nombre_paciente
    o   fecha_nacimiento
    o   fecha_eliminacion

•	logs_precio_insumos: Tabla de auditoría que almacena información sobre las actualizaciones de los precios de los insumos, mostrando también la comparación con el precio anterior y datos sobre el usuario que realizó la actualización y cuando se realizó.
    o	id
    o   id_tabla_insumos
    o   tipo_insumo
    o   precio_actualizado
    o   precio_anterior
    o   usuario_updater
    o   fecha_modificacion
```

## Grilla de tablas con campos, tipos de datos y tipos de claves:
```
+--------------------------------------------------------------------------------------------------------------------------+
| Tabla                        | Campo	               | Nombre de campo completo	       | Tipo de dato  | Tipo de clave |
+--------------------------------------------------------------------------------------------------------------------------+
| Analisis                     | id_analisis	       | Identificador análisis	           | INT	       | PK            |
|	                           | tipo_analisis	       | Tipo de análisis	               | VARCHAR (100) |               |
|	                           | precio	               | Precio de análisis	               | DECIMAL (8,2) |               |
+--------------------------------------------------------------------------------------------------------------------------+
| Staff_bioquimica             | id_bioquimico	       | Identificador bioquímico	       | INT           | PK            |
|                              | nombre_bioquimico     | Nombre de bioquímico	           | VARCHAR (60)  |               |
|	                           | matricula	           | Matrícula de bioquímico	       | VARCHAR (25)  |               |
+--------------------------------------------------------------------------------------------------------------------------+
| Staff_enfermeria             | id_ enfermero	       | Identificador enfermero           | INT	       | PK            |
|	                           | nombre_ enfermero     | Nombre de enfermero	           | VARCHAR (60)  |               |	
+--------------------------------------------------------------------------------------------------------------------------+
| Insumos	                   | id_insumo             | Identificador insumo	           | INT	       | PK            |
|	                           | tipo_insumo	       | Tipo de insumo	                   | VARCHAR (100) |               |
|	                           | fecha_vencimiento     | Fecha de vencimiento	           | DATE	       |               |
|	                           | precio	               | Precio de insumo	               | DECIMAL (8,2) |               |
|	                           | id_proveedor	       | Identificador proveedor	       | INT	       | FK            |
+--------------------------------------------------------------------------------------------------------------------------+
| Proveedores	               | id_proveedor	       | Identificador proveedor	       | INT	       | PK            |
|	                           | nombre_proveedor	   | Nombre de proveedor	           | VARCHAR (100) |               |
|	                           | direccion	           | Dirección de proveedor	           | VARCHAR (100) |               |
|	                           | telefono	           | Teléfono de proveedor	           | VARCHAR (20)  |               |
+--------------------------------------------------------------------------------------------------------------------------+
| Pacientes	                   | id_paciente	       | Identificador paciente	           | INT	       | PK            |
|		                       | nombre_completo	   | Nombre completo de paciente	   | VARCHAR (100) |               |
|		                       | fecha_nacimiento	   | Fecha de nacimiento	           | DATE	       |               |
|		                       | sexo	               | Sexo de paciente	               | VARCHAR (9)   |               |
|		                       | telefono	           | Teléfono de paciente	           | VARCHAR (20)  |               |
|		                       | e_mail	               | E-mail de paciente	               | VARCHAR (100) |               |
|		                       | id_obra_social	       | Identificador obra social	       | INT	       | FK            |
+--------------------------------------------------------------------------------------------------------------------------+
| Obra Social                  | id_obra_social	       | Identificador obra social	       | INT	       | PK            |
|	                           | nombre	               | Nombre de obra social	           | VARCHAR (100) |               |
|	                           | cobertura	           | Cobertura de obra social	       | DECIMAL (8,2) |               |
+--------------------------------------------------------------------------------------------------------------------------+
| Pedido_Analisis              | id_pedido	           | Identificador pedido	           | INT	       | PK            |
|		                       | fecha	               | Fecha de pedido de análisis	   | DATETIME	   |               |
|		                       | id_paciente	       | Identificador paciente	           | INT	       | FK            |
|		                       | id_analisis           | Identificador análisis	           | INT	       | FK            |
|		                       | id_bioquimico         | Identificador bioquímico	       | INT	       | FK            |
|		                       | id_enfermero	       | Identificador enfermero	       | INT	       | FK            |
|		                       | insumo_necesario	   | Insumo necesario para análisis    | INT	       | FK            |
+--------------------------------------------------------------------------------------------------------------------------+
| Factura                      | id_factura	           | Identificador factura	           | INT	       | PK            |
|	                           | id_pedido	           | Identificador pedido	           | INT	       | FK            |
|	                           | id_analisis	       | Identificador análisis	           | INT	       | FK            |
|              	               | id_insumo	           | Identificador insumo	           | INT	       | FK            |
|	                           | id_obra_social	       | dentificador obra social	       | INT	       | FK            |
|	                           | precio_total	       | Precio total	                   | DECIMAL (8,2) |               |	
+--------------------------------------------------------------------------------------------------------------------------+
| Archivo_Pacientes_Anteriores | id     	           | Identificador de tabla   	       | INT	       | PK            |
|	                           | id_paciente_eliminado | Identificador paciente eliminado  | INT	       | FK            |
|	                           | nombre_paciente	   | Nombre completo de paciente	   | VARCHAR (100) |               |
|	                           | fecha_nacimiento      | Fecha de nacimiento               | DATE	       |               |
|	                           | fecha_eliminacion     | Fecha de eliminación	           | DATETIME      |               |
+--------------------------------------------------------------------------------------------------------------------------+
| logs_precio_insumos          | id	                   | Identificador de tabla	           | INT	       | PK            |
|	                           | id_tabla_insumos      | Identificador insumo	           | INT	       | FK            |
|	                           | tipo_insumo	       | Tipo de insumo	                   | INT	       |               |
|	                           | precio_actualizado    | Precio actualizado de insumo	   | DECIMAL (8,2) |               |
|	                           | precio_anterior	   | Precio anterior de insumo	       | DECIMAL (8,2) |               |
|	                           | usuario_updater	   | Usuario que realizó actualización | VARCHAR (100) |               |	
|	                           | fecha_modificacion	   | Fecha de modificación	           | DATETIME      |               |
+--------------------------------------------------------------------------------------------------------------------------+
```