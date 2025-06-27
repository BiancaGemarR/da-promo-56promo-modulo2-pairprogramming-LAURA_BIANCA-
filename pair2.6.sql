USE northwind;
/*  4. Conociendo a las empleadas:
El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras. 
Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados de la empresa Northwind. 
Esta consulta incluirá los campos EmployeeID, LastName y FirstName.*/
SELECT employee_id, last_name, first_name
	FROM employees;
/* 5. Conociendo los productos más baratos:
Supongamos que en nuestro primer día en la empresa nos informan que están llevando a cabo una reestructuración del negocio. 
Nuestras compañeras nos comentan que, en estos momentos, Northwind tiene una amplia gama de productos en venta, algunos de los 
cuales tienen un éxito limitado entre las clientas. Nuestra primera tarea consiste en identificar aquellos productos (tabla products)
 cuyos precios por unidad (UnitPrice) oscilen entre 0 y 5 dólares, es decir, los productos más asequibles.*/
SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 0.0 AND 5.0;

/* 6. Conociendo los productos que no tienen precio:
Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos que no tengan precio, 
porque lo hayan dejado vacío al introducir los datos (NULL).*/
SELECT product_name, unit_price
FROM products
WHERE unit_price IS NULL;  -- todos tienen precio

/*7. Comparando productos:
Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID menor que 20 
(para tener una muestra significativa pero no tener que ver todos los productos existentes).
💡 Pista 💡 Recuerda que podemos incluir varias condiciones en el WHERE*/
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price < 15 AND product_id < 20;

/* 8. Cambiando de operadores:
Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero invirtiendo el uso de los operadores y queremos saber 
aquellos que tengan un precio superior a 15 dólares y un ID superior a 20..
💡 Pista 💡 Podemos usar NOT*/
SELECT product_id, product_name, unit_price
FROM products
WHERE NOT unit_price < 15 AND NOT product_id < 20;

/* 9.Conociendo los países a los que vendemos:
A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio en esas regiones y 
al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. Realiza una consulta para obtener ese dato. */
SELECT DISTINCT country
FROM customers;
 
/* 10.Conociendo el tipo de productos que vendemos en Northwind:
Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios */
SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id ASC
LIMIT 10;

/* 11.Ordenando los resultados:
Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente */
SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

/* 12.Que pedidos tenemos en nuestra BBDD:
Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. 
Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details) */
SELECT DISTINCT order_id, product_id
FROM order_details;

-- BONUS 
/* 13.Qué pedidos han gastado más:
Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa (en la tabla order_details), desde la dirección nos piden conocer los 3 pedidos 
que han supuesto un mayor ingreso para la empresa. Crea una columna en esta consulta con el alias ImporteTotal. 
Nota: Utiliza UnitPrice y Quantity para calcular el importe total. */
SELECT order_idcustomers AS Importetotal
FROM order_details
WHERE Importetotal = unit_price * quantity;

/* 14.Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:
Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados entre la 5 y la 10 mejor posición 
en cuanto al coste económico total ImporteTotal.💡 Pista 💡 Usa LIMIT y OFFSET para mostrar los resultados. */


/* 15.Selecciona envíos con retraso:
Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. Últimamente se están dando retrasos en muchas entregas y 
por ello se busca realizar la acción preventiva de enviar los paquetes con varios días adicionales de antelación. Para comenzar a planear esos envíos anticipados, 
nos piden conocer cuál sería la fecha de envío (ShippedDate) de los pedidos almacenados en la base de datos, si estos sufrieran un retraso de 5 días. 
Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.
💡 Pista 💡 Para realizar lo anterior, busca documentación de la función DATE_ADD para MySQL. */


/* 16.Selecciona los productos más rentables:
Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado que el rango de productos que puede dar más beneficios parece ser el de 
aquellos con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. Selecciona los datos de ese rango de productos usando el operador BETWEEN */


/* 17.Selecciona los productos con unos precios dados:
Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares (un rango muy concreto de precios del que la empresa quiere 
maximizar sus ventas en un futuro). Usa IN para conseguirlo de manera eficiente. */