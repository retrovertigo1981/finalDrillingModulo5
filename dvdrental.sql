INSERT INTO address (address, address2, district, city_id, postal_code, phone) 
VALUES( 'Carlos Condell 234', '', 'Rengo', 21, '43512', '937222958967');


-- tabla customer (insert, update and delete)

INSERT INTO customer (store_id, first_name, last_name, email, address_id, active) 
VALUES (2, 'Sebastián', 'Peña', 'sebapj@example.com', 606, 1);

UPDATE customer
SET first_name = 'Sebastián Andrés',
    email = 'sebastian.pena@example.com'
WHERE customer_id = 600;

DELETE FROM customer
WHERE customer_id = 600;


-- tabla staff (insert, update and delete)

INSERT INTO staff (first_name, last_name, address_id, email, store_id, username, "password", picture)
VALUES('Juan', 'Pérez', 606, 'juanp@example.com', 1, 'jonnyP', '8cb2237d0679ca88db6464eac60da96345513964', 'https://randomuser.me/api/portraits/men/75.jpg');

UPDATE staff
SET first_name = 'Juan Alberto'
WHERE staff_id = 3;

DELETE FROM staff
WHERE staff_id = 3;


-- tabla actor (insert, update and delete)

INSERT INTO actor (first_name, last_name) 
VALUES('Joe', 'Federman');

UPDATE actor
SET first_name = 'Jonny'
WHERE actor_id = 201;

DELETE FROM actor
WHERE actor_id = 201;


-- consultas 


-- Listar todas las “rental” con los datos del “customer” dado un año y mes.


SELECT 
    rental.rental_id,
    rental.rental_date,
    rental.return_date,
    rental.inventory_id,
    inventory.film_id, 
    film.title,
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.email,
    customer.store_id
FROM 
    rental
JOIN 
    customer ON rental.customer_id = customer.customer_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
WHERE 
    EXTRACT(YEAR FROM rental.rental_date) = 2005
    AND EXTRACT(MONTH FROM rental.rental_date) = 8;


-- Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”

SELECT 
    payment_id,
    payment_date,
    amount
FROM
    payment;


-- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0


SELECT * 
FROM 
    film 
WHERE 
    rental_rate > 4.0 and release_year = 2006;





