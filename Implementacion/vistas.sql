    CREATE OR REPLACE VIEW platillo_mas_vendido AS 
    SELECT p.id_producto, p.nombre, p.descripcion, p.precio, p.disponibilidad, p.receta, SUM(d.cant_prod) AS total_vendido
    FROM producto p
    JOIN detalle_orden d ON p.id_producto = d.id_producto
    WHERE p.tipo_producto = 'PLATILLO'
    GROUP BY p.id_producto, p.nombre, p.descripcion, p.precio, p.disponibilidad, p.receta
    ORDER BY total_vendido DESC
    LIMIT 1;

    CREATE OR REPLACE VIEW vista_sim_fac AS 
    SELECT 
        f.id_factura, 
        f.fecha_emision, 
        c.rfc, 
        c.razon_social,
        CASE 
            WHEN c.ap_mat IS NULL THEN c.nombre || ' ' || c.ap_pat
            ELSE c.nombre || ' ' || c.ap_pat || ' ' || c.ap_mat
        END AS nombre_cliente_completo,
        c.calle, c.numero, c.colonia, c.cp, c.estado,
        c.email,
        o.folio,
        o.fecha,
        o.total_pagar,
        p.monto_pago
    FROM factura f
    JOIN cliente c ON f.id_cliente = c.id_cliente
    JOIN orden o ON f.folio = o.folio
    JOIN pago p ON f.folio = p.folio AND f.id_cliente = p.id_cliente;