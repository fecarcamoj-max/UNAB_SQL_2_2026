# DDL
# Crear base de datos
CREATE DATABASE unab_1;
# Eliminar la base de datos:::
DROP DATABASE unab_1;
# Seleccionar la bds a usar.
use unab_1;

# Creación de tablas SQL DDL.
CREATE TABLE persona(
	# Columnas...
    # Nombre_Col Tipo_dato, Restriccion;
    id BIGINT PRIMARY KEY auto_increment, #BIGINT = GRAN NÚMERO.
    nombre TEXT NOT NULL, #NOT NULL -> OBLIGATORIO.
    apellido VARCHAR(30) NULL, #NULL opcional.
    direccion LONGTEXT, #Opcional, LONG TEXT -> TEXTO LARGO.
    puntaje int(10), #MÁS PEQUEÑO QUE BIGINT, 10 dígitos.
    numero tinyint, # Un solo dígito
    fecha_nacimiento DATE NOT NULL, # YYYY-MM-DD
    fecha_registro DATETIME, # YYYY-MM-DD HH:mm:ss
    activo boolean, #Verdadero o Falso
	activo_dos int(1) # int(1) = tinyint
);

### Modificar una tabla.... ALTER.
# Agregar una columna::
ALTER TABLE persona 
	ADD COLUMN observacion LONGTEXT NULL;

#Eliminar una columna...
ALTER TABLE persona
	DROP COLUMN activo_dos;

#Modificar una columna::::
ALTER TABLE persona
	MODIFY COLUMN numero INT(5) NOT NULL;

# CONSULTAS DE SERVIDOR:::
# Mostrar todas las bases de datos del servidor;
SHOW DATABASES;
#MOSTRAR TODAS LAS TABLAS DE UNA BASE DE DATOS:
SHOW TABLES FROM unab_1;
SHOW TABLES FROM mysql; # mysql es bds de sistema
#MOSTRAR TODAS LAS COLUMNAS DE UNA TABLA::::
SHOW COLUMNS FROM persona;

# Hacer mención a una dbs en específico
# base_de_datos.tabla.columna
SHOW COLUMNS FROM mysql.user;

# DML:::::::: CONSULTAR DATOS DE UNA TABLA.
SELECT * FROM mysql.user;






