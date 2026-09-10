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
SELECT * FROM ventas
INNER JOIN persona ON persona.id_persona = ventas.id_persona;

# LEFT JOIN (Unión a la izquierda).
SELECT * FROM ventas
LEFT JOIN persona ON persona.id_persona = ventas.id_persona;

# Right Join:::: (Unión a la derecha).
SELECT * FROM ventas
RIGHT JOIN persona ON persona.id_persona = ventas.id_persona;

# SELF JOIN ; WHERE # Hacer parejas con personas que vivan en la misma ciudad.


# Forma óptima de hacer un SELF JOIN. (INNER JOIN)


# Operador Sindical : Union... sin duplicados


# Union ALL


# Union. Misma cantidad de columnas, diferentes columnas


# Consulta ANIDADA

## Muestra a las personas QUE NO TENGAN VENTAS.

# Creación de vistas y tablas respaldos

# Validación de creación de una vista


# JOIN Consulta anidada:: Mostrar las ventas de las últimas 2 personas registradas.


# Creación de vista en base a join de ultimas ventas llamadas ultimos clientes ventas::::

# FULL OUTER JOIN. 
