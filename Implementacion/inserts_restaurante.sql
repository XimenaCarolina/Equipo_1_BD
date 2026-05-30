/* ============================================================
   INSERTS ADAPTADOS - RESTAURANTE CON MENÚ OLIVE GARDEN
   Base: DDL PostgreSQL Restaurante
   Ejecutar DESPUÉS de crear las tablas.
   ============================================================ */

BEGIN;

/* ============================================================
   1) EMPLEADOS
   Pilotos de F1 usados como empleados del restaurante.
   ============================================================ */

INSERT INTO empleado
(num_empleado, nombre, ap_pat, ap_mat, edad, rfc, calle, numero, colonia, cp, estado, sueldo, fecha_nac, foto)
VALUES
(1,  'Max',      'Verstappen', 'Racing', 28, 'VER970930MX1', 'Pista1', '1',  'Montecarlo',       '01001', 'CDMX', 52000.00, '1997-09-30', 'max_verstappen.jpg'),
(2,  'Lando',    'Norris',     'McLaren',26, 'NOR991113MX2', 'Pista2', '4',  'Del Valle',        '03100', 'CDMX', 48000.00, '1999-11-13', 'lando_norris.jpg'),
(3,  'Oscar',    'Piastri',    'McLaren',25, 'PIA010406MX3', 'Pista3', '81', 'Narvarte',         '03020', 'CDMX', 47000.00, '2001-04-06', 'oscar_piastri.jpg'),
(4,  'Charles',  'Leclerc',    'Ferrari',28, 'LEC971016MX4', 'Pista4', '16', 'Roma Norte',       '06700', 'CDMX', 50000.00, '1997-10-16', 'charles_leclerc.jpg'),
(5,  'Lewis',    'Hamilton',   'Ferrari',41, 'HAM850107MX5', 'Pista5', '44', 'Polanco',          '11550', 'CDMX', 61000.00, '1985-01-07', 'lewis_hamilton.jpg'),
(6,  'George',   'Russell',    'Mercedes',28,'RUS980215MX6', 'Pista6', '63', 'Condesa',          '06140', 'CDMX', 49000.00, '1998-02-15', 'george_russell.jpg'),
(7,  'Kimi',     'Antonelli',  'Mercedes',19,'ANT060825MX7', 'Pista7', '12', 'Coyoacan',         '04030', 'CDMX', 39000.00, '2006-08-25', 'kimi_antonelli.jpg'),
(8,  'Fernando', 'Alonso',     'Aston',  44, 'ALO810729MX8', 'Pista8', '14', 'SanAngel',         '01000', 'CDMX', 56000.00, '1981-07-29', 'fernando_alonso.jpg'),
(9,  'Lance',    'Stroll',     'Aston',  27, 'STR981029MX9', 'Pista9', '18', 'Nápoles',          '03810', 'CDMX', 38000.00, '1998-10-29', 'lance_stroll.jpg'),
(10, 'Carlos',   'Sainz',      'Williams',31,'SAI940901MX0', 'Recta1', '55', 'Mixcoac',          '03930', 'CDMX', 46000.00, '1994-09-01', 'carlos_sainz.jpg'),
(11, 'Alexander','Albon',      'Williams',30,'ALB960323MX1', 'Recta2', '23', 'Tacuba',           '11410', 'CDMX', 43000.00, '1996-03-23', 'alex_albon.jpg'),
(12, 'Pierre',   'Gasly',      'Alpine', 30, 'GAS960207MX2', 'Recta3', '10', 'Coapa',            '04980', 'CDMX', 44000.00, '1996-02-07', 'pierre_gasly.jpg'),
(13, 'Franco',   'Colapinto',  'Alpine', 23, 'COL030527MX3', 'Recta4', '43', 'Juárez',           '06600', 'CDMX', 37000.00, '2003-05-27', 'franco_colapinto.jpg'),
(14, 'Esteban',  'Ocon',       'Haas',   29, 'OCO960917MX4', 'Recta5', '31', 'Portales',         '03300', 'CDMX', 42000.00, '1996-09-17', 'esteban_ocon.jpg'),
(15, 'Oliver',   'Bearman',    'Haas',   21, 'BEA050508MX5', 'Recta6', '87', 'Doctores',         '06720', 'CDMX', 36000.00, '2005-05-08', 'oliver_bearman.jpg'),
(16, 'Nico',     'Hulkenberg', 'Audi',   38, 'HUL870819MX6', 'Recta7', '27', 'Anzures',          '11590', 'CDMX', 45000.00, '1987-08-19', 'nico_hulkenberg.jpg'),
(17, 'Gabriel',  'Bortoleto',  'Audi',   21, 'BOR041014MX7', 'Recta8', '5',  'Guerrero',         '06300', 'CDMX', 36000.00, '2004-10-14', 'gabriel_bortoleto.jpg'),
(18, 'Liam',     'Lawson',     'Bulls',  24, 'LAW020211MX8', 'Curva1', '30', 'Escandón',         '11800', 'CDMX', 37000.00, '2002-02-11', 'liam_lawson.jpg'),
(19, 'Arvid',    'Lindblad',   'Bulls',  18, 'LIN070808MX9', 'Curva2', '41', 'Industrial',       '07800', 'CDMX', 34000.00, '2007-08-08', 'arvid_lindblad.jpg'),
(20, 'Isack',    'Hadjar',     'RedBull',21, 'HAD040928MX0', 'Curva3', '6',  'Centro',           '06000', 'CDMX', 38000.00, '2004-09-28', 'isack_hadjar.jpg'),
(21, 'Sergio',   'Perez',      'Cadillac',36,'PER900126MX1', 'Curva4', '11', 'SantaFe',          '01210', 'CDMX', 47000.00, '1990-01-26', 'sergio_perez.jpg'),
(22, 'Valtteri', 'Bottas',     'Cadillac',36,'BOT890828MX2', 'Curva5', '77', 'Lindavista',       '07300', 'CDMX', 45000.00, '1989-08-28', 'valtteri_bottas.jpg');

