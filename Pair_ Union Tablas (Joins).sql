USE northwind;

SELECT * FROM customers;
/* Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una 
consulta a la base de datos con la que podamos conocer cuántos pedidos ha 
realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos */

SELECT customers.customer_id AS identificador, customers.company_name AS nombre_empresa, COUNT(orders.order_id) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id 
WHERE customers.country = "UK"
GROUP BY identificador;
-- HAVING COUNT(orders.order_id)

/* Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y 
han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query 
que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins. */

SELECT customers.company_name AS nombre_empresa, year(orders.order_date) AS año, SUM(order_details.quantity) AS cantidad_objetos
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON order_details.order_id = orders.order_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, YEAR(orders.order_date);

/*
Mejorad la query anterior:
Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, 
teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.
La tabla resultante será:
*/
SELECT * FROM order_details;

SELECT 
	customers.company_name AS nombre_empresa, 
	year(orders.order_date) AS año, 
	SUM(order_details.quantity) AS cantidad_objetos, 
	ROUND(SUM(order_details.total_price * (1 - order_details.discount)), 2) AS DineroTotal
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON order_details.order_id = orders.order_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, YEAR(orders.order_date);


