SELECT * FROM customers;
/* Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una 
consulta a la base de datos con la que podamos conocer cuántos pedidos ha 
realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos */

SELECT customers.customer_id AS identificador, customers.company_name AS nombre_empresa, COUNT(orders.order_id) AS numero_pedidos
FROM customers
CROSS JOIN orders
WHERE customers.customer_id = orders.customer_id AND customers.country = "UK"
GROUP BY identificador
HAVING COUNT(orders.order_id);

/* Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y 
han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query 
que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins. */

SELECT customers.company_name AS nombre_empresa, customers.country, orders.order_id, orders.order_date
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = "UK"



