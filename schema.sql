-- AEROSMOOTH DATABASE SCHEMA
-- Style: snake_case and rails styling

-- 1. CLEANUP
-- useful as I kept bungling the creates
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS task_tools;
DROP TABLE IF EXISTS order_task;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer_parts;
DROP TABLE IF EXISTS contract;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS supplier_part;
DROP TABLE IF EXISTS technician_certifications;
DROP TABLE IF EXISTS technicians;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS tools;
DROP TABLE IF EXISTS certification;
DROP TABLE IF EXISTS part_catalog;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS customer;

-- 2. MASTER DATA / REFERENCE TABLES

CREATE TABLE supplier (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE part_catalog (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manual_link VARCHAR(500) NOT NULL,
    description TEXT -- can be null
);

-- this table tells you which suppliers supply which parts
CREATE TABLE supplier_part (
    id SERIAL PRIMARY KEY, -- synthetic, so a key always exists
    supplier_id INT NOT NULL,
    part_id INT NOT NULL,
    -- supplier / part is the actual primary key of this table, so we'll enforce uniqueness
    lead_time_days INT CHECK (lead_time_days > 0),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (part_id) REFERENCES part_catalog(id),
    UNIQUE (supplier_id, part_id)
);

CREATE TABLE certification (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE tools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    calibrated_at DATE,
    CHECK (calibrated_at <= CURRENT_DATE)
);

CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- 3. PEOPLE & ROLES

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    address VARCHAR(500),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    hire_date DATE NOT NULL
);

-- Subtype: Technicians
-- The PK 'id' is also the FK to employee 'id'
CREATE TABLE technicians (
    id INT PRIMARY KEY,
    shift_schedule VARCHAR(50), 
    FOREIGN KEY (id) REFERENCES employee(id) ON DELETE CASCADE
);

CREATE TABLE technician_certifications (
    id SERIAL PRIMARY KEY,
    technician_id INT NOT NULL,
    certification_id INT NOT NULL,
    date_acquired DATE CHECK (date_acquired <= CURRENT_DATE),
    FOREIGN KEY (technician_id) REFERENCES technicians(id),
    FOREIGN KEY (certification_id) REFERENCES certification(id),
    UNIQUE (technician_id, certification_id)
);

-- 4. RESOURCES & ASSETS

CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    part_id INT NOT NULL,
    quantity INT DEFAULT 0 CHECK (quantity >= 0) NOT NULL,
    location VARCHAR(50) NOT NULL, 
    FOREIGN KEY (part_id) REFERENCES part_catalog(id)
);

CREATE TABLE customer_parts (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    part_id INT NOT NULL,
    serial_number VARCHAR(100) NOT NULL,
    name VARCHAR(255),
    expected_return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (part_id) REFERENCES part_catalog(id),
    UNIQUE (customer_id, part_id, serial_number)
);

-- 5. COMMERCIAL (CONTRACTS)

CREATE TABLE contract (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    document_link VARCHAR(500),
    sla_terms TEXT, 
    labor_rate DECIMAL(10, 2) NOT NULL CHECK (labor_rate >= 0),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    CHECK (end_date >= start_date)
);

-- 6. OPERATIONS (WORK FLOW)

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_part_id INT NOT NULL,
    contract_id INT NOT NULL,
    status VARCHAR(50) DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_part_id) REFERENCES customer_parts(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    CHECK (status IN ('open', 'in_progress', 'hold', 'review', 'closed'))
);

CREATE TABLE order_task (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    technician_id INT NOT NULL,
    inventory_id INT, -- a task could or could not involve a piece of inventory
    status VARCHAR(50) DEFAULT 'pending' NOT NULL,
    logs TEXT, -- could or could not involve text
    hours DECIMAL(5, 2) DEFAULT 0.0 CHECK (hours >= 0), -- could or could not involve some hours
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (technician_id) REFERENCES technicians(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    CHECK (status IN ('pending', 'in_progress', 'completed', 'blocked'))
);

CREATE TABLE task_tools (
    id SERIAL PRIMARY KEY,
    order_task_id INT NOT NULL,
    tool_id INT NOT NULL,
    FOREIGN KEY (order_task_id) REFERENCES order_task(id),
    FOREIGN KEY (tool_id) REFERENCES tools(id),
    UNIQUE (order_task_id, tool_id)
);

CREATE TABLE invoice (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(12, 2) NOT NULL CHECK (amount >= 0),
    generated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);