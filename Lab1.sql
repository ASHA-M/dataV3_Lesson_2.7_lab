USE sakila;

#How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT category_id, count(*)   #first select everything to visualise what the table looks like once its joined and then change select to only get the columns you want
FROM film AS fi  #calling film table as fi
INNER JOIN film_category AS cat
ON fi.film_id = cat.film_id
GROUP BY category_id;


# Display the total amount rung up by each staff member in August of 2005.
SELECT st.staff_id, sum(amount) 
FROM staff AS st
INNER JOIN payment AS pay
ON st.staff_id = pay.staff_id
GROUP BY st.staff_id;



# Which actor has appeared in the most films?
SELECT actor_id, count(*)
FROM film as fi
INNER JOIN film_actor as act  #check if the key has same value in both tables and if not then write the On statement
ON fi.film_id = act.film_id #after doing this look at the question and see what you are looking for
GROUP BY actor_id
ORDER BY count(*) desc;

# Most active customer (the customer that has rented the most number of films)

SELECT re.customer_id, count(*)
FROM rental AS re
INNER JOIN customer AS cus
ON re.customer_id = cus.customer_id #whenever you see 1 use group by
GROUP BY customer_id 
ORDER BY count(*) DESC;

#Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address
FROM staff AS st
INNER JOIN address AS ad
ON st.address_id = ad.address_id;

#List each film and the number of actors who are listed for that film.

SELECT title, count(actor_id)
FROM film AS fi
INNER JOIN film_actor AS act
ON fi.film_id = act.film_id
GROUP BY title;


#Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT last_name, sum(amount)
FROM payment AS pay
INNER JOIN customer AS cus
ON pay.customer_id = cus.customer_id
GROUP BY last_name
ORDER BY last_name ASC;


#List number of films per category.  #This question sounds like the first one???

SELECT category_id, count(*)   
FROM film AS fi 
LEFT JOIN film_category as cat
ON fi.film_id = cat.film_id
GROUP BY category_id;
