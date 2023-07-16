--Inserta el Address_id 606 para el nuevo customer
INSERT INTO Address (address_id, address, district, city_id, postal_code, phone, last_update)
VALUES (606, '1337 Dominic Santiago', 'Antofagasta', 27, 1240000, 123456789876, now());

--Inserta un Customer
INSERT INTO Customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (600, 1, 'Giovanni', 'Inarejo', 'giovanni.inarejo@sakilacustomer.org', 606, true, '2023-07-16', getdate(), 1);

--Modificar un atributo de Customer
UPDATE Customer
SET email = 'giovanni.inarejo.escobar@sakilacustomer.org'
WHERE customer_id = 600;

--Eliminar un Customer
DELETE FROM Customer
WHERE customer_id = 600;

--Insertar un miembro del Staff
INSERT INTO Staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES (3, 'Giovanni', 'Inarejo', 606, 'giovanni.inarejo@sakilastaff.com', 1, true, 'Giovanni', '8cb2237d0679ca88db6464eac60da96345513964', now());

--Modificar un atributo del Staff
UPDATE Staff
SET email = 'giovanni.inarejo.escobar@sakilastaff.com'
WHERE staff_id = 3;

--Eliminar un miembro del Staff
DELETE FROM Staff
WHERE staff_id = 3;

--Insertar un Actor
INSERT INTO Actor (actor_id, first_name, last_name, last_update)
VALUES (201, 'Jack', 'O'Connell', now());

--Modificar un atributo de Actor
UPDATE Actor
SET last_name = 'Black'
WHERE actor_id = 201;

--Eliminar un Actor
DELETE FROM Actor
WHERE actor_id = 201;

--Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT Rental.rental_id, Rental.rental_date, Customer.first_name, Customer.last_name, Customer.email
FROM Rental
INNER JOIN Customer ON Rental.customer_id = Customer.customer_id
WHERE EXTRACT(YEAR FROM Rental.rental_date) = 2005
AND EXTRACT(MONTH FROM Rental.rental_date) = 07;

--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id, payment_date, amount
FROM Payment;

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT * FROM Film
WHERE release_year = 2006
AND rental_rate > 4.0;