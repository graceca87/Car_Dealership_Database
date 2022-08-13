

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

-- Add Foreign Keys on "customer" (invoice_id, car_id)

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
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
  dealership_id SERIAL PRIMARY KEY,
  address VARCHAR(100),
  name VARCHAR(50)
);


CREATE TABLE service_ticket (
  ticket_id SERIAL PRIMARY KEY,
  service_type INTEGER,
  price NUMERIC(7,3),
  customer_id INTEGER,
  mechanic_id INTEGER,
  service_id INTEGER,
  serial_num INTEGER
  car_id INTEGER NOT NULL
);

-- Add Foreign Keys on "service_ticket" (customer_id, mechanic_id, service_id, car_id)


CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
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
  oil_change INTEGER,
  tire_rotation INTEGER,
  tune_up INTEGER,
  replace_part INTEGER,
  other VARCHAR(100)
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
ADD FOREIGN KEY(service_id) REFERENCES service(service_id),
ADD FOREIGN KEY(car_id) REFERENCES car(car_id);

-- Add Foreign Keys on "invoice" (customer_id, salesperson_id, ticket_id, dealership_id)
ALTER TABLE invoice 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
ADD FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
ADD FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
ADD FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id);


------------------------------------- ADD DATA -----------------------------------------

-- Car [serial_num INTEGER, year INTEGER, make VARCHAR(20), model VARCHAR(20),
-- customer_id INTEGER, salesperson_id INTEGER, dealership_id INTEGER NOT NULL]