/* ============================================================
   2) TELÉFONOS DE EMPLEADOS
   ============================================================ */

INSERT INTO telefono_empleado (num_empleado, telefono) VALUES
(1,'5551000001'), (2,'5551000002'), (3,'5551000003'), (4,'5551000004'),
(5,'5551000005'), (6,'5551000006'), (7,'5551000007'), (8,'5551000008'),
(9,'5551000009'), (10,'5551000010'), (11,'5551000011'), (12,'5551000012'),
(13,'5551000013'), (14,'5551000014'), (15,'5551000015'), (16,'5551000016'),
(17,'5551000017'), (18,'5551000018'), (19,'5551000019'), (20,'5551000020'),
(21,'5551000021'), (22,'5551000022');

/* ============================================================
   3) SUBTIPOS DE EMPLEADO
   Especialización parcial y traslapada.
   Se dividen los pilotos entre meseros, cocineros y administrativos y 
   algunos se repiten para mostrar traslape.
   ============================================================ */

INSERT INTO mesero (num_empleado, horario) VALUES
(1, 'Lunes a viernes 09:00-17:00'),
(2, 'Lunes a viernes 12:00-20:00'),
(3, 'Martes a sábado 13:00-21:00'),
(4, 'Miércoles a domingo 14:00-22:00'),
(5, 'Fines de semana 10:00-18:00'),
(6, 'Lunes a sábado 11:00-19:00'),
(7, 'Medio tiempo 16:00-22:00'),
(21,'Turno especial 18:00-23:00');

INSERT INTO cocinero (num_empleado, especialidad) VALUES
(8,  'Pastas Alfredo'),
(9,  'Antipasti'),
(10, 'Pizzas'),
(11, 'Postres'),
(12, 'Sopas e insalatas'),
(13, 'Bebidas y café'),
(14, 'Carnes y pollo'),
(15, 'Mariscos'),
(5,  'Platillos premium');

