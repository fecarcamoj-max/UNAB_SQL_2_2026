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

#Ejemplo: MUESTRA A LA PERSONA CON MAYOR PUNTAJE:
SELECT * FROM persona ORDER BY puntaje DESC LIMIT 1; 
#limit siempre va al final

# DML PUEDEN EJECUTAR OPERACIONES::::
SELECT * FROM persona;
# EJ: PUNTAJE + 1000 PTOS DE REGALO.
SELECT id, nombre, puntaje + 1000 FROM persona;
# Otros ejemplos en base al caso anterior (mutaciones)
SELECT id, nombre, puntaje + 1000 as nuevo_ptj FROM persona;
SELECT id, nombre, puntaje - 10 as nuevo_ptj FROM persona;
SELECT id, nombre, puntaje / 2 as nuevo_ptj FROM persona;
SELECT id, nombre, puntaje * 1.5 as nuevo_ptj FROM persona;

# OPERACIONES DE AGREGACIÓN:::::: DML SELECT.
# EJ: Muestra la cantidad de personas en la app.
SELECT COUNT(*) as cantidad_p FROM persona;
SELECT COUNT(id) as cantidad_p FROM persona;
# EJ: MUESTRA EL PUNTAJE MÁXIMO de las personas.
SELECT MAX(puntaje) as max_ptj FROM persona;
# EJ: Muestra el puntaje mínimo de las personas.
SELECT MIN(puntaje) as min_ptj FROM persona;
# EJ: Muestra el puntaje promedio de las personas.
SELECT AVG(puntaje) as promedio FROM persona;
# MOSTRAR VALORES ÚNICOS (ELIMINAR REPETIDOS)
SELECT activo FROM persona;
SELECT DISTINCT activo FROM persona; #Se muestran los valores únicos

#SELECT WHERE -> Filtrar información.
SELECT * FROM persona;
# PEJ: Muestra a la persona con ID 24.
SELECT * FROM persona WHERE id = 24;
# PEJ: Muestra a las personas con puntaje mayor a 250.
SELECT * FROM persona WHERE puntaje > 250; #LIMIT...
# PEJ: Muestra a las personas con puntaje menor o igual 250.
SELECT * FROM persona WHERE puntaje <= 250;
# PEJ: Muestra a las personas con ids 24 y 25.
SELECT * FROM persona WHERE id in (24,25);
# PEJ: Muestra a las personas que NO tengan id 24 y 25.
SELECT * FROM persona WHERE id NOT in (24, 25);
# Operaciones y filtros de fecha. WHERE 
SELECT * FROM persona;
# PEJ: QUIÉN NACIÓ EL 20 DE MARZO DEL 95.
SELECT * FROM persona WHERE fecha_nacimiento = "1995-03-20";
# PEJ: QUIÉN NACIÓ DESPUÉS DEL 01 DE ENERO DEL 1995.
SELECT * FROM persona WHERE fecha_nacimiento > "1995-01-01";
# PEJ: CUÁNTOS NACIERON DESDE DEL 01 DE ENERO DEL 1995.
SELECT COUNT(id) FROM persona WHERE fecha_nacimiento >= "1995-01-01"; 
# OPERACIONES DE FECHAS:
SELECT fecha_nacimiento, fecha_registro FROM persona;
# MOSTRAR AÑO de la fecha:
SELECT YEAR(fecha_nacimiento), YEAR(fecha_registro) FROM persona;
# MOSTRAR EL MES DE LA FECHA:
SELECT MONTH(fecha_nacimiento), MONTH(fecha_registro) FROM persona;
# Día y semana
SELECT DAY(fecha_nacimiento), WEEK(fecha_registro) FROM persona;
# PEJ: valores numéricos como fechas -> RANGOS:
# PEJ1: MUESTRA A LOS PUNTAJES ENTRE 150 Y 350.
SELECT * FROM persona WHERE puntaje >= 150 AND puntaje <= 350;
SELECT * FROM persona WHERE puntaje between 150 AND 350;
# PEJ2: MOSTRAR A LAS PERSONAS QUE NACIERON ENTRE 1994 Y 2000.
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) between 1994 and 2000;
SELECT * FROM persona WHERE fecha_nacimiento >= "1994-01-01" AND
fecha_nacimiento < "2000-01-01";

# WHERE COMODÍN LIKE
SELECT * FROM persona;
# PEJ: MUESTRA A LAS PERSONAS QUE EN SU APELLIDO TENGAN UNA LETRA A
SELECT * FROM persona WHERE apellido LIKE '%a%';
# PEJ: MUESTRA A LAS PERSONAS QUE EN SU APELLIDO TENGAN UNA LETRA O
SELECT * FROM persona WHERE apellido LIKE '%o%';
# PEJ: MUESTRA A LAS PERSONAS QUE EN SU APELLIDO TENGAN UNA LETRA I
SELECT * FROM persona WHERE apellido LIKE '%i%';
# PEJ: MUESTRA A LOS APELLIDOS QUE PARTEN CON R.
SELECT * FROM persona WHERE apellido LIKE 'R%';
# PEJ: MUESTRA A LOS APELLIDOS QUE PARTEN CON z.
SELECT * FROM persona WHERE apellido LIKE '%z';
# UPDATE... Actualizar datos.
# PERMITE ACTUALIZAR DATOS EN EL TOTAL DE UNA TABLA O POR 
# REGISTRO ESPECÍFICO (WHERE).
SELECT * FROM persona; 
# PEJ: NECESITAMOS REINICIAR TODOS LOS PUNTAJES A 0.
# siempre que ejecuten DELETE, UPDATE, DROP, ETC. TRABAJAR CON 
# TRANSACTION....
START TRANSACTION; # INICIAR TRANSACCIÓN
UPDATE persona SET puntaje = 0;
COMMIT; # CONFIRMAR TRANSACCION
ROLLBACK; # ME ARREPIENTO Y VUELVO ATRÁS
# PEJ: NECESITO ACTUALIZAR EL numero de Pablo.
START TRANSACTION;
UPDATE persona SET numero = 11111 WHERE id = 24;
ROLLBACK;
COMMIT;
SELECT * FROM persona;


