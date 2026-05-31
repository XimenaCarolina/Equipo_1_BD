-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-05-30 18:05:49 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE administrativo 
    ( 
     num_empleado INTEGER  NOT NULL , 
     rol          VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE administrativo 
    ADD CONSTRAINT pk_administrativo PRIMARY KEY ( num_empleado ) ;

CREATE TABLE categoria 
    ( 
     id_categoria INTEGER  NOT NULL , 
     nombre       VARCHAR2 (80)  NOT NULL , 
     descripcion  VARCHAR2 (255)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE categoria 
    ADD CONSTRAINT pk_categoria PRIMARY KEY ( id_categoria ) ;

ALTER TABLE categoria 
    ADD CONSTRAINT uq_categoria_nombre UNIQUE ( nombre ) ;

CREATE TABLE cliente 
    ( 
     id_cliente   INTEGER  NOT NULL , 
     rfc          VARCHAR2 (13)  NOT NULL , 
     email        VARCHAR2 (120)  NOT NULL , 
     calle        VARCHAR2 (80)  NOT NULL , 
     numero       VARCHAR2 (10)  NOT NULL , 
     colonia      VARCHAR2 (80)  NOT NULL , 
     cp           VARCHAR2 (10)  NOT NULL , 
     estado       VARCHAR2 (60)  NOT NULL , 
     tipo_cliente VARCHAR2 (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE cliente 
    ADD CONSTRAINT chk_cliente_tipo 
    CHECK (tipo_cliente IN ('FISICA', 'MORAL'))
;
ALTER TABLE cliente 
    ADD CONSTRAINT pk_cliente PRIMARY KEY ( id_cliente ) ;

ALTER TABLE cliente 
    ADD CONSTRAINT uq_cliente_rfc UNIQUE ( rfc ) ;

CREATE TABLE cocinero 
    ( 
     num_empleado INTEGER  NOT NULL , 
     especialidad VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE cocinero 
    ADD CONSTRAINT pk_cocinero PRIMARY KEY ( num_empleado ) ;

CREATE TABLE dependiente 
    ( 
     num_empleado   INTEGER  NOT NULL , 
     id_dependiente INTEGER  NOT NULL , 
     nombre         VARCHAR2 (60)  NOT NULL , 
     ap_pat         VARCHAR2 (20)  NOT NULL , 
     ap_mat         VARCHAR2 (20) , 
     parentesco     VARCHAR2 (50)  NOT NULL , 
     curp           VARCHAR2 (18)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE dependiente 
    ADD CONSTRAINT pk_dependiente PRIMARY KEY ( num_empleado, id_dependiente ) ;

ALTER TABLE dependiente 
    ADD CONSTRAINT uq_dependiente_curp UNIQUE ( curp ) ;

CREATE TABLE detalle_orden 
    ( 
     folio         VARCHAR2 (10)  NOT NULL , 
     id_producto   INTEGER  NOT NULL , 
     cant_prod     INTEGER  NOT NULL , 
     subtotal_prod NUMBER (10,2) DEFAULT 0  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE detalle_orden 
    ADD CONSTRAINT chk_detalle_orden_cantidad 
    CHECK (cant_prod > 0)
;


ALTER TABLE detalle_orden 
    ADD CONSTRAINT chk_detalle_orden_subtotal 
    CHECK (subtotal_prod >= 0)
;
ALTER TABLE detalle_orden 
    ADD CONSTRAINT pk_detalle_orden PRIMARY KEY ( folio, id_producto ) ;

CREATE TABLE empleado 
    ( 
     num_empleado INTEGER  NOT NULL , 
     nombre       VARCHAR2 (60)  NOT NULL , 
     ap_pat       VARCHAR2 (20)  NOT NULL , 
     ap_mat       VARCHAR2 (20) , 
     edad         INTEGER  NOT NULL , 
     rfc          VARCHAR2 (13)  NOT NULL , 
     calle        VARCHAR2 (80)  NOT NULL , 
     numero       VARCHAR2 (10)  NOT NULL , 
     colonia      VARCHAR2 (80)  NOT NULL , 
     cp           VARCHAR2 (10)  NOT NULL , 
     estado       VARCHAR2 (60)  NOT NULL , 
     sueldo       NUMBER (10,2)  NOT NULL , 
     fecha_nac    DATE  NOT NULL , 
     foto         VARCHAR2 (100)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE empleado 
    ADD CONSTRAINT chk_empleado_edad 
    CHECK (edad >= 18)
;


ALTER TABLE empleado 
    ADD CONSTRAINT chk_empleado_sueldo 
    CHECK (sueldo >= 0)
;
ALTER TABLE empleado 
    ADD CONSTRAINT pk_empleado PRIMARY KEY ( num_empleado ) ;

ALTER TABLE empleado 
    ADD CONSTRAINT uq_empleado_rfc UNIQUE ( rfc ) ;

CREATE TABLE factura 
    ( 
     id_factura    INTEGER  NOT NULL , 
     folio         VARCHAR2 (10)  NOT NULL , 
     id_cliente    INTEGER  NOT NULL , 
     fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE factura 
    ADD CONSTRAINT pk_factura PRIMARY KEY ( id_factura ) ;

ALTER TABLE factura 
    ADD CONSTRAINT uq_factura_orden_cliente UNIQUE ( folio , id_cliente ) ;

CREATE TABLE horario_mesero 
    ( 
     num_empleado INTEGER  NOT NULL , 
     dia_semana   VARCHAR2 (10)  NOT NULL , 
     hora_inicio  DATE  NOT NULL , 
     hora_fin     DATE  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE horario_mesero 
    ADD CONSTRAINT chk_horario_dia 
    CHECK (dia_semana IN ( 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo' ))
;


ALTER TABLE horario_mesero 
    ADD CONSTRAINT chk_horario_horas 
    CHECK (hora_inicio < hora_fin)
;
ALTER TABLE horario_mesero 
    ADD CONSTRAINT pk_horario_mesero PRIMARY KEY ( num_empleado, dia_semana ) ;

CREATE TABLE mesero 
    ( 
     num_empleado INTEGER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE mesero 
    ADD CONSTRAINT pk_mesero PRIMARY KEY ( num_empleado ) ;

CREATE TABLE orden 
    ( 
     folio       VARCHAR2 (10)  NOT NULL , 
     num_mesero  INTEGER  NOT NULL , 
     fecha       TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL , 
     total_pagar NUMBER (10,2) DEFAULT 0  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE orden 
    ADD CONSTRAINT chk_orden_total_pagar 
    CHECK (total_pagar >= 0)
;
ALTER TABLE orden 
    ADD CONSTRAINT pk_orden PRIMARY KEY ( folio ) ;

CREATE TABLE pago 
    ( 
     folio           VARCHAR2 (10)  NOT NULL , 
     id_cliente      INTEGER  NOT NULL , 
     porcentaje_pago NUMBER (5,2)  NOT NULL , 
     monto_pago      NUMBER (10,2) DEFAULT 0  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE pago 
    ADD CONSTRAINT chk_pago_monto 
    CHECK (monto_pago >= 0)
;


ALTER TABLE pago 
    ADD CONSTRAINT chk_pago_porcentaje 
    CHECK (porcentaje_pago > 0 AND porcentaje_pago <= 100)
;
ALTER TABLE pago 
    ADD CONSTRAINT pk_pago PRIMARY KEY ( folio, id_cliente ) ;

CREATE TABLE persona_fisica 
    ( 
     id_cliente INTEGER  NOT NULL , 
     nombre     VARCHAR2 (60)  NOT NULL , 
     ap_pat     VARCHAR2 (20)  NOT NULL , 
     ap_mat     VARCHAR2 (20) , 
     fecha_nac  DATE  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE persona_fisica 
    ADD CONSTRAINT pk_persona_fisica PRIMARY KEY ( id_cliente ) ;

CREATE TABLE persona_moral 
    ( 
     id_cliente   INTEGER  NOT NULL , 
     razon_social VARCHAR2 (250)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE persona_moral 
    ADD CONSTRAINT pk_persona_moral PRIMARY KEY ( id_cliente ) ;

CREATE TABLE producto 
    ( 
     id_producto    INTEGER  NOT NULL , 
     id_categoria   INTEGER  NOT NULL , 
     nombre         VARCHAR2 (150)  NOT NULL , 
     descripcion    VARCHAR2 (250)  NOT NULL , 
     receta         VARCHAR2 (500) , 
     precio         NUMBER (10,2)  NOT NULL , 
     disponibilidad NUMBER  NOT NULL , 
     tipo_producto  VARCHAR2 (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE producto 
    ADD CONSTRAINT chk_producto_precio 
    CHECK (precio >= 0)
;


ALTER TABLE producto 
    ADD CONSTRAINT chk_producto_tipo 
    CHECK (tipo_producto IN ('PLATILLO', 'BEBIDA'))
;
ALTER TABLE producto 
    ADD CONSTRAINT pk_producto PRIMARY KEY ( id_producto ) ;

CREATE TABLE telefono_empleado 
    ( 
     num_empleado INTEGER  NOT NULL , 
     telefono     VARCHAR2 (20)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE telefono_empleado 
    ADD CONSTRAINT pk_telefono_empleado PRIMARY KEY ( num_empleado, telefono ) ;

ALTER TABLE administrativo 
    ADD CONSTRAINT fk_administrativo_empleado FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES empleado 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE cocinero 
    ADD CONSTRAINT fk_cocinero_empleado FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES empleado 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE dependiente 
    ADD CONSTRAINT fk_dependiente_empleado FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES empleado 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE detalle_orden 
    ADD CONSTRAINT fk_detalle_orden_orden FOREIGN KEY 
    ( 
     folio
    ) 
    REFERENCES orden 
    ( 
     folio
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE detalle_orden 
    ADD CONSTRAINT fk_detalle_orden_producto FOREIGN KEY 
    ( 
     id_producto
    ) 
    REFERENCES producto 
    ( 
     id_producto
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE factura 
    ADD CONSTRAINT fk_factura_pago FOREIGN KEY 
    ( 
     folio,
     id_cliente
    ) 
    REFERENCES pago 
    ( 
     folio,
     id_cliente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE horario_mesero 
    ADD CONSTRAINT fk_horario_mesero_mesero FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES mesero 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE mesero 
    ADD CONSTRAINT fk_mesero_empleado FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES empleado 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE orden 
    ADD CONSTRAINT fk_orden_mesero FOREIGN KEY 
    ( 
     num_mesero
    ) 
    REFERENCES mesero 
    ( 
     num_empleado
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE pago 
    ADD CONSTRAINT fk_pago_cliente FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES cliente 
    ( 
     id_cliente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE pago 
    ADD CONSTRAINT fk_pago_orden FOREIGN KEY 
    ( 
     folio
    ) 
    REFERENCES orden 
    ( 
     folio
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE persona_fisica 
    ADD CONSTRAINT fk_persona_fisica_cliente FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES cliente 
    ( 
     id_cliente
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE persona_moral 
    ADD CONSTRAINT fk_persona_moral_cliente FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES cliente 
    ( 
     id_cliente
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;

ALTER TABLE producto 
    ADD CONSTRAINT fk_producto_categoria FOREIGN KEY 
    ( 
     id_categoria
    ) 
    REFERENCES categoria 
    ( 
     id_categoria
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE telefono_empleado 
    ADD CONSTRAINT fk_telefono_empleado_empleado FOREIGN KEY 
    ( 
     num_empleado
    ) 
    REFERENCES empleado 
    ( 
     num_empleado
    ) 
    ON DELETE CASCADE 
    NOT DEFERRABLE 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                             0
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