INSERT INTO administrativo (num_empleado, rol) VALUES
(16, 'Gerente general'),
(17, 'Control de caja'),
(18, 'Inventario'),
(19, 'Recursos humanos'),
(20, 'Compras'),
(21, 'Relación con clientes'),
(22, 'Facturación'),
(8,  'Supervisor de cocina');

/* ============================================================
   4) DEPENDIENTES
   ============================================================ */

INSERT INTO dependiente (num_empleado, id_dependiente, nombre, parentesco, curp) VALUES
(1, 1, 'Victoria Verstappen', 'Hermana', 'VEVI010101MDFRRR01'),
(2, 1, 'Adam Norris', 'Padre', 'NOAD010101HDFRRR02'),
(5, 1, 'Roscoe Hamilton', 'Mascota', 'HARA010101HDFRRR03'),
(8, 1, 'Lorena Alonso', 'Hermana', 'ALLO010101MDFRRR04'),
(21,1, 'Antonio Pérez', 'Padre', 'PEAT010101HDFRRR05');

/* ============================================================
   5) CLIENTES
   ============================================================ */

INSERT INTO cliente
(id_cliente, nombre, ap_pat, ap_mat, rfc, razon_social, fecha_nac, email, calle, numero, colonia, cp, estado)
VALUES
(1,  'Ericka',          'Aguilar',      'Lara',       'AULE010101MX1', 'Ericka Aguilar Lara', '2001-01-01', 'ericka.aguilar@example.com',       'Av Universidad', '100', 'Copilco',     '04360', 'CDMX'),
(2,  'Sofía',           'Bautista',     'Reyes',      'BARE010101MX2', 'Sofía Bautista Reyes', '2001-02-02', 'sofia.bautista@example.com',      'Insurgentes',    '200', 'Del Valle',   '03100', 'CDMX'),
(3,  'José Tristán',    'Bermejo',      'Flores',     'BEFL010101MX3', 'José Tristán Bermejo Flores', '2001-03-03', 'jose.bermejo@example.com', 'Reforma',        '300', 'Juárez',      '06600', 'CDMX'),
(4,  'Ximena Carolina', 'Cruz',         'Basilio',    'CRBA010101MX4', 'Ximena Carolina Cruz Basilio', '2001-04-04', 'ximena.cruz@example.com', 'Pilares',        '400', 'Narvarte',    '03020', 'CDMX'),
(5,  'Rodrigo',         'Jardón',       'Marín',      'JAMA010101MX5', 'Rodrigo Jardón Marín', '2001-05-05', 'rodrigo.jardon@example.com',      'Chiapas',        '500', 'Roma Norte',  '06700', 'CDMX'),
(6,  'Héctor Emilio',   'Parra',        'Fernández',  'PAFE010101MX6', 'Héctor Emilio Parra Fernández', '2001-06-06', 'hector.parra@example.com', 'Puebla',         '600', 'Condesa',     '06140', 'CDMX'),
(7,  'Teodora Vicenta', 'Villavicencio','Oraverás',   'VIOT010101MX7', 'Teodora Vicenta Villavicencio Oraverás', '1988-07-07', 'teodora.villavicencio@example.com', 'Palmas', '700', 'Polanco', '11550', 'CDMX'),
(8,  'María Fernanda',  'Gómez',        'López',      'GOLO010101MX8', 'María Fernanda Gómez López', '1999-08-08', 'maria.gomez@example.com',        'Madero',         '80',  'Centro',      '06000', 'CDMX'),
(9,  'Diego',           'Martínez',     'Santos',     'MASA010101MX9', 'Diego Martínez Santos', '1998-09-09', 'diego.martinez@example.com',      'Bolívar',        '90',  'Obrera',      '06800', 'CDMX'),
(10, 'Valeria',         'Hernández',    'Ríos',       'HERI010101MX0', 'Valeria Hernández Ríos', '2000-10-10', 'valeria.hernandez@example.com',   'Sonora',         '10',  'Roma Sur',    '06760', 'CDMX'),
(11, 'Camila',          'Torres',       'Nava',       'TONA010101MX1', 'Camila Torres Nava', '1997-11-11', 'camila.torres@example.com',         'Morelos',        '11',  'Coyoacán',    '04030', 'CDMX'),
(12, 'Emiliano',        'Ruiz',         'Castro',     'RUCA010101MX2', 'Emiliano Ruiz Castro', '1996-12-12', 'emiliano.ruiz@example.com',       'Acoxpa',         '12',  'Coapa',       '04980', 'CDMX'),
(13, 'Natalia',         'Ortega',       'Vega',       'ORVE010101MX3', 'Natalia Ortega Vega', '2002-01-13', 'natalia.ortega@example.com',       'Homero',         '13',  'Polanco',     '11550', 'CDMX'),
(14, 'Andrés',          'Luna',         'Paredes',    'LUPE010101MX4', 'Andrés Luna Paredes', '1995-02-14', 'andres.luna@example.com',          'Yucatán',        '14',  'Roma Norte',  '06700', 'CDMX'),
(15, 'Regina',          'Salazar',      'Mora',       'SAMO010101MX5', 'Regina Salazar Mora', '1994-03-15', 'regina.salazar@example.com',       'Amsterdam',      '15',  'Hipódromo',   '06100', 'CDMX');

