
use sakila;

SELECT COUNT(*) AS num_copies
FROM inventory
JOIN film
ON inventory.film_id = film.film_id
WHERE film.title = "Hunchback Impossible";


SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);


SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id IN (
SELECT actor_id
FROM film_actor
WHERE film_id = (SELECT film_id FROM film WHERE title = "Alone Trip")
);




SELECT title
FROM film
WHERE film_id IN (
SELECT film_id
FROM film_category
WHERE category_id = (
SELECT category_id
FROM category
WHERE name = 'Family'));



SELECT first_name, last_name, email
FROM customer
WHERE address_id IN (
SELECT address_id
FROM address
WHERE city_id IN (
SELECT city_id
FROM city
WHERE country_id = (
SELECT country_id
FROM country
WHERE country = 'Canada')));


SELECT c.first_name, c.last_name, c.email
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';