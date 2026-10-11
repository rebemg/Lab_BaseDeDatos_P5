CREATE TABLE IF NOT EXISTS producto (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2),
    stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pedido (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES cliente(id),
    fecha DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS detalle_pedido (
    pedido_id INT NOT NULL REFERENCES pedido(id),
    producto_id INT NOT NULL REFERENCES producto(id),
    cantidad INT NOT NULL,
    PRIMARY KEY(pedido_id, producto_id)
);


INSERT INTO producto (nombre, precio, stock) VALUES
('Smartphone Galaxy Z', 18500.00, 15),
('Tablet NovaPad', 9500.00, 20),
('Auriculares SonicBeat', 1200.00, 40),
('Cámara Lumix Pro', 22000.00, 10),
('Smartwatch PulseX', 3500.00, 25);

INSERT INTO cliente (nombre, direccion) VALUES
('Sofía Hernández', 'Av. Las Torres 101'),
('Javier Castillo', 'Calle Luna 45'),
('María Fernanda Soto', 'Av. Hidalgo 300'),
('Andrés Ramírez', 'Calle Sol 88'),
('Valeria Cruz', 'Av. Central 500');

INSERT INTO pedido (cliente_id, fecha) VALUES
(1, '2026-10-05'),
(2, '2026-10-06'),
(3, '2026-10-07'),
(4, '2026-10-08'),
(5, '2026-10-09');

INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad)
VALUES 
    (1, 1, 1),
    (1, 3, 2),
    (2, 2, 1),
    (3, 4, 1),
    (4, 5, 3),
    (5, 1, 2)
ON CONFLICT (pedido_id, producto_id)
DO UPDATE SET cantidad = detalle_pedido.cantidad + EXCLUDED.cantidad;

-- Productos más vendidos
SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
JOIN producto pr ON dp.producto_id = pr.id
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 3;

-- Cliente con mayor gasto
SELECT c.nombre AS cliente, SUM(pr.precio * dp.cantidad) AS total_gastado
FROM cliente c
JOIN pedido p ON c.id = p.cliente_id
JOIN detalle_pedido dp ON p.id = dp.pedido_id
JOIN producto pr ON dp.producto_id = pr.id
GROUP BY c.nombre
ORDER BY total_gastado DESC
LIMIT 1;

-- Actualizar inventario
UPDATE producto
SET stock = stock - (
    SELECT COALESCE(SUM(dp.cantidad), 0)
    FROM detalle_pedido dp
    WHERE dp.producto_id = producto.id
);

SELECT * FROM producto;
