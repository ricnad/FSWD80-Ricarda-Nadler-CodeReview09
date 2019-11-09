
1 Question:
Which employess are working at the location with the "ID=6" - show their full name and the adress from the location (including ZIP + City)

Query:
SELECT employees.emp_first_name, employees.emp_last_name, location.location_street,location.location_streetno, zip.zip, zip.zip_city FROM employees
INNER JOIN location ON employees.fk_location_id=location.location_id
INNER JOIN zip ON zip.zip=location.location_zip
WHERE location.location_id=7;

2 Question:
Show all female customers

Query:
SELECT customer_first_name, customer_last_name FROM `customer` WHERE customer_gender='female'

3 Question: 
Show all rentals including names of customers and drivers - sort by pick up date descending

Query:
SELECT rental_id, rental_pick_up_date, rental_expected_return_date,rental_actual_return_date, customer.customer_first_name, customer.customer_last_name, driver.driver_first_name, driver.driver_last_name FROM rental
INNER JOIN driver_rental on driver_rental.fk_rental_id=rental.rental_id
INNER JOIN driver on driver_rental.fk_driver_id=driver.driver_id
INNER JOIN user_login on rental.fk_login_id=user_login.login_id
INNER JOIN customer on user_login.login_id=customer.fk_login_id
ORDER BY rental_pick_up_date DESC

4 Question
Show rentals including informations about car (incl. make)

Query:
SELECT rental_id, rental_pick_up_date, rental_expected_return_date, rental_actual_return_date, car.car_plate, car_type, make_name from rental 
INNER JOIN car on fk_car_plate=car_plate
INNER JOIN car_make on car_model=fk_car_model
INNER JOIN make on fk_make_id=make_id
GROUP BY rental_id;

5 Calculate rental time

Query:
update rental set rental_expected_days=datediff(rental_expected_return_date, rental_pick_up_date);



6 Question
Show all costs per customer

Query:
SELECT rental_id, customer.customer_first_name, customer.customer_last_name, invoice.invoice_amount, additional_fees.add_fee_late_return, additional_fees.add_fee_damage, additional_fees.add_fee_empty_fuel from rental 
INSERT INTO invoice(invoice_amount) SELECT (car.car_price* 5)
INNER JOIN invoice on rental_id=fk_rental_id
INNER JOIN additional_fees on invoice.fk_add_fee_id=additional_fees.add_fee_id
INNER JOIN user_login on user_login.login_id=rental.fk_login_id
INNER JOIN customer on user_login.login_id=customer.fk_login_id

GROUP BY rental_id;


6 Question
Show employees and manager for location_streetno

Query:
SELECT employees.emp_first_name, employees.emp_last_name, location.location_id, manager.manager_start_date FROM employees
INNER JOIN manager on manager.fk_emp_no=employees.emp_no
INNER JOIN location on location.location_id=employees.fk_location_id;


SELECT car_price, (car_price*car_price) as price FROM car;
