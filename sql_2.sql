# DML: DATA MANIPULATION LANGUAGE.
show databases;
use unab_1;

SHOW TABLES FROM unab_1;

SHOW COLUMNS FROM persona;

#DML: SELECT.
# SELECCIONAR TODAS LAS COLUMNAS DE TABLA PERSONA.
SELECT * FROM persona;# * = TODO.

#DML: INSERT... # UNIQUE 
INSERT INTO persona 
(nombre, apellido, direccion, puntaje, numero,
fecha_nacimiento, fecha_registro, activo, observacion)
VALUES 
("Felipe", "Carcamo", "Av calle 123", 100 , 567890,
"1993-04-26", "2026-01-01", 1, "ok");