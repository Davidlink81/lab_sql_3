----------------
-- LAB 3 SQL --
---------------- 

use sakila;
-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) from sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
select count(distinct language_id) from sakila.film;

-- 3. How many movies were released with `"PG-13"` rating?
select count(*) as Total_movies_PG_13 from sakila.film where rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.
select title, length as longet_movies from sakila.film order by length desc limit 10;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
select * from sakila.payment;
select Datediff(last_update, curdate()) as company_operating from sakila.store;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select * , date_format(rental_date, '%M') as rental_month , date_format(rental_date, '%W') as rental_weekday from sakila.rental limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week. 
select *, date_format(rental_date, '%W') as rental_weekday,
case
	when date_format(rental_date, '%W') IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') then 'work_day'
	else 'weekend'
end as day_type
from sakila.rental;

-- 8. How many rentals were in the last month of activity?
select *, date_format(rental_date, '%Y') as rental_year, date_format(rental_date, '%M') as rental_month from sakila.rental order by rental_year desc;
select count(*) as rentals_last_month from sakila.rental where date_format(rental_date, '%Y') = '2006' and date_format(rental_date, '%M') ='February';