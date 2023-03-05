/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT film_b.title FROM film_actor film_actor_a
        JOIN film_actor film_actor_b USING (actor_id)
        JOIN film film_a ON (film_actor_a.film_id = film_a.film_id)
        JOIN film film_b ON (film_actor_b.film_id = film_b.film_id)
        WHERE film_a.title = 'AMERICAN CIRCUS'
        GROUP BY film_b.title
        HAVING count(actor_id) >= 2 ORDER BY film_b.title;
