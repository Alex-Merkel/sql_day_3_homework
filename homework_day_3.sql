-- Question 1:
select first_name, last_name, district
from customer as c
inner join address as a
on c.address_id = a.address_id
where district like 'Texas';

-- Question 2:
select first_name, last_name, amount
from customer as c
inner join payment as p 
on c.customer_id = p.customer_id
where amount > 6.99;

-- Question 3: 
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

-- Question 4:
select first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
where country_id = 66;

-- Question 5:
select first_name, last_name, count(payment_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name
order by count(payment_id) desc;

select staff_id, sum(amount)
from payment
group by staff_id
order by staff_id desc;

-- Question 6:
select rating, count(rating)
from film
group by rating
having count(rating) > 0
order by count(rating) desc;

-- Question 7:
select distinct first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by first_name desc
);

-- Question 8:
-- ** We gave away no free rentals:
select count(amount)
from payment
full outer join rental
on payment.rental_id = rental.rental_id
where payment.rental_id is Null
or rental.rental_id is Null;

-- *Also did below to confirm there weren't any payment amounts of 0:
select count(amount)
from payment
full outer join rental
on payment.rental_id = rental.rental_id
where payment.rental_id = 0
or rental.rental_id = 0;

