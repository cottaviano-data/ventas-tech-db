
USE Ventas_Tech_DB;

-- ELIMINAR TABLAS SI YA EXISTEN

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS categorias;

-- CREAR TABLAS

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    segmento VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    zona VARCHAR(100)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    subcategoria VARCHAR(100),
    precio DECIMAL(10,2) NOT NULL,
    costo DECIMAL(10,2),
    stock INT DEFAULT 0,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    id_territorio INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total_venta DECIMAL(12,2),
    canal VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_territorio) REFERENCES territorios(id_territorio)
);

-- INSERTAR DATOS

-- DATOS DE CATEGORIAS

INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

-- DATOS DE CLIENTES

INSERT INTO clientes VALUES (1, 'María López', 'maria@mail.com', 'Buenos Aires', 'Minorista', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', 'Corporativo', '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez', 'ana@mail.com', 'Rosario', 'Minorista', '2024-02-01');
INSERT INTO clientes VALUES (4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', 'Corporativo', '2024-02-15');
INSERT INTO clientes VALUES (5, 'Laura Torres', 'laura@mail.com', 'Tucumán', 'Minorista', '2024-03-01');

-- DATOS DE TERRITORIOS

INSERT INTO territorios VALUES (1, 'Centro', 'Argentina', 'Buenos Aires');
INSERT INTO territorios VALUES (2, 'Centro', 'Argentina', 'Córdoba');
INSERT INTO territorios VALUES (3, 'Litoral', 'Argentina', 'Rosario');
INSERT INTO territorios VALUES (4, 'Cuyo', 'Argentina', 'Mendoza');
INSERT INTO territorios VALUES (5, 'Norte', 'Argentina', 'Tucumán');

-- DATOS DE PRODUCTOS

INSERT INTO productos VALUES (1, 'Laptop Pro 15', 1, 'Laptops', 1200.00, NULL, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico', 2, 'Periféricos', 28.00, NULL, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"', 1, 'Monitores', 450.00, NULL, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro', 3, 'Auriculares', 120.00, NULL, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB', 4, 'Discos', 130.00, NULL, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico', 2, 'Periféricos', 95.00, NULL, 40, 1);

-- DATOS DE VENTAS

INSERT INTO ventas VALUES (1, '2024-03-05', 1, 1, 1, 2, 1200.00, 2400.00, 'Online');
INSERT INTO ventas VALUES (2, '2024-03-06', 2, 2, 2, 5, 28.00, 140.00, 'Tienda');
INSERT INTO ventas VALUES (3, '2024-03-07', 3, 3, 3, 1, 450.00, 450.00, 'Online');
INSERT INTO ventas VALUES (4, '2024-03-08', 1, 4, 1, 2, 120.00, 240.00, 'Tienda');
INSERT INTO ventas VALUES (5, '2024-03-10', 4, 5, 4, 3, 130.00, 390.00, 'Online');
INSERT INTO ventas VALUES (6, '2024-03-11', 2, 6, 2, 4, 95.00, 380.00, 'Tienda');
INSERT INTO ventas VALUES (7, '2024-03-12', 5, 1, 5, 1, 1200.00, 1200.00, 'Online');
INSERT INTO ventas VALUES (8, '2024-03-13', 3, 2, 3, 8, 28.00, 224.00, 'Tienda');
INSERT INTO ventas VALUES (9, '2024-03-14', 4, 4, 4, 1, 120.00, 120.00, 'Online');
INSERT INTO ventas VALUES (10, '2024-03-15', 5, 3, 5, 2, 450.00, 900.00, 'Tienda');

-- VALIDACION DE DATOS

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM territorios;
SELECT * FROM productos;
SELECT * FROM ventas;