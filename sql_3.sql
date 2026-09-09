CREATE DATABASE clase_unab_09092026;
DROP DATABASE clase_unab_09092026;
use clase_unab_09092026;

CREATE TABLE persona(
	id bigint PRIMARY KEY auto_increment, # BIG INTEGER GRAN ENTERO
    rut varchar(20) UNIQUE, #varchar es texto con caracteres limitados.
    nombre TEXT, # TEXTO LARGO 1000 o más.
    apellido LONGTEXT, # Texto más largo que TEXT.
    fecha_nacimiento DATE, # YYYY-MM-DD
    fecha_hora_registro DATETIME, # YYYY-MM-DD HH:mm:s
    estatura double, # Tipo de dato de número con decimales.
    edad_actual int(3) NULL
);

ALTER TABLE persona -- ALTERAR/MODIFICAR TABLA
	ADD COLUMN rol varchar(30) default 'nuevo',
    MODIFY COLUMN edad_actual int(2) default 1; #CHANGE
    
# DML INSERTAR VALORES EN LA TABLA persona:
INSERT persona 
(rut, nombre, apellido, fecha_nacimiento, fecha_hora_registro, estatura) 
VALUES
("123", "bob", "stark", "2025-01-01", "2026-05-07 13:45:00", 1.890),
("321", "rob", "stark", "2024-02-02", "2025-04-01 00:00:00", 1.710)
;

INSERT persona 
(rut, nombre, apellido, fecha_nacimiento, fecha_hora_registro, estatura) 
VALUES
("456", "TOP", "stark", "2025-03-01", "2021-05-07 13:12:00", 1.49),
("567", "IAN", "stark", "2024-04-02", "2019-04-01 00:00:00", 1.51)
;

INSERT persona (rut, nombre, apellido, fecha_nacimiento, fecha_hora_registro,
estatura, edad_actual, rol) VALUES
("111", "rop", "POV", "2023-01-01", NULL, 1.60, 30, "admin"),
("222", "raf", "POV", "2019-01-01", NULL, 1.70, 40, "KAM");

# SUM

# CASE.

# AGRUPACIÓN POR TABLA ÚNICA. 

##Muestra cuántas veces aparece un apellido en específico.

##Mostrar cuántas veces aparece un apellido, cuál es el promedio de  estatura por apellido.

### Mostrar cuantos nacimientos hubieron por año. 

### HAVING ### Mostrar los años en que nacieron más de una persona. 

# WITH ROLLUP:::
##Mostrar cuántas veces aparece un apellido, cuál es el promedio de  estatura por apellido con el total de filas al final.
