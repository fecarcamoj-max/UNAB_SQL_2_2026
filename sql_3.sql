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

SELECT * FROM persona;

# SUM PEJ: SUMAR TODAS LAS EDADES
SELECT SUM(edad_actual) as suma_edades FROM persona;

# CASE. ###### # CREAR CAMPO ETAPA: INF, ADOL, ADUL, TED.
# CASO EJEMPLO
SELECT 
	*,
	# EN EL CASO CUANDO edad_actual sea mayor o igual que 18 entonces es mayor de edad SINO es menor de edad FIN. (SI SINO)
	CASE WHEN edad_actual >= 18 THEN 'MAYOR EDAD' ELSE 'MENOR EDAD' END AS ETAPA FROM persona;

# CASO COMPLETO: SI SI NO ANIDADO O CASE MULTIPLE.

SELECT *,
	CASE WHEN edad_actual <= 14 THEN "INF" ELSE
		CASE WHEN edad_actual between 14 and 18 THEN "ADOL" ELSE
			CASE WHEN edad_actual between 18 and 65 THEN "ADUL" ELSE "3ERA EDAD" END
		END
	END
    as ETAPA
    FROM persona;
	
# AGRUPACIÓN POR TABLA ÚNICA. 
## GROUP BY
SELECT * FROM persona;
###PEJ: Muestra cuántas veces aparece un apellido en específico.
#INCORRECTO: # SELECT apellido, count(*) from persona; 
#CORRECTO:::
SELECT apellido, count(*) from persona
GROUP BY apellido;

# Mostrar cuántas veces aparece un nombre en la tabla persona:::
SELECT nombre, count(*) FROM persona group by nombre;

##Mostrar cuántas veces aparece un apellido, cuál es el promedio de  estatura por apellido.
SELECT apellido, count(*), avg(estatura) FROM persona
group by apellido
;

##Mostrar cuántas veces aparece un apellido, cuál es el promedio de  estatura por apellido,
### LA SUMA DE LAS EDADES Y EL PROMEDIO DE LAS EDADES:::
SELECT 
	apellido, count(*) as total_filas, avg(estatura) as prom_estatura, 
	SUM(edad_actual) as suma_edades, AVG(edad_actual) as prom_edad
FROM persona
GROUP BY apellido; 

### Mostrar cuantos nacimientos hubieron por año.
SELECT YEAR(fecha_nacimiento), count(*) as nacimientos FROM persona GROUP BY YEAR(fecha_nacimiento) ;

### HAVING ### Mostrar los años en que nacieron más de una persona. 
SELECT YEAR(fecha_nacimiento), count(*) as nacimientos FROM persona GROUP BY YEAR(fecha_nacimiento) 
HAVING count(*) > 1; # HAVING ES UN WHERE en un GROUP BY.

# WITH ROLLUP:::
##Mostrar cuántas veces aparece un apellido
# con el total de filas al final.
SELECT apellido , count(*), avg(edad_actual), SUM(edad_actual) FROM persona GROUP BY apellido
WITH ROLLUP; # Se muestran los totales en una fila extra.
