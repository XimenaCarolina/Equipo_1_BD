
## Arquitectura del Modelo (EER) !! ULTIMA ACUTALIZACIÓN 22/05/2006 12:47

El esquema de la base de datos resuelve requerimientos operativos complejos mediante las siguientes estructuras:

### 1. Gestión de Personal (Jerarquía con Solapamiento)
La entidad central `EMPLEADO` almacena la información base (`num_empleado`, `rfc`, `nombre`, `domicilio`, `fecha_nac`, `sueldo`, `foto`).
* **Atributo Multivaluado:** Los `telefonos` se normalizan en una tabla separada para permitir múltiples formas de contacto.
* **Atributo Derivado:** La `edad` es un campo calculado en tiempo de ejecución a partir de la `fecha_nac`, por lo que no se persiste físicamente.
* **Herencia (Overlapping 'o'):** El modelo permite que un empleado ocupe múltiples roles simultáneamente. Se derivan tres entidades:
  * `MESERO` (horario)
  * `COCINERO` (especialidad)
  * `ADMINISTRATIVOS` (rol)
* **Entidad Débil:** Los familiares se gestionan en `DEPENDIENTE` (`curp`, `nombre`, `parentesco`), cuya existencia depende enteramente de la llave del `EMPLEADO` (relación 1:M *Depende*).

### 2. Gestión de Inventario (Jerarquía Disjunta)
Los productos a la venta se administran desde la entidad fuerte `CONSUMIBLE` (`id_consumible`, `nombre`, `descripcion`, `receta`, `precio`, `disponibilidad`).
* **Clasificación:** Cada consumible *Pertenece* (1:M) a una `CATEGORIA` (`id_categoria`, `nombre`, `descripcion`).
* **Herencia (Disjoint 'd'):** Un consumible se categoriza estrictamente como uno de los siguientes (no puede ser ambos):
  * `PLATILLO`
  * `BEBIDA`

### 3. Flujo Transaccional de Órdenes
El núcleo de ventas conecta empleados, clientes y consumibles:
* **Entidad Central:** `ORDEN` registra cada transacción (`folio`, `fecha_hora`, `total`).
* **Relaciones Operativas:**
  * Un `CLIENTE` (`id_cliente`, `rfc`, `razon_social`, `nombre`, `fecha_nac`, `email`, `domicilio`) *Solicita* (1:M) una orden.
  * Un `MESERO` *Levanta* (1:M) una orden.
* **Detalle de Orden (N:M):** La relación *Contiene* entre `ORDEN` y `CONSUMIBLE` genera una tabla transaccional que captura la cantidad (`cant_elem`) y el precio exacto al momento de la venta (`precio_elem`), protegiendo el histórico de ventas ante futuros cambios en el menú.

---

## 🗄️ Esquema Relacional (Diccionario de Datos)

* **EMPLEADO** (**`num_empleado`**, rfc, nombre, domicilio, fecha_nac, sueldo, foto)
* **EMPLEADO_TELEFONO** (***`num_empleado`***, **`telefono`**)
* **DEPENDIENTE** (***`num_empleado`***, **`curp`**, nombre, parentesco)
* **MESERO** (***`num_empleado`***, horario)
* **COCINERO** (***`num_empleado`***, especialidad)
* **ADMINISTRATIVOS** (***`num_empleado`***, rol)
* **CLIENTES** (**`id_cliente`**, rfc, razon_social, nombre, fecha_nac, email, domicilio)
* **CATEGORIA** (**`id_categoria`**, nombre, descripcion)
* **CONSUMIBLE** (**`id_consumible`**, *`id_categoria`*, nombre, descripcion, receta, precio, disponibilidad)
* **PLATILLO** (***`id_consumible`***)
* **BEBIDA** (***`id_consumible`***)
* **ORDEN** (**`folio`**, *`id_cliente`*, *`num_empleado_mesero`*, fecha_hora, total)
* **ORDEN_CONSUMIBLE** (***`folio`***, ***`id_consumible`***, cant_elem, precio_elem)

*(Llaves Primarias en **negrita**, Llaves Foráneas en cursiva).*

---
