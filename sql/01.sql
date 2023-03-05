/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(DISTINCT customer) FROM customer JOIN address USING (address_id) JOIN city USING (city_id) JOIN country USING (country_id) WHERE NOT country = 'United States';
