#Solución Guía Cubo OLAP.
SELECT * FROM fact_ventas; #ventas
SELECT * FROM dim_tiempo;
SELECT * FROM dim_producto;
SELECT * FROM dim_cliente;
#1. Obtener el total de ventas por producto.
SELECT p.producto_id, p.nombre_producto, SUM(total_venta) as total,
count(*) as cantidad
FROM fact_ventas as v
INNER JOIN dim_producto as p ON p.producto_id = v.producto_id
GROUP BY producto_id;
#2. Calcular el total de ventas por categoría de producto.
SELECT p.categoria, SUM(v.total_venta) as total FROM fact_ventas as v
INNER JOIN dim_producto as p ON v.producto_id = p.producto_id
GROUP BY p.categoria
;
#3. Mostrar el total de ventas por mes.
SELECT * FROM fact_ventas;
SELECT * FROM dim_tiempo;
#Respuesta defintiva: 
SELECT t.anio, t.mes, t.nombre_mes, SUM(total_venta) FROM fact_ventas as v 
INNER JOIN dim_tiempo as t ON t.tiempo_id = v.tiempo_id
GROUP BY t.anio, t.mes, t.nombre_mes
;
#4. Obtener las ventas totales por ciudad.
SELECT c.ciudad, SUM(total_venta) as total FROM fact_ventas as v
INNER JOIN dim_cliente as c ON c.cliente_id = v.cliente_id
GROUP BY c.ciudad
;
#5. Calcular la cantidad total vendida por producto y mes.
SELECT t.anio, t.mes, t.nombre_mes, p.producto_id, p.nombre_producto,
COUNT(v.venta_id) as total, SUM(total_venta) as total_$
FROM fact_ventas as v
INNER JOIN dim_tiempo as t ON t.tiempo_id = v.tiempo_id
INNER JOIN dim_producto as p ON p.producto_id = v.producto_id
GROUP BY t.anio, t.mes, t.nombre_mes, p.producto_id, p.nombre_producto
;
#6. Mostrar las ventas totales por cliente y año.
SELECT t.anio, c.cliente_id, c.nombre_cliente, SUM(v.total_venta) as $
FROM fact_ventas as v
INNER JOIN dim_tiempo as t ON t.tiempo_id = v.tiempo_id
INNER JOIN dim_cliente as c ON c.cliente_id = v.cliente_id
GROUP BY t.anio, c.cliente_id, c.nombre_cliente
;
#7. Obtener el total de ventas por trimestre.
SELECT t.anio, t.trimestre, SUM(v.total_venta) as total 
FROM fact_ventas as v 
INNER JOIN dim_tiempo as t ON t.tiempo_id = v.tiempo_id
GROUP BY t.anio, t.trimestre
;
#8. Mostrar las ventas por producto incluyendo el total general utilizando ROLLUP.
SELECT p.producto_id, p.nombre_producto, SUM(v.total_venta) 
FROM fact_ventas as v 
INNER JOIN dim_producto as p ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.nombre_producto
with rollup
;

#9. Obtener los 3 productos con mayor monto de ventas.
SELECT p.nombre_producto, SUM(total_venta) FROM fact_ventas as v
INNER JOIN dim_producto as p ON p.producto_id = v.producto_id
GROUP BY p.nombre_producto
ORDER BY SUM(total_venta) DESC
LIMIT 3
;
#10. Mostrar las ventas totales por categoría de producto y ciudad.
SELECT c.ciudad, p.nombre_producto, SUM(v.total_venta) FROM fact_ventas as v
INNER JOIN dim_producto as p ON p.producto_id = v.producto_id
INNER JOIN dim_cliente as c ON c.cliente_id = v.cliente_id
GROUP BY c.ciudad, p.nombre_producto;
