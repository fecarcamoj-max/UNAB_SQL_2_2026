#### Materia de la S3. Consultas Avanzadas en SQL.
#Seleccionar base de datos a utilizar
use clase_sql;
#Mostrar data de ventas.
SELECT * FROM ventas;
#Mostrar data de persona.
SELECT * FROM persona;

#Producto cartesiano de dos tablas. personas X ventas. CRUCE TOTAL.
SELECT * FROM persona, ventas;

# Muestra TODAS las ventas con los datos de la persona. JOIN WHERE
SELECT * FROM persona, ventas
WHERE persona.id_persona = ventas.id_persona;

# JOIN SQL...
# Muestra las ventas con los datos de la persona. INNER JOIN (Intersección)
SELECT * FROM ventas as izq
INNER JOIN persona as der ON der.id_persona = izq.id_persona;

# LEFT JOIN (Unión a la izquierda).
SELECT * FROM ventas as izq
LEFT JOIN persona as der ON der.id_persona = izq.id_persona;

# Right Join:::: (Unión a la derecha).
SELECT * FROM ventas as izq
RIGHT JOIN persona as der ON izq.id_persona = der.id_persona;

# Unión consigo mismo.
# SELF JOIN ; WHERE 
# PEJ: Hacer parejas con personas que vivan en la misma ciudad.
SELECT * FROM persona as p1, persona p2
WHERE p1.ciudad = p2.ciudad and p1.id_persona != p2.id_persona;


# Forma óptima de hacer un SELF JOIN. (INNER JOIN)
SELECT * FROM persona as p1
INNER JOIN persona p2 ON p1.ciudad = p2.ciudad AND p1.id_persona <> p2.id_persona;
#REVISION DE TABLA PERSONA:::
SELECT * FROM persona;
# Operador Sindical : Union... sin duplicados :: NO DEJA DUPLICADOS, SELECT DISTINCT...
SELECT * FROM persona
UNION
SELECT * FROM persona
;

# Union ALL --- Sí deja todos los valores de ambas tablas (	NO ELIMINA DUPLICADOS )
SELECT * FROM persona
UNION ALL
SELECT * FROM persona;

# Union. Misma cantidad de columnas, diferentes columnas
SELECT id_persona as id_general, nombre FROM persona
UNION all
SELECT id_venta, fecha_venta FROM ventas;

# Consulta ANIDADA
SELECT * FROM ( 
	SELECT id_persona, nombre FROM persona
    ) as p_reducido;
    
# CONSULTA ANIDADA: PEJ: MOSTRAR LA ÚLTIMA.
SELECT * FROM (	
    SELECT * FROM ventas ORDER BY id_venta desc limit 1
    ) as ultima_venta;

## Muestra a las personas QUE NO TENGAN VENTAS. # QANIDADA, SUBQ, SUBCONSULTA
SELECT * FROM persona
WHERE id_persona NOT IN (SELECT id_persona FROM ventas);

# Creación de vistas y tablas respaldos
# VISTAS: PEJ: Queremos ver siempre a las personas que NO TIENEN VENTAS.
CREATE VIEW personas_sin_ventas AS
SELECT * FROM persona
WHERE id_persona NOT IN (SELECT id_persona FROM ventas);
# VER VISTA:::
SELECT * FROM personas_sin_ventas;
# Motor de recomendación IA débil, Dar prioridad a los clientes que no han tenido venta
# Para iniciar una campaña de marketing::::::
SELECT * FROM personas_sin_ventas
UNION
SELECT * FROM persona;

# CREACIÓN DE TABLAS DE RESPALDO:::::::::::::
CREATE DATABASE respaldo;
CREATE TABLE respaldo.persona_backup AS
SELECT * FROM clase_sql.persona;

# Validación de creación de una vista


# JOIN Consulta anidada:: Mostrar las ventas de las últimas 2 personas registradas.


# Creación de vista en base a join de ultimas ventas llamadas ultimos clientes ventas::::

# FULL OUTER JOIN. 
