--Question 1--

SELECT *
FROM customer
LEFT JOIN address
ON address.address_id  = customer.address_id
WHERE district LIKE 'Texas';

--There are 5 people from Texas--






--Question 2--

SELECT first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

--There are 1,406 payments over 6.99--



--Question 3--

SELECT customer_id, amount
FROM payment;


SELECT*
FROM payment
WHERE amount = (
	SELECT amount
	FROM payment
	GROUP BY customer_id, payment.amount
	HAVING COUNT(*) > 175
	ORDER BY COUNT(*) DESC
);

--Having some troubles with this one---




---Question 4---


SELECT *
FROM customer
LEFT JOIN city
ON city.city_id  = customer.customer_id
WHERE country_id = 6;

SELECT *
FROM city;

--All these people live in argentina. The country id for Argentina is 6. 




--Question 5--


SELECT *
FROM category
WHERE category_id = (
SELECT category_id
FROM film_category
GROUP BY category_id
ORDER BY COUNT(*) DESC
LIMIT 1);


--Go Sports--




--Question 6--


SELECT *
FROM  film;



SELECT film.film_id, film.title, film.description, film.release_year, film.length, film.rating, 
film.language_id, film.rental_duration, film.rental_rate, film.replacement_cost, COUNT(film_actor)
FROM film 
JOIN film_actor 
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY COUNT(film_actor) DESC
LIMIT 1;


--FILM 508 - Lambs Cincinatti--






--Question 7--


SELECT *
FROM film_actor;

SELECT actor_id, COUNT(*)
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(*);

--Actor 148 Emily has only been in 14 movies--





--Question 8--

SELECT country_id, COUNT(*)
FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC
LIMIT 1;



--India has the most cities--





--Question 9--


SELECT actor.first_name, actor.last_name, COUNT(film_id)
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.first_name, actor.last_name
HAVING COUNT(film_id) BETWEEN 23 AND 26
ORDER BY COUNT(film_id);