/* ============================================================
   6) CATEGORÍAS DEL MENÚ
   ============================================================ */

INSERT INTO categoria (id_categoria, nombre, descripcion) VALUES
(1,  'Antipasti',        'Entradas para compartir'),
(2,  'Soups & Insalatta','Sopas recién hechas y ensaladas'),
(3,  'Cucina Classica',  'Pastas, pollo, carne y platillos clásicos'),
(4,  'OG Favorites',     'Favoritos de la casa'),
(5,  'Amazing Alfredos', 'Platillos con salsa Alfredo'),
(6,  'Postres',          'Postres italianos y pasteles'),
(7,  'Bebidas sin alcohol','Jugos, refrescos, limonadas y aguas'),
(8,  'Café',             'Café frío y caliente'),
(9,  'Coctelería',       'Cocteles con y sin alcohol'),
(10, 'Cervezas',         'Cervezas nacionales, premium y sin alcohol'),
(11, 'Vinos',            'Vinos por copa o botella');

/* ============================================================
   7) PRODUCTOS DEL MENÚ
   tipo_producto: PLATILLO o BEBIDA
   ============================================================ */

INSERT INTO producto
(id_producto, id_categoria, nombre, descripcion, receta, precio, disponibilidad, tipo_producto)
VALUES
(1,  1, 'Lasagna Fritta con Carne', 'Láminas de lasagna empanizadas con parmesano, salsa Alfredo y bolognese.', 'Freír lasagna, montar con Alfredo y bolognese.', 295.00, TRUE, 'PLATILLO'),
(2,  1, 'Fonduta di Mozzarella Ahumada de Espinaca', 'Queso mozzarella ahumado horneado con quesos italianos y espinaca.', 'Hornear mezcla de quesos y servir con pan toscano.', 299.00, TRUE, 'PLATILLO'),
(3,  1, 'Bocados di Risotto', 'Bocados de arroz con queso empanizados y salsa marinara.', 'Empanizar risotto y freír.', 230.00, TRUE, 'PLATILLO'),
(4,  1, 'Ravioles Frittos', 'Ravioles de queso y espinaca fritos con salsa marinara.', 'Freír ravioles y acompañar con marinara.', 199.00, TRUE, 'PLATILLO'),
(5,  1, 'Calamares Frittos', 'Calamares fritos con salsa marinara y aderezo ranch.', 'Empanizar calamares y freír.', 299.00, TRUE, 'PLATILLO'),
(6,  1, 'Pizza Pepperoni', 'Pizza tradicional con pepperoni y quesos italianos.', 'Hornear masa con salsa, queso y pepperoni.', 215.00, TRUE, 'PLATILLO'),
(7,  1, 'Shrimp Fritto Misto', 'Camarones con pimientos y cebolla empanizados.', 'Empanizar y freír camarones con verduras.', 305.00, TRUE, 'PLATILLO'),
(8,  2, 'Insalata della Casa', 'Ensalada con lechugas mixtas, aceitunas, jitomate, cebolla y crutones.', 'Mezclar vegetales y aderezo italiano.', 195.00, TRUE, 'PLATILLO'),
(9,  2, 'Zuppa Minestrone', 'Sopa vegetariana con vegetales, frijoles y pasta.', 'Cocer vegetales y pasta en caldo de jitomate.', 159.00, TRUE, 'PLATILLO'),
(10, 2, 'Pollo & Gnocchi', 'Sopa cremosa con pollo, pasta gnocchi y espinaca.', 'Preparar caldo cremoso con pollo y gnocchi.', 159.00, TRUE, 'PLATILLO'),
(11, 3, 'Pasta Five Cheese', 'Pasta penne con salsa de cinco quesos y jitomate.', 'Cocer pasta y bañar en salsa five cheese.', 225.00, TRUE, 'PLATILLO'),
(12, 3, 'Pasta Carbonara', 'Spaghetti con salsa cremosa de parmesano, pancetta y pimientos.', 'Cocer pasta y mezclar con carbonara.', 259.00, TRUE, 'PLATILLO'),
(13, 3, 'Spaghetti Bolognesa con Albóndigas', 'Spaghetti con salsa de carne y albóndigas.', 'Servir spaghetti con bolognesa y albóndigas.', 265.00, TRUE, 'PLATILLO'),
(14, 3, 'Ravioli di Formaggio', 'Ravioles rellenos de queso con salsa marinara o carne.', 'Cocer ravioles y gratinar con quesos.', 295.00, TRUE, 'PLATILLO'),
(15, 3, 'Lasagna Classica Grande', 'Capas de pasta con salsa de carne y quesos italianos.', 'Hornear capas de pasta, carne y quesos.', 365.00, TRUE, 'PLATILLO'),
(16, 4, 'Giro d Italia', 'Lasagna, pollo parmigiana y fettuccine Alfredo.', 'Montar los tres clásicos de Italia.', 425.00, TRUE, 'PLATILLO'),
(17, 4, 'Chicken & Shrimp Carbonara', 'Carbonara con pollo y camarón servida con spaghetti.', 'Preparar carbonara con proteínas.', 445.00, TRUE, 'PLATILLO'),
(18, 4, 'Frutti di Mare', 'Camarones, almejas y mejillones en salsa di mare con spaghetti.', 'Preparar mariscos con salsa di mare.', 385.00, TRUE, 'PLATILLO'),
(19, 5, 'Fettuccine Alfredo Piccante', 'Fettuccine con salsa Alfredo picante.', 'Cocer fettuccine y mezclar con Alfredo piccante.', 230.00, TRUE, 'PLATILLO'),
(20, 5, 'Fettuccine Alfredo con Brócoli', 'Fettuccine Alfredo acompañado con brócoli sazonado.', 'Cocer pasta y brócoli, agregar Alfredo.', 254.00, TRUE, 'PLATILLO'),
(21, 5, 'Seafood Alfredo', 'Salsa Alfredo con camarones y almejas sobre fettuccine.', 'Preparar mariscos y pasta con Alfredo.', 415.00, TRUE, 'PLATILLO'),
(22, 6, 'Panna Cotta', 'Postre de crema cocida sabor vainilla con salsa de fresa.', 'Refrigerar crema cocida y servir con salsa.', 169.00, TRUE, 'PLATILLO'),
(23, 6, 'Chocolate Lasagna', 'Postre en capas con queso crema y chocolate.', 'Montar capas dulces y refrigerar.', 209.00, TRUE, 'PLATILLO'),
(24, 6, 'Tiramisú', 'Postre de mascarpone con soletas humedecidas en café.', 'Montar capas de mascarpone, café y cocoa.', 199.00, TRUE, 'PLATILLO'),
(25, 7, 'Jugo de Fruta', 'Jugo de manzana, naranja, piña, arándano o uva.', NULL, 58.00, TRUE, 'BEBIDA'),
(26, 7, 'Té Helado Refill', 'Té negro frío con refill personal.', NULL, 65.00, TRUE, 'BEBIDA'),
(27, 7, 'Agua Embotellada Ciel Natural', 'Agua natural embotellada de 600 ml.', NULL, 48.00, TRUE, 'BEBIDA'),
(28, 7, 'Limonada de Frambuesa', 'Limonada con concentrado de frambuesa.', NULL, 97.00, TRUE, 'BEBIDA'),
(29, 8, 'Café Latte Frío Caramel', 'Café latte frío sabor caramelo.', NULL, 82.00, TRUE, 'BEBIDA'),
(30, 8, 'Cappuccino Olive Garden', 'Cappuccino caliente estilo Olive Garden.', NULL, 69.00, TRUE, 'BEBIDA'),
(31, 9, 'Italian Margarita', 'Margarita frappé con tequila Don Julio Blanco y fruta fresca.', NULL, 175.00, TRUE, 'BEBIDA'),
(32, 9, 'Cucumber Mint', 'Coctelería sin alcohol de pepino y menta.', NULL, 105.00, TRUE, 'BEBIDA'),
(33, 10,'Heineken', 'Cerveza premium 325 ml.', NULL, 79.00, TRUE, 'BEBIDA'),
(34, 10,'Indio', 'Cerveza nacional 325 ml.', NULL, 67.00, TRUE, 'BEBIDA'),
(35, 11,'Bacco L.A. Cetto Copa', 'Vino Lambrusco por copa.', NULL, 125.00, TRUE, 'BEBIDA'),
(36, 11,'Protos Verdejo Copa', 'Vino blanco Verdejo por copa.', NULL, 209.00, TRUE, 'BEBIDA');

/* ============================================================
   8) ÓRDENES
   Solo pueden atenderlas empleados que estén en MESERO.
   ============================================================ */

INSERT INTO orden (folio, num_mesero, fecha, total_pagar) VALUES
(1001, 1,  '2025-01-15 14:20:00', 0),
(1002, 2,  '2025-02-10 15:40:00', 0),
(1003, 3,  '2025-03-08 18:10:00', 0),
(1004, 4,  '2025-04-22 19:30:00', 0),
(1005, 5,  '2025-05-12 13:15:00', 0),
(1006, 6,  '2025-06-18 20:05:00', 0),
(1007, 7,  '2025-07-07 16:50:00', 0),
(1008, 21, '2025-08-21 21:10:00', 0),
(1009, 1,  '2025-09-14 14:05:00', 0),
(1010, 2,  '2025-10-25 17:45:00', 0),
(1011, 3,  '2025-11-03 18:25:00', 0),
(1012, 4,  '2025-12-01 20:30:00', 0),
(1013, 5,  '2025-12-06 15:55:00', 0),
(1014, 6,  '2025-12-12 19:10:00', 0),
(1015, 21, '2025-12-20 21:45:00', 0);

/* ============================================================
   9) DETALLE_ORDEN
   El subtotal_prod NO se inserta manualmente, 
   lo calcula automáticamente el trigger fn_calcular_subtotal().
   Después de cada INSERT, el trigger fn_actualizar_totalOrden()
   actualiza automáticamente orden.total_pagar.
   ============================================================ */

INSERT INTO detalle_orden (folio, id_producto, cant_prod) VALUES
(1001, 1, 1), (1001, 8, 2), (1001, 25, 2),
(1002, 6, 1), (1002, 4, 1), (1002, 30, 2),
(1003, 16, 1), (1003, 23, 1), (1003, 31, 2),
(1004, 17, 1), (1004, 18, 1), (1004, 35, 2),
(1005, 12, 2), (1005, 9, 1), (1005, 28, 2),
(1006, 21, 1), (1006, 5, 1), (1006, 33, 3),
(1007, 19, 2), (1007, 22, 2), (1007, 26, 2),
(1008, 15, 1), (1008, 11, 1), (1008, 36, 2),
(1009, 7, 1), (1009, 3, 1), (1009, 32, 3),
(1010, 20, 1), (1010, 14, 1), (1010, 24, 1), (1010, 27, 2),
(1011, 13, 2), (1011, 2, 1), (1011, 34, 4),
(1012, 18, 2), (1012, 31, 2), (1012, 23, 2),
(1013, 10, 3), (1013, 29, 2), (1013, 22, 1),
(1014, 16, 2), (1014, 21, 1), (1014, 35, 3),
(1015, 17, 1), (1015, 15, 1), (1015, 24, 2), (1015, 33, 2);

/* ============================================================
   10) PAGOS
   Puede pagar una sola persona o dividirse la cuenta entre clientes.
   ============================================================ */

INSERT INTO pago (folio, id_cliente, porcentaje_pago, monto_pago) VALUES
(1001, 1, 100.00, 801.00),
(1002, 2, 100.00, 552.00),
(1003, 3,  50.00, 492.00), (1003, 4, 50.00, 492.00),
(1004, 7, 100.00, 1080.00),
(1005, 5,  60.00, 522.60), (1005, 6, 40.00, 348.40),
(1006, 8, 100.00, 951.00),
(1007, 9, 100.00, 928.00),
(1008, 10, 50.00, 504.00), (1008, 11, 50.00, 504.00),
(1009, 12, 100.00, 850.00),
(1010, 13, 100.00, 844.00),
(1011, 14, 100.00, 1097.00),
(1012, 15, 100.00, 1538.00),
(1013, 4, 100.00, 810.00),
(1014, 7,  70.00, 1148.00), (1014, 1, 30.00, 492.00),
(1015, 2,  50.00, 683.00), (1015, 3, 50.00, 683.00);

/* ============================================================
   11) FACTURAS
   Cada factura referencia un pago existente: (folio, id_cliente).
   ============================================================ */

INSERT INTO factura (id_factura, folio, id_cliente, fecha_emision) VALUES
(1, 1001, 1,  '2025-01-15 15:00:00'),
(2, 1002, 2,  '2025-02-10 16:20:00'),
(3, 1003, 3,  '2025-03-08 19:00:00'),
(4, 1003, 4,  '2025-03-08 19:05:00'),
(5, 1004, 7,  '2025-04-22 20:15:00'),
(6, 1005, 5,  '2025-05-12 14:00:00'),
(7, 1005, 6,  '2025-05-12 14:05:00'),
(8, 1008, 10, '2025-08-21 22:00:00'),
(9, 1012, 15, '2025-12-01 21:15:00'),
(10,1014, 7,  '2025-12-12 20:05:00'),
(11,1015, 2,  '2025-12-20 22:10:00');

/* ============================================================
   12) VERIFICACIÓN RÁPIDA
   ============================================================ */

SELECT 'empleado' AS tabla, COUNT(*) AS total FROM empleado
UNION ALL SELECT 'telefono_empleado', COUNT(*) FROM telefono_empleado
UNION ALL SELECT 'mesero', COUNT(*) FROM mesero
UNION ALL SELECT 'cocinero', COUNT(*) FROM cocinero
UNION ALL SELECT 'administrativo', COUNT(*) FROM administrativo
UNION ALL SELECT 'dependiente', COUNT(*) FROM dependiente
UNION ALL SELECT 'cliente', COUNT(*) FROM cliente
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'producto', COUNT(*) FROM producto
UNION ALL SELECT 'orden', COUNT(*) FROM orden
UNION ALL SELECT 'detalle_orden', COUNT(*) FROM detalle_orden
UNION ALL SELECT 'pago', COUNT(*) FROM pago
UNION ALL SELECT 'factura', COUNT(*) FROM factura;

COMMIT;
