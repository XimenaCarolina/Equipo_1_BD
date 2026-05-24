-- ==========================================
-- 1. ENTIDADES PRINCIPALES (INDEPENDIENTES)
-- ==========================================

CREATE TABLE empleado (
    num_empleado NUMBER NOT NULL,
    rfc          VARCHAR2(13) UNIQUE NOT NULL,
    nombre       VARCHAR2(40) NOT NULL,
    ap_pat       VARCHAR2(40) NOT NULL,
    ap_mat       VARCHAR2(40);
    calle        VARCHAR2(50);
    numero       VARCHAR2(30),
    cp           VARCHAR2(5),
    colonia      VARCHAR2(50),
    estado       VARCHAR(40),
    fecha_nac    DATE,
    sueldo       NUMBER(10, 2),
    foto         BLOB,
    CONSTRAINT empleado_pk PRIMARY KEY ( num_empleado )
);

CREATE TABLE clientes (
    id_cliente   NUMBER NOT NULL,
    rfc          VARCHAR2(13), UNIQUE NOT NULL
    razon_social VARCHAR2(150),
    nombre       VARCHAR2(100) NOT NULL,
    ap_pat       VARCHAR2(40) NOT NULL,
    ap_mat       VARCHAR2(40);
    fecha_nac    DATE,
    calle        VARCHAR2(50);
    numero       VARCHAR2(30),
    cp           VARCHAR2(5),
    colonia      VARCHAR2(50),
    estado       VARCHAR(40),
    email        VARCHAR2(100),
    CONSTRAINT clientes_pk PRIMARY KEY ( id_cliente )
);

CREATE TABLE categoria (
    id_categoria NUMBER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    descripcion  VARCHAR2(255),
    CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria )
);

-- ==========================================
-- 2. ENTIDADES DEPENDIENTES Y MULTIVALUADAS
-- ==========================================

-- Tabla para el atributo multivaluado 'telefonos'
CREATE TABLE empleado_telefono (
    num_empleado NUMBER NOT NULL,
    telefono     VARCHAR2(20) NOT NULL,
    CONSTRAINT empleado_telefono_pk PRIMARY KEY ( num_empleado, telefono ),
    CONSTRAINT emp_tel_emp_fk FOREIGN KEY ( num_empleado )
        REFERENCES empleado ( num_empleado )
);

-- Entidad débil 'DEPENDIENTE'
CREATE TABLE dependiente (
    num_empleado NUMBER NOT NULL,
    curp         VARCHAR2(18) NOT NULL,
    nombre       VARCHAR2(100) NOT NULL,
    parentesco   VARCHAR2(50),
    CONSTRAINT dependiente_pk PRIMARY KEY ( num_empleado, curp ),
    CONSTRAINT dep_emp_fk FOREIGN KEY ( num_empleado )
        REFERENCES empleado ( num_empleado )
);

-- ==========================================
-- 3. JERARQUÍA DE EMPLEADOS
-- ==========================================

CREATE TABLE mesero (
    num_empleado NUMBER NOT NULL,
    horario      VARCHAR2(100),
    CONSTRAINT mesero_pk PRIMARY KEY ( num_empleado ),
    CONSTRAINT mesero_emp_fk FOREIGN KEY ( num_empleado )
        REFERENCES empleado ( num_empleado )
);

CREATE TABLE cocinero (
    num_empleado NUMBER NOT NULL,
    especialidad VARCHAR2(100),
    CONSTRAINT cocinero_pk PRIMARY KEY ( num_empleado ),
    CONSTRAINT cocinero_emp_fk FOREIGN KEY ( num_empleado )
        REFERENCES empleado ( num_empleado )
);

CREATE TABLE administrativos (
    num_empleado NUMBER NOT NULL,
    rol          VARCHAR2(50),
    CONSTRAINT admin_pk PRIMARY KEY ( num_empleado ),
    CONSTRAINT admin_emp_fk FOREIGN KEY ( num_empleado )
        REFERENCES empleado ( num_empleado )
);

-- ==========================================
-- 4. JERARQUÍA Y ENTIDADES DE CONSUMIBLES
-- ==========================================

CREATE TABLE producto (
    id_producto  NUMBER NOT NULL,
    id_categoria   NUMBER NOT NULL, -- FK de la relación 'Pertenece'
    nombre         VARCHAR2(100) NOT NULL,
    descripcion    VARCHAR2(255),
    receta         VARCHAR2(1000),
    precio         NUMBER(10, 2) NOT NULL,
    disponibilidad NUMBER(1), -- Puede ser 1/0 para Booleano en Oracle
    CONSTRAINT consumible_pk PRIMARY KEY ( id_producto ),
    CONSTRAINT cons_cat_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id_categoria )
);

CREATE TABLE platillo (
    id_producto NUMBER NOT NULL,
    CONSTRAINT platillo_pk PRIMARY KEY ( id_producto ),
    CONSTRAINT platillo_cons_fk FOREIGN KEY ( id_producto )
        REFERENCES consumible ( id_producto )
);

CREATE TABLE bebida (
    id_consumible NUMBER NOT NULL,
    CONSTRAINT bebida_pk PRIMARY KEY ( id_producto ),
    CONSTRAINT bebida_cons_fk FOREIGN KEY ( id_producto )
        REFERENCES consumible ( id_producto )
);

-- ==========================================
-- 5. TRANSACCIONES (ORDEN Y DETALLE)
-- ==========================================

CREATE TABLE orden (
    folio               NUMBER NOT NULL,
    id_cliente          NUMBER NOT NULL, -- FK de la relación 'Solicita'
    num_empleado_mesero NUMBER NOT NULL, -- FK de la relación 'Levanta'
    fecha_hora          TIMESTAMP NOT NULL,
    CONSTRAINT orden_pk PRIMARY KEY ( folio ),
    CONSTRAINT orden_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES clientes ( id_cliente ),
    CONSTRAINT orden_mesero_fk FOREIGN KEY ( num_empleado_mesero )
        REFERENCES mesero ( num_empleado )
);

CREATE TABLE paga(
    folio NUMBER NOT NULL,
    id_cliente NUMBER NOT NULL,
    porcentaje_pago NUMBER (10,2),
    CONTRAINT paga_pk PRIMARY KEY (folio, id_cliente)
    CONSTRAINT paga_orden_fk FOREIGN KEY (folio)
        REFERENCES orden (folio),
    CONSTRAINT paga_cliente_fk FOREIGN KEY (id_cliente),
        REFERENCES cliente (id_cliente)
);

CREATE TABLE factura (
    id_factura    NUMBER NOT NULL,
    folio         NUMBER NOT NULL,
    id_cliente    NUMBER NOT NULL,
    fecha_emisión DATE NOT NULL,
    CONSTRAINT factura_paga_fk FOREIGN KEY (folio, id_cliente)
        REFERENCES paga (folio, id_cliente),
    CONSTRAINT factura_consumo (folio, id_cliente )
);

-- Tabla intermedia para la relación N:M 'Contiene'
CREATE TABLE orden_producto (
    folio         NUMBER NOT NULL,
    id_producto   NUMBER NOT NULL,
    cant_prod     NUMBER NOT NULL,
    CONSTRAINT orden_producto_pk PRIMARY KEY ( folio, id_producto ),
    CONSTRAINT oc_orden_fk FOREIGN KEY ( folio )
        REFERENCES orden ( folio ),
    CONSTRAINT oc_producto_fk FOREIGN KEY ( id_producto )
        REFERENCES producto ( id_producto )
);
