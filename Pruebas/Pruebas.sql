/* ============================================================
   1) VERIFICAR CARGA DE DATOS
   ============================================================ */

SELECT 'empleado' AS tabla, COUNT(*) AS total FROM empleado
UNION ALL SELECT 'telefono_empleado', COUNT(*) FROM telefono_empleado
UNION ALL SELECT 'mesero', COUNT(*) FROM mesero
UNION ALL SELECT 'horario_mesero', COUNT(*) FROM horario_mesero
UNION ALL SELECT 'cocinero', COUNT(*) FROM cocinero
UNION ALL SELECT 'administrativo', COUNT(*) FROM administrativo
UNION ALL SELECT 'dependiente', COUNT(*) FROM dependiente
UNION ALL SELECT 'cliente', COUNT(*) FROM cliente
UNION ALL SELECT 'persona_fisica', COUNT(*) FROM persona_fisica
UNION ALL SELECT 'persona_moral', COUNT(*) FROM persona_moral
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'producto', COUNT(*) FROM producto
UNION ALL SELECT 'orden', COUNT(*) FROM orden
UNION ALL SELECT 'detalle_orden', COUNT(*) FROM detalle_orden
UNION ALL SELECT 'pago', COUNT(*) FROM pago
UNION ALL SELECT 'factura', COUNT(*) FROM factura;


/* ============================================================
   2) VERIFICAR FOLIOS
   ============================================================ */

SELECT folio, num_mesero, fecha, total_pagar
FROM orden
ORDER BY folio;


/* ============================================================
   3) VERIFICAR SUBTOTALES CALCULADOS POR TRIGGER
   ============================================================ */

SELECT 
    d.folio,
    d.id_producto,
    p.nombre,
    d.cant_prod,
    p.precio,
    d.subtotal_prod
FROM detalle_orden d
JOIN producto p
    ON d.id_producto = p.id_producto
WHERE d.folio = 'ORD-001';


/* ============================================================
   4) VERIFICAR QUE total_pagar = SUMA DE SUBTOTALES
   ============================================================ */

SELECT 
    o.folio,
    o.total_pagar,
    SUM(d.subtotal_prod) AS suma_detalles
FROM orden o
JOIN detalle_orden d
    ON o.folio = d.folio
GROUP BY o.folio, o.total_pagar
ORDER BY o.folio;


/* ============================================================
   5) VERIFICAR PRODUCTOS NO DISPONIBLES
   ============================================================ */

SELECT id_producto, nombre, disponibilidad
FROM producto
WHERE disponibilidad = FALSE;


/* ============================================================
   6) PRUEBA SEGURA: PRODUCTO NO DISPONIBLE
   Esta prueba debe mostrar un NOTICE con el error esperado.
   No deja datos guardados.
   ============================================================ */

DO $$
BEGIN
    BEGIN
        INSERT INTO orden (folio, num_mesero, fecha)
        VALUES ('ORD-999', 1, CURRENT_TIMESTAMP);

        INSERT INTO detalle_orden (folio, id_producto, cant_prod)
        VALUES ('ORD-999', 1, 1);

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Prueba correcta: %', SQLERRM;
    END;
END;
$$;

DELETE FROM detalle_orden WHERE folio = 'ORD-999';
DELETE FROM orden WHERE folio = 'ORD-999';


/* ============================================================
   7) PRUEBA SEGURA: PRODUCTO DISPONIBLE
   Se usa ROLLBACK para no guardar la orden de prueba.
   ============================================================ */

BEGIN;

INSERT INTO orden (folio, num_mesero, fecha)
VALUES ('ORD-998', 1, CURRENT_TIMESTAMP);

INSERT INTO detalle_orden (folio, id_producto, cant_prod)
VALUES ('ORD-998', 30, 2);

SELECT 
    d.folio,
    p.nombre,
    d.cant_prod,
    p.precio,
    d.subtotal_prod
FROM detalle_orden d
JOIN producto p
    ON d.id_producto = p.id_producto
WHERE d.folio = 'ORD-998';

SELECT folio, total_pagar
FROM orden
WHERE folio = 'ORD-998';

ROLLBACK;


/* ============================================================
   8) PROBAR VISTA: PLATILLO MÁS VENDIDO
   ============================================================ */

SELECT *
FROM platillo_mas_vendido;


/* ============================================================
   9) PROBAR VISTA: SIMULACIÓN DE FACTURA
   ============================================================ */

SELECT *
FROM vista_sim_fac
WHERE folio = 'ORD-001';

SELECT *
FROM vista_sim_fac
ORDER BY folio;


/* ============================================================
   10) PROBAR FUNCIÓN: RENDIMIENTO DE VENTAS
   ============================================================ */

SELECT *
FROM rendimiento_ventas(
    '2025-03-08 00:00:00',
    '2025-08-21 23:59:59'
);


/* ============================================================
   11) PROBAR FUNCIÓN: RENDIMIENTO DE MESERO
   ============================================================ */

SELECT *
FROM rendimiento_mesero(1, '2025-01-15');

/* ============================================================
   12) PROBAR FUNCIÓN: RENDIMIENTO DE MESERO si no hay mesero
   ============================================================ */

BEGIN;
SELECT *
FROM rendimiento_mesero(8, '2025-01-15');
ROLLBACK;


/* ============================================================
   13) VERIFICAR ÍNDICE
   ============================================================ */

SELECT indexname, tablename
FROM pg_indexes
WHERE tablename = 'orden';


/* ============================================================
   14) CONSULTA QUE JUSTIFICA EL ÍNDICE
   ============================================================ */

SELECT 
    COUNT(*) AS total_ventas,
    SUM(total_pagar) AS monto_total
FROM orden
WHERE fecha BETWEEN '2025-12-01 00:00:00'
                AND '2025-12-31 23:59:59';


/* ============================================================
   15) PLAN DE EJECUCIÓN
   Puede salir Seq Scan porque hay pocos registros.
   ============================================================ */

EXPLAIN
SELECT 
    COUNT(*) AS total_ventas,
    SUM(total_pagar) AS monto_total
FROM orden
WHERE fecha BETWEEN '2025-12-01 00:00:00'
                AND '2025-12-31 23:59:59';


/* ============================================================
   16) PLAN DE EJECUCIÓN FORZANDO EL USO DEL ÍNDICE
   Solo es para evidencia. Después se reactiva enable_seqscan.
   ============================================================ */

SET enable_seqscan = OFF;

EXPLAIN
SELECT 
    COUNT(*) AS total_ventas,
    SUM(total_pagar) AS monto_total
FROM orden
WHERE fecha BETWEEN '2025-12-01 00:00:00'
                AND '2025-12-31 23:59:59';

SET enable_seqscan = ON;