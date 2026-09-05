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

#DML DELETE - ELIMINAR TODOS LOS DATOS DE UNA TABLA
DELETE FROM persona;

#DML INSERT MULTIPLE:
INSERT INTO persona 
(nombre, apellido, direccion, puntaje, numero,
fecha_nacimiento, fecha_registro, activo, observacion)
VALUES 
("Felipe", "Carcamo", "Av calle 123", 100 , 567890,
"1993-04-26", "2026-01-01", 1, "ok"),
("Pablo", "Astorga", "Av calle 321", 200 , 567765,
"1995-03-20", "2026-01-03", 0, "NO OK"),
("Lola", "Ramirez", "Av calle 444", 300 , 567465,
"1997-03-24", "2026-02-03", 1, "ok")
;
#DML SELECT.
SELECT * FROM persona;
#SELECT TRAER COLUMNAS ESPECÍFICAS:
SELECT id, nombre, apellido, puntaje FROM persona;
# SELECT LIMIT , LIMITA LA CANTIDAD DE RESULTADOS A MOSTRAR.
SELECT * FROM persona LIMIT 1;
# SELECT ORDER BY.. ORDENAR POR COLUMNA
SELECT * FROM persona ORDER BY puntaje;
# SELECT ORDER BY.. ORDENAR POR COLUMNA MAYOR A MENOR.
SELECT * FROM persona ORDER BY puntaje DESC;
#SELECT WHERE.



