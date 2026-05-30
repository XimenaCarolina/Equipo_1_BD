/* ============================================================
   ÍNDICE PARA CONSULTAS POR FECHA DE ORDEN
   ============================================================ */

CREATE INDEX idx_orden_fecha
ON orden(fecha);
