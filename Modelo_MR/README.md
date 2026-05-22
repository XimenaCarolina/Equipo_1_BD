## Modelo Relacional (MR) !! FECHA DE ACTUALIZACION 22/05/2026 12:37

A continuación se detalla el esquema relacional derivado del diagrama Entidad-Relación de este proyecto. Se aplicaron reglas estándar de normalización y mapeo para garantizar la integridad referencial.

### Convenciones
* **`negrita`**: Llave Primaria (PK - Primary Key).
* *`cursiva`*: Llave Foránea (FK - Foreign Key).
* ***`negrita_cursiva`***: Atributo que forma parte de la Llave Primaria y al mismo tiempo es Llave Foránea.

---

### 1. Entidades Principales (Independientes)

* **EMPLEADO** ( **`num_empleado`**, rfc, nombre, domicilio, fecha_nac, sueldo, foto )
* **CLIENTES** ( **`id_cliente`**, rfc, razon_social, nombre, fecha_nac, email, domicilio )
* **CATEGORIA** ( **`id_categoria`**, nombre, descripcion )

> **Nota de diseño:** El atributo `edad` de la entidad Empleado no se persistió en la tabla por ser un atributo derivado. Este valor debe calcularse en tiempo de ejecución utilizando `fecha_nac`.

---

### 2. Entidades Dependientes y Atributos Multivaluados

* **EMPLEADO_TELEFONO** ( ***`num_empleado`***, **`telefono`** )
  * *`num_empleado`* referencia a **EMPLEADO**(`num_empleado`).
* **DEPENDIENTE** ( ***`num_empleado`***, **`curp`**, nombre, parentesco )
  * *`num_empleado`* referencia a **EMPLEADO**(`num_empleado`).

> **Nota de diseño:** Los teléfonos se extrajeron a una tabla débil para cumplir con la Primera Forma Normal (1FN), evitando atributos multivaluados.

---

### 3. Jerarquía de Empleados (Herencia)

Se implementó la estrategia de "una tabla por subtipo" para modelar la herencia total/disjunta:

* **MESERO** ( ***`num_empleado`***, horario )
* **COCINERO** ( ***`num_empleado`***, especialidad )
* **ADMINISTRATIVOS** ( ***`num_empleado`***, rol )

  * *`num_empleado`* en todas estas tablas referencia a **EMPLEADO**(`num_empleado`).

---

### 4. Jerarquía de Consumibles

* **CONSUMIBLE** ( **`id_consumible`**, *`id_categoria`*, nombre, descripcion, receta, precio, disponibilidad )
  * *`id_categoria`* referencia a **CATEGORIA**(`id_categoria`).
* **PLATILLO** ( ***`id_consumible`*** )
  * *`id_consumible`* referencia a **CONSUMIBLE**(`id_consumible`).
* **BEBIDA** ( ***`id_consumible`*** )
  * *`id_consumible`* referencia a **CONSUMIBLE**(`id_consumible`).

---

### 5. Transacciones (Relaciones N:M)

* **ORDEN** ( **`folio`**, *`id_cliente`*, *`num_empleado_mesero`*, fecha_hora, total )
  * *`id_cliente`* referencia a **CLIENTES**(`id_cliente`).
  * *`num_empleado_mesero`* referencia a **MESERO**(`num_empleado`).
* **ORDEN_CONSUMIBLE** ( ***`folio`***, ***`id_consumible`***, cant_elem, precio_elem )
  * *`folio`* referencia a **ORDEN**(`folio`).
  * *`id_consumible`* referencia a **CONSUMIBLE**(`id_consumible`).

> **Nota de diseño:** La tabla `ORDEN_CONSUMIBLE` resuelve la relación de muchos a muchos ("Contiene") entre Órdenes y Consumibles, almacenando datos transaccionales estáticos como el `precio_elem` al momento de la compra.
