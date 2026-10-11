USE Ventas_Tech_DB;

-- CONSULTA 1: VISTA BASE DEL PROYECTO

SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.segmento,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    t.region
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
INNER JOIN territorios t ON v.id_territorio = t.id_territorio;

-- CONSULTA 2: CLIENTES SIN VENTAS

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

-- CONSULTA 3: PRODUCTOS SIN VENTAS

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

-- CONSULTA 4: CONSOLIDADO POR CANAL

SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Primera mitad de marzo' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) <= 10

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Segunda mitad de marzo' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) > 10
) AS consolidado
GROUP BY canal;


-- HALLAZGOS

-- 1. La vista base integra ventas con información de clientes,
--    productos, categorías y regiones, generando una fuente enriquecida
--    para el análisis posterior en Power BI.

-- 2. No se encontraron clientes sin ventas registradas.

-- 3. No se encontraron productos del catálogo sin ventas registradas.

-- 4. El consolidado muestra una facturación de 3620.00 en la primera
--    mitad de marzo y 2824.00 en la segunda mitad.
--    La facturación total del período es de 6444.00.