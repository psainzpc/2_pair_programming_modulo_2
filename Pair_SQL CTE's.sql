USE northwind;

SELECT *
FROM customers;

/* Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers. */

WITH compañias AS (
					SELECT company_name, customer_id
                    FROM customers)
SELECT *
FROM compañias;

/* Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos 
los que pertezcan a "Germany". */

WITH compañias AS (
					SELECT company_name, customer_id
                    FROM customers
                    WHERE country = "Germany")
SELECT *
FROM compañias

/* Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.

📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name). */

-- customer_id: tabla customers
-- company_name: tabla customers
-- order_id: tabla orders
-- order_date: tabla orders


WITH facturas AS (
					SELECT order_id, order_date, customer_id
					FROM orders
					)

SELECT customers.customer_id, company_name, facturas.order_id, facturas.order_date
FROM customers
INNER JOIN facturas 
ON facturas.customer_id = customers.customer_id;




		



                    
