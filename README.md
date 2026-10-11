# Practica 5
Rebeca Moreno González
## Objetivo

Aprender a insertar, consultar, actualizar y eliminar datos con DML. Utilizar operadores, funciones de agregación y cláusulas de filtrado para construir consultas básicas y avanzadas.

## Decisiones

**Para la actividad guiada:**

- Se crearon las tablas `empleado`, `departamento`, `cliente`, `producto`, `pedido` y `detalle_pedido` para practicar la normalización y las relaciones básicas.
- Se definieron claves primarias en cada tabla y una clave compuesta (`pedido_id`, `producto_id`) en `detalle_pedido`.
- Se insertaron datos de prueba para empleados, clientes y productos.

**Para el reto:**

- De las tablas de la actividad, eliminé la de `departamento`.
- Se agregó el campo `stock` en `producto` para simular un inventario.
- Se definieron consultas para obtener los productos más vendidos y el cliente con mayor gasto.

## Pruebas realizadas

**Para la actividad guiada:**

- Realicé consultas de selección (`SELECT`) para filtrar empleados por salario, puesto y rango.
- Usé funciones de agregación (`AVG`, `SUM`) para calcular promedios y totales.
- Actualicé salarios con `UPDATE` y eliminé registros con `DELETE`.

**Para el reto:**

- Inserté productos tecnológicos y clientes ficticios.
- Realicé consultas de agregación para calcular ventas y gastos.
- Actualicé el inventario con `UPDATE producto SET stock = stock - ...`.

## Errores

En la actividad guiada, al ejecutar varias veces los `INSERT`, aparecieron duplicados en la tabla `detalle_pedido`. Para solucionarlo, utilicé `ON CONFLICT` para sumar las cantidades de los productos en lugar de generar errores. También, al volver a ejecutar el script completo, tuve problemas con los IDs que ya estaban ocupados, por lo que utilicé `TRUNCATE TABLE ... RESTART IDENTITY CASCADE;` para limpiar las tablas y reiniciar los identificadores. En el reto se presentó el mismo problema de los duplicados en `detalle_pedido`, por lo que se resolvió de la misma manera, utilizando `ON CONFLICT` para sumar las cantidades.

## Conclusión

En esta práctica, aprendí a utilizar diferentes comandos de SQL para insertar, consultar, actualizar y eliminar datos de una base de datos. También aprendí a utilizar funciones como `AVG` y `SUM` para calcular promedios y totales, además de aplicar filtros para obtener información específica. Con la actividad guiada y el reto pude entender mejor cómo se relacionan las tablas mediante claves primarias y foráneas, y cómo organizar la información. También aprendí a resolver algunos errores, como los registros duplicados y los problemas con los identificadores, utilizando `ON CONFLICT` y `TRUNCATE TABLE`. En general, esta práctica me ayudó a comprender mejor cómo manejar los datos de una base de datos y cómo realizar consultas que pueden ser útiles en situaciones reales, como llevar un inventario o conocer cuáles son los productos más vendidos.
