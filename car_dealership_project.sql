

------------------------------------- CREATE TABLES -----------------------------------------
 
CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  serial_num INTEGER,
  year INTEGER,
  make VARCHAR(20),
  model VARCHAR(20),
  customer_id INTEGER,
  salesperson_id INTEGER, 
  dealership_id INTEGER NOT NULL
);

-- Add Foreign Keys on "car" (customer_id, salesperson_id, dealership_id)

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  invoice_id INTEGER,
  car_id INTEGER
);

SELECT *
FROM customer

-- Add Foreign Keys on "customer" (invoice_id, car_id)

CREATE TABLE salesperson (
  salesperson_id INTEGER PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  dealership_id INTEGER
);

-- Add Foreign Key on "salesperson" (dealership_id)

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  ticket_id INTEGER,
  dealership_id INTEGER
);


-- Add Foreign Keys on "mechanic" (ticket_id, dealership_id)


CREATE TABLE dealership (
  dealership_id INTEGER PRIMARY KEY,
  address VARCHAR(100),
  name VARCHAR(50)
);


CREATE TABLE service_ticket (
  ticket_id SERIAL PRIMARY KEY,
  service_type VARCHAR(50),
  price NUMERIC(7,3),
  customer_id INTEGER,
  mechanic_id INTEGER,
  service_id INTEGER,
  serial_num INTEGER
);

-- Add Foreign Keys on "service_ticket" (customer_id, mechanic_id, service_id, car_id)


CREATE TABLE invoice (
  invoice_id INTEGER PRIMARY KEY,
  car_id INTEGER,
  base_price NUMERIC(7,2),
  add_on_price NUMERIC(7,2),
  customer_id INTEGER,
  salesperson_id INTEGER,
  ticket_id INTEGER,
  dealership_id INTEGER
);

-- Add Foreign Keys on "invoice" (customer_id, salesperson_id, ticket_id, dealership_id)


CREATE TABLE service (
  service_id SERIAL PRIMARY KEY,
  oil_change BOOLEAN,
  tire_rotation BOOLEAN,
  tune_up BOOLEAN,
  replace_part BOOLEAN,
  other BOOLEAN
);


CREATE TABLE add_on (
  add_on_id SERIAL PRIMARY KEY,
  digital_display BOOLEAN,
  leather_interior BOOLEAN,
  sun_roof BOOLEAN,
  power_windows BOOLEAN,
  heated_seats BOOLEAN,
  navigation BOOLEAN,
  backup_camera BOOLEAN,
  add_on_price NUMERIC(6,2)
);


------------------------------------- ADD DATA -----------------------------------------


-- Car [serial_num INTEGER, year INTEGER, make VARCHAR(20), model VARCHAR(20),
-- customer_id INTEGER, salesperson_id INTEGER, dealership_id INTEGER NOT NULL]

-- Create procedure to add data to car:

CREATE OR REPLACE PROCEDURE add_car(
	serial_num INTEGER,
	year INTEGER,
	make VARCHAR(20),
	model VARCHAR(20),
	customer_id INTEGER,
	salesperson_id INTEGER,
	dealership_id INTEGER
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO car(serial_num, year, make, model, customer_id, salesperson_id, dealership_id)
	VALUES(serial_num, year, make, model, customer_id, salesperson_id, dealership_id);
END
$$;


-- Execute procedure - Add data to car table:
CALL add_car(12345, 2006, 'Toyota', 'Corolla', 1, 20, 33);
CALL add_car(12346, 2016, 'Honda', 'Civic', 2, 25, 33);
CALL add_car(12347, 2020, 'Chevrolet', 'Silervado', 3, 22, 33);
CALL add_car(12351, 2013, 'Hundai', 'Sonata', 4, 20, 33);
CALL add_car(12332, 2022, 'Toyota', 'Prius', 5, 13, 33);
CALL add_car(12832, 2004, 'Mercury', 'Eclipse', 6, 22, 33);
CALL add_car(12345, 2006, 'Toyota', 'Corolla', 7, 20, 33);
CALL add_car(18294, 2017, 'Ford', 'F150', 8, 15, 33);
CALL add_car(12323, 2015, 'Kia', 'Sorrento', 9, 22, 33);
CALL add_car(13445, 2013, 'Dodge', 'Ram', 10, 25, 33);

SELECT *
FROM car;

-- Create procedure to add data to customer:
CREATE OR REPLACE PROCEDURE add_customer(
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  invoice_id INTEGER,
  car_id INTEGER
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO customer(first_name, last_name, invoice_id, car_id)
	VALUES(first_name, last_name, invoice_id, car_id);
END
$$;

-- Execute procedure - Add data to customer table:
CALL add_customer('Jennifer', 'Kennedy', 1, 2);
CALL add_customer('Anthony', 'Alfonsi', 2, 8);
CALL add_customer('Andrew', 'Cunniff', 3, 3);
CALL add_customer('Tara', 'Morris', 10, 4);
CALL add_customer('Stephanie', 'Wilson', 9, 5);
CALL add_customer('Bruce', 'Conway', 8, 6);
CALL add_customer('Sarah', 'Tinkham', 7, 9);
CALL add_customer('Buckley', 'Alfonsi', 6, 10);
CALL add_customer('Joey', 'Cunniff', 5, 1);
CALL add_customer('Nora', 'Keene', 4, 7);

SELECT *
FROM customer;


-- Insert data into salesperson table:
--(salesperson_id, first_name, last_name, dealership_id);

INSERT INTO salesperson(first_name, last_name, dealership_id)
VALUES (20, 'Robert', 'Selwitz', 33);

INSERT INTO salesperson(first_name, last_name, dealership_id)
VALUES (13, 'Joe', 'Berman', 33);

INSERT INTO salesperson(first_name, last_name, dealership_id)
VALUES (22, 'Debbie', 'Miller', 33);

INSERT INTO salesperson(first_name, last_name, dealership_id)
VALUES (15, 'Brenda', 'MacGowan', 33);

INSERT INTO salesperson(first_name, last_name, dealership_id)
VALUES (25, 'Ron', 'Johnson', 33);

SELECT *
FROM salesperson;


-- Insert data into mechanic table:
--(mechanic_id(SERIAL), first_name, last_name, ticket_id(SERIAL), dealership_id(INTEGER);

INSERT INTO mechanic(first_name, last_name, dealership_id)
VALUES ('Tony', 'Henderson', 33);

INSERT INTO mechanic(first_name, last_name, dealership_id)
VALUES ('Mary', 'Cooney', 33);

INSERT INTO mechanic(first_name, last_name, dealership_id)
VALUES ('Ryan', 'Long', 33);

INSERT INTO mechanic(first_name, last_name, dealership_id)
VALUES ('Jerry', 'Shaw', 33);

INSERT INTO mechanic(first_name, last_name, dealership_id)
VALUES ('Ron', 'Johnson', 33);

SELECT *
FROM mechanic;


-- Insert data into  dealership:
--(dealership_id INTEGER, address, name);

INSERT INTO dealership(dealership_id, address, name)
VALUES (33, '123 Monroe Ave, Chicago, IL 60618', 'Zippy Automotives');

INSERT INTO dealership(dealership_id, address, name)
VALUES (65, '71 State St, Chicago IL 60643', 'Jupiter Wheels & Deals');

SELECT *
FROM dealership;


-- Insert data into service:
--(service_id (SERIAL), oil_change(BOOLEAN), tire_rotation(BOOLEAN), tune_up(BOOLEAN), replace_part(BOOLEAN), other(BOOLEAN))

INSERT INTO service(oil_change, tire_rotation, tune_up, replace_part, other)
VALUES (FALSE, FALSE, TRUE, FALSE, FALSE);

INSERT INTO service(oil_change, tire_rotation, tune_up, replace_part, other)
VALUES (TRUE, FALSE, FALSE, FALSE, FALSE);

INSERT INTO service(oil_change, tire_rotation, tune_up, replace_part, other)
VALUES (FALSE, TRUE, TRUE, FALSE, FALSE);

INSERT INTO service(oil_change, tire_rotation, tune_up, replace_part, other)
VALUES (TRUE, FALSE, TRUE, FALSE, TRUE);

INSERT INTO service(oil_change, tire_rotation, tune_up, replace_part, other)
VALUES (FALSE, FALSE, FALSE, TRUE, FALSE);

SELECT *
FROM service s 


-- Insert data into service_ticket:
--(ticket_id (SERIAL), service_type(VARCHAR), price NUMERIC(7,3), customer_id, mechanic_id, service_id, serial_num)

INSERT INTO service_ticket(service_type, price, customer_id, mechanic_id, service_id, serial_num)
VALUES ('tune-up', 49.99, 1, 2, 1, 12345);

INSERT INTO service_ticket(service_type, price, customer_id, mechanic_id, service_id, serial_num)
VALUES ('oil change', 65.00, 2, 3, 2, 12346);

INSERT INTO service_ticket(service_type, price, customer_id, mechanic_id, service_id, serial_num)
VALUES ('tune-up + tire rotation', 125.99, 4, 2, 3, 12347);

INSERT INTO service_ticket(service_type, price, customer_id, mechanic_id, service_id, serial_num)
VALUES ('tune-up + oil change', 114.99, 3, 5, 4, 12351);

INSERT INTO service_ticket(service_type, price, customer_id, mechanic_id, service_id, serial_num)
VALUES ('replace break pads', 83.00, 8, 1, 5, 12332);

INSERT INTO service_ticket(service_type, price, mechanic_id, serial_num)
VALUES ('paint job', 233.00, 1, 13445);

SELECT *
FROM service_ticket


-- Insert data into add_on:
--(add_on_id (SERIAL), digital_display(BOOLEAN), leather_interior(BOOLEAN), sun_roof(BOOLEAN), power_windows(BOOLEAN), heated_seats(BOOLEAN), 
-- navigation(BOOLEAN), back_up_camera(BOOLEAN), add_on_price(NUMERIC)

INSERT INTO add_on(digital_display, leather_interior, sun_roof, power_windows, heated_seats, navigation, backup_camera, add_on_price)
VALUES (FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, 550.00);

INSERT INTO add_on(digital_display, leather_interior, sun_roof, power_windows, heated_seats, navigation, backup_camera, add_on_price)
VALUES (TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, 899.99);

INSERT INTO add_on(digital_display, leather_interior, sun_roof, power_windows, heated_seats, navigation, backup_camera, add_on_price)
VALUES (TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 199.99);

INSERT INTO add_on(digital_display, leather_interior, sun_roof, power_windows, heated_seats, navigation, backup_camera, add_on_price)
VALUES (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 349.99);

INSERT INTO add_on(digital_display, leather_interior, sun_roof, power_windows, heated_seats, navigation, backup_camera, add_on_price)
VALUES (TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 4500.00);

SELECT *
FROM add_on 


-- Insert data into invoice:
--(invoice_id, car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id) 

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (1, 3, 3500.00, 0, 1, 20, 1, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (2, 4, 12400.00, 250.00, 2, 25, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (3, 5, NULL, NULL, 3, NULL, 5, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (4, 6, 10200.00, 0, 4, 20, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (5, 7, 28600, 2200, 5, 13, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (6, 8, NULL, NULL, NULL, NULL, 6, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (7, 9, 5300.00, NULL, 7, 20, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (8, 10, 16000, 1500, 8, 15, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (9, 11, 10500.00, NULL, 9, 22, NULL, 33);

INSERT INTO invoice(car_id, base_price, add_on_price, customer_id, salesperson_id, ticket_id, dealership_id)
VALUES (10, 12, 6500, NULL, 10, 25, 3, 33);

SELECT *
FROM invoice 

------------------------------------- ADD FOREIGN KEYS -----------------------------------------

-- Add Foreign Keys on "car" (customer_id, salesperson_id, dealership_id)
ALTER TABLE car
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
ADD FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
ADD FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id);


-- Add Foreign Keys on "customer" (invoice_id, car_id)
ALTER TABLE customer
ADD FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
ADD FOREIGN KEY(car_id) REFERENCES car(car_id);


-- Add Foreign Key on "salesperson" (dealership_id)
ALTER TABLE salesperson 
ADD FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id);

-- Add Foreign Keys on "mechanic" (ticket_id, dealership_id)
ALTER TABLE mechanic
ADD FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
ADD FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id);

-- Add Foreign Keys on "service_ticket" (customer_id, mechanic_id, service_id, car_id)
ALTER TABLE service_ticket
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
ADD FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
ADD FOREIGN KEY(service_id) REFERENCES service(service_id);

-- Add Foreign Keys on "invoice" (customer_id, salesperson_id, ticket_id, dealership_id)
ALTER TABLE invoice 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
ADD FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
ADD FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
ADD FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id);







