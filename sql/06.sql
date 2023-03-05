/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT actor_b.first_name || ' ' || actor_b.last_name AS "Actor Name" FROM film_actor film_actor_a
        JOIN film_actor film_actor_b ON film_actor_a.film_id = film_actor_b.film_id 
        JOIN actor actor_a ON film_actor_a.actor_id = actor_a.actor_id
        JOIN actor actor_b ON film_actor_b.actor_id = actor_b.actor_id
        WHERE actor_a.first_name || ' ' || actor_a.last_name = 'RUSSELL BACALL' 
        AND NOT  actor_b.first_name || ' ' || actor_b.last_name = 'RUSSELL BACALL' 
        ORDER BY actor_b.first_name || ' ' || actor_b.last_name; 
