/* ACTUALIZAR TOTALES Y VALIDAR DISPONIBILIDAD
   Con esta función cada que se agrega un producto a detalle_orden:
   1)Valida que el producto exista.
   2)Valida que esté disponible.
   3)Calcula subtotal_prod = cant_prod * precio.
   4)Actualiza total_pagar de la orden.
*/

-- Aquí se valida la disponibilidad y se calcula el subtotal del producto
CREATE OR REPLACE FUNCTION fn_calcular_subtotal()
RETURNS TRIGGER AS $$
DECLARE
    precio_prod NUMERIC(10,2);
    disponible BOOLEAN;
BEGIN
    SELECT precio, disponibilidad
    INTO precio_prod, disponible
    FROM producto
    WHERE id_producto = NEW.id_producto;

    IF precio_prod IS NULL THEN
        RAISE EXCEPTION 'El producto con id % no existe.', NEW.id_producto;
    END IF;

    IF disponible = FALSE THEN
        RAISE EXCEPTION 'El producto con id % no está disponible.', NEW.id_producto;
    END IF;

    NEW.subtotal_prod := NEW.cant_prod * precio_prod; -- Aquí se calcula el total por producto

    RETURN NEW; --Regresa el registro nuevo ya modificado
END;
$$ LANGUAGE plpgsql;


--Acá se actualiza el total de la orden
CREATE OR REPLACE FUNCTION fn_actualizar_totalOrden()
RETURNS TRIGGER AS $$
DECLARE
    v_folio VARCHAR(10); --Acá se guarda el folio de la orden que debe actualizarse
BEGIN
    IF TG_OP = 'DELETE' THEN --TG_OP guarda qué operación activó el trigger (INSERT, UPDATE O DELETE)
        v_folio := OLD.folio; --Si es DELETE el folio se encuentra en OLD, porque el registro ya no existe
    ELSE
        v_folio := NEW.folio; --Si es UPDATE O INSERT el folio se encuentra en NEW
    END IF;

    UPDATE orden
    SET total_pagar = COALESCE(( --COALESCE sirve para evitar que el total quede en NULL, si no hay productos, queda en 0
        SELECT SUM(subtotal_prod)
        FROM detalle_orden
        WHERE folio = v_folio
    ), 0)
    WHERE folio = v_folio;

    RETURN NULL; --Como este trigger se ejecuta después de insertar, actualizar o eliminar ya no necesita modificar el registro
END;
$$ LANGUAGE plpgsql;


--Trigger 1: antes de insertar o modificar un producto en la orden
CREATE TRIGGER trg_calcular_subtotal
BEFORE INSERT OR UPDATE OF id_producto, cant_prod
ON detalle_orden
FOR EACH ROW EXECUTE FUNCTION fn_calcular_subtotal();


--  Trigger 2: después de insertar, actualizar o eliminar detalle de orden
CREATE TRIGGER trg_actualizar_totalOrden
AFTER INSERT OR UPDATE OR DELETE
ON detalle_orden
FOR EACH ROW EXECUTE FUNCTION fn_actualizar_totalOrden();