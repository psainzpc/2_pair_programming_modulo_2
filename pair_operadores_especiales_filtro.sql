USE northwind;
/*1. Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en 
ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.
Los resultados deberán ser:*/
SELECT*FROM customers;

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';

/*Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total 
de pedidos que han hecho todas las ciudades que empiezan por "L". */
SELECT*FROM orders;

SELECT customers.city, customers.company_name, customers.contact_name, COUNT(orders.order_id) AS "numero total"
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.city LIKE 'L%'
GROUP BY customers.city, customers.company_name, customers.contact_name;

/* Todos los clientes cuyo "country" no incluya "USA".
Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su pais y el nombre de la compañia.*/

SELECT contact_name, country, company_name
FROM customers
WHERE country NOT IN ("USA");

/* Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_a%';
