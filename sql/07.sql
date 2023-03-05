/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

/* Get all actor ids that shared a movie with a certain actor id */
SELECT DISTINCT actor_d.first_name || ' ' || actor_d.last_name AS "Actor Name" FROM film_actor film_actor_c
        JOIN film_actor film_actor_d ON film_actor_c.film_id = film_actor_d.film_id
        JOIN actor actor_d ON film_actor_d.actor_id = actor_d.actor_id
        WHERE film_actor_c.actor_id IN
        (SELECT film_actor_b.actor_id FROM film_actor film_actor_a
                JOIN film_actor film_actor_b ON film_actor_a.film_id = film_actor_b.film_id
                JOIN actor actor_a ON film_actor_a.actor_id = actor_a.actor_id
                WHERE actor_a.first_name || ' ' || actor_a.last_name = 'RUSSELL BACALL')
        AND film_actor_d.actor_id NOT IN
        (SELECT film_actor_b.actor_id FROM film_actor film_actor_a
                JOIN film_actor film_actor_b ON film_actor_a.film_id = film_actor_b.film_id
                JOIN actor actor_a ON film_actor_a.actor_id = actor_a.actor_id
                WHERE actor_a.first_name || ' ' || actor_a.last_name = 'RUSSELL BACALL')
        ORDER BY actor_d.first_name || ' ' || actor_d.last_name;
