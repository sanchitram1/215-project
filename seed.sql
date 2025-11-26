-- =============================================
-- AEROSMOOTH SYNTHETIC DATA
-- Load Order: Master Data -> People -> Assets -> Commercial -> Operations
-- =============================================

-- 1. SUPPLIERS (5)
INSERT INTO supplier (name) VALUES 
('Global Aerospace Components'), ('JetStream Parts'), ('Turbine Tech Solutions'), ('Avionics World'), ('Titanium Fasteners Inc');

-- 2. PART CATALOG (50 entries)
-- A mix of Rotables (Expensive, repairable) and Consumables (Cheap, single use)
INSERT INTO part_catalog (name, manual_link, description) VALUES
('GE90 Fan Blade', 'http://manuals.ge.com/ge90', 'Composite fan blade for widebody'),
('737 Landing Gear Strut', 'http://boeing.com/737/lg', 'Main landing gear shock strut'),
('A320 Hydraulic Pump', 'http://airbus.com/hydraulics', 'Green system pump'),
('Cessna 172 Altimeter', 'http://garmin.com/alt', 'Analog barometric altimeter'),
('B777 APU Generator', 'http://honeywell.com/apu', 'Auxiliary power unit generator'),
('Weather Radar Array', 'http://collins.com/radar', 'Multi-scan weather radar'),
('Pitot Tube', 'http://thales.com/sensors', 'Airspeed sensor, heated'),
('Economy Seat Track', 'http://seats.com/track', 'Floor mounting rail'),
('Business Class Actuator', 'http://seats.com/motor', 'Recline motor assembly'),
('Galley Oven', 'http://beaerospace.com/oven', 'Convection oven unit'),
('Lavatory Pump Assembly', 'http://zodiac.com/waste', 'Vacuum waste system pump'),
('Cargo Door Latch', 'http://boeing.com/doors', 'Main deck cargo latch'),
('Cockpit Voice Recorder', 'http://l3.com/cvr', 'Solid state recorder'),
('Flight Data Recorder', 'http://honeywell.com/fdr', 'Black box'),
('Oxygen Generator', 'http://avox.com/o2', 'Chemical oxygen generator'),
('Engine Cowling Latch', 'http://latches.com', 'Nacelle hold-down latch'),
('Fuel Nozzle', 'http://ge.com/fuel', 'High pressure injection nozzle'),
('Spark Igniter', 'http://champion.com/plugs', 'Turbine engine igniter'),
('Oil Filter Assembly', 'http://filters.com/oil', 'Main scavenge oil filter'),
('Hydraulic Seal Kit A', 'http://seals.com/kit-a', 'O-rings for actuator repair'),
('Bearing - Roller', 'http://timken.com/bearing', 'Main shaft roller bearing'),
('Bearing - Ball', 'http://skf.com/bearing', 'Accessory drive ball bearing'),
('Circuit Breaker 5A', 'http://klixon.com/cb', 'Thermal circuit breaker'),
('Relay 24V', 'http://te.com/relay', 'Heavy duty power relay'),
('Wire Harness - Engine', 'http://safran.com/wiring', 'FADEC interface harness'),
('Static Wick', 'http://dayton.com/static', 'Discharge wand'),
('Nav Light Lens', 'http://astro.com/lights', 'Wingtip position light lens'),
('Brake Unit', 'http://meggitt.com/brakes', 'Carbon brake stack'),
('Tire - Main Gear', 'http://michelin.com/air', 'Radial aircraft tire'),
('Tire - Nose Gear', 'http://goodyear.com/air', 'Bias ply nose tire'),
('Windshield - Captain', 'http://ppg.com/glass', 'Heated impact resistant glass'),
('Wiper Motor', 'http://valeo.com/wipers', 'Windshield wiper drive unit'),
('Transponder Mode S', 'http://garmin.com/txp', 'ADS-B Out compliant transponder'),
('VHF Radio Unit', 'http://collins.com/vhf', 'Comms transceiver'),
('GPS Antenna', 'http://sensor.com/gps', 'Active antenna L1/L5'),
('Angle of Attack Sensor', 'http://roseamount.com/aoa', 'Vane type sensor'),
('Throttle Quadrant', 'http://boeing.com/tq', 'Thrust lever assembly'),
('Yoke Assembly', 'http://boeing.com/yoke', 'Control column'),
('Rudder Pedal', 'http://airbus.com/rudder', 'Yaw control input'),
('Flap Slat Computer', 'http://thales.com/fsc', 'Flight control computer'),
('Engine Control Unit', 'http://ge.com/ecu', 'FADEC computer'),
('Battery - Main', 'http://concorde.com/bat', 'Lead acid main battery'),
('Emergency Light PSU', 'http://honeywell.com/psu', 'Power supply unit'),
('Cabin LED Strip', 'http://lights.com/led', 'Mood lighting controller'),
('Overhead Bin Latch', 'http://interior.com/latch', 'Mechanical latch'),
('Carpet Roll', 'http://flooring.com', 'Fire retardant aisle carpet'),
('Seat Belt Extender', 'http://safety.com/belt', 'Nylon webbing extender'),
('Life Vest', 'http://safety.com/vest', 'Under seat flotation'),
('Fire Extinguisher', 'http://kidde.com/fire', 'Halon handheld unit'),
('Smoke Detector', 'http://kidde.com/smoke', 'Lavatory ionization detector');

-- 3. CERTIFICATIONS & TOOLS
INSERT INTO certification (name) VALUES 
('Airframe Class I'), ('Powerplant Class I'), ('Avionics Specialist'), ('Composite Repair'), ('NDT Inspector');

INSERT INTO tools (name, calibrated_at) VALUES
('Torque Wrench 50-250 lb', '2023-10-01'),
('Digital Multimeter Fluke', '2023-11-15'),
('Borescope Camera', '2023-09-20'),
('Hydraulic Mule', '2023-08-01'),
('Soldering Station', '2023-12-01'),
('Micrometer Set', '2023-10-05'),
('Oscilloscope', '2023-11-01'),
('Crimping Tool DMC', '2023-06-01'),
('Pitot Static Tester', '2023-09-15'),
('Jack Stands (Set)', '2023-01-01');

-- 4. CUSTOMERS (50 entries - Airlines & Private Operators)
INSERT INTO customer (name) VALUES
('Delta Airlines'), ('United Airlines'), ('American Airlines'), ('Southwest'), ('JetBlue'),
('Spirit Airlines'), ('Alaska Airlines'), ('Hawaiian Airlines'), ('Frontier'), ('Allegiant'),
('Lufthansa'), ('British Airways'), ('Air France'), ('KLM'), ('Ryanair'),
('EasyJet'), ('Emirates'), ('Qatar Airways'), ('Etihad'), ('Turkish Airlines'),
('Singapore Airlines'), ('Cathay Pacific'), ('ANA'), ('JAL'), ('Qantas'),
('Air Canada'), ('WestJet'), ('Aeromexico'), ('LATAM'), ('Avianca'),
('Copa Airlines'), ('GOL'), ('Azul'), ('Iberia'), ('TAP Portugal'),
('Swiss Intl'), ('Austrian'), ('SAS'), ('Finnair'), ('Norwegian'),
('Virgin Atlantic'), ('Aer Lingus'), ('Korean Air'), ('Asiana'), ('China Southern'),
('China Eastern'), ('Air China'), ('Thai Airways'), ('Vietnam Airlines'), ('Private Charter Corp');

-- 5. EMPLOYEES & TECHNICIANS (50 Employees, 25 Technicians)
-- We insert employees, then link them to the technician table
INSERT INTO employee (name, dob, address, salary, hire_date) VALUES
('John Smith', '1980-05-15', '123 Main St', 85000, '2015-03-10'), -- Tech 1
('Jane Doe', '1985-08-20', '456 Oak Ave', 90000, '2016-06-01'),   -- Tech 2
('Mike Ross', '1990-12-05', '789 Pine Ln', 75000, '2019-01-20'),  -- Tech 3
('Sarah Connor', '1982-03-30', '321 Elm St', 95000, '2014-11-15'),-- Tech 4
('Bruce Wayne', '1975-02-19', '1007 Mountain Dr', 120000, '2010-05-01'), -- Tech 5
('Peter Parker', '1995-08-10', '20 Ingram St', 60000, '2021-08-15'), -- Tech 6
('Tony Stark', '1970-05-29', '10880 Malibu Pt', 150000, '2008-01-01'), -- Tech 7
('Clark Kent', '1988-02-29', '344 Clinton St', 80000, '2017-04-12'), -- Tech 8
('Diana Prince', '1984-03-22', '500 Fifth Ave', 92000, '2016-09-01'), -- Tech 9
('Barry Allen', '1992-09-30', 'Central City', 78000, '2018-07-23'), -- Tech 10
('Hal Jordan', '1985-02-20', 'Coast City', 88000, '2015-12-12'), -- Tech 11
('Arthur Curry', '1986-01-29', 'Amnesty Bay', 82000, '2016-03-30'), -- Tech 12
('Victor Stone', '1998-10-15', 'Detroit MI', 70000, '2022-01-10'), -- Tech 13
('Oliver Queen', '1983-05-16', 'Star City', 96000, '2014-02-14'), -- Tech 14
('Din Djarin', '1980-01-01', 'Nevarro', 110000, '2012-05-05'), -- Tech 15
('Luke Skywalker', '1977-05-25', 'Tatooine', 105000, '2011-09-09'), -- Tech 16
('Leia Organa', '1977-05-25', 'Alderaan', 115000, '2011-09-09'), -- Tech 17
('Han Solo', '1970-07-13', 'Corellia', 100000, '2009-11-11'), -- Tech 18
('Chewbacca', '1960-11-15', 'Kashyyyk', 98000, '2005-05-05'), -- Tech 19
('Lando Calrissian', '1972-04-06', 'Cloud City', 99000, '2010-10-10'), -- Tech 20
('Wedge Antilles', '1980-12-01', 'Corellia', 85000, '2015-06-20'), -- Tech 21
('Poe Dameron', '1989-03-09', 'Yavin 4', 77000, '2019-02-28'), -- Tech 22
('Rey Skywalker', '1999-01-01', 'Jakku', 65000, '2022-05-04'), -- Tech 23
('Finn FN-2187', '1998-03-15', 'Unknown', 65000, '2022-05-05'), -- Tech 24
('Kylo Ren', '1990-11-11', 'Chandrila', 76000, '2019-12-20'), -- Tech 25
('Office Manager', '1970-01-01', 'Admin Bldg', 60000, '2010-01-01'), -- Admin 1
('Sales Rep 1', '1980-02-02', 'Sales Floor', 70000, '2015-01-01'),
('Sales Rep 2', '1982-03-03', 'Sales Floor', 70000, '2016-01-01'),
('HR Director', '1975-04-04', 'HR Office', 90000, '2012-01-01'),
('Accountant 1', '1985-05-05', 'Finance', 75000, '2017-01-01'),
('Accountant 2', '1987-06-06', 'Finance', 75000, '2018-01-01'),
('Logistics Mgr', '1978-07-07', 'Warehouse', 80000, '2014-01-01'),
('Warehouse Staff 1', '1995-08-08', 'Warehouse', 45000, '2020-01-01'),
('Warehouse Staff 2', '1996-09-09', 'Warehouse', 45000, '2020-06-01'),
('Warehouse Staff 3', '1997-10-10', 'Warehouse', 45000, '2021-01-01'),
('Receptionist', '1999-11-11', 'Front Desk', 40000, '2022-01-01'),
('Janitor', '1965-12-12', 'Facility', 40000, '2005-01-01'),
('Security Guard', '1980-01-20', 'Gate', 42000, '2015-01-01'),
('Planner 1', '1985-02-21', 'Planning', 78000, '2016-01-01'),
('Planner 2', '1988-03-22', 'Planning', 78000, '2017-01-01'),
('QA Manager', '1972-04-23', 'Quality', 95000, '2011-01-01'),
('QA Inspector 1', '1980-05-24', 'Quality', 70000, '2015-01-01'),
('QA Inspector 2', '1982-06-25', 'Quality', 70000, '2016-01-01'),
('Engineer 1', '1990-07-26', 'Engineering', 85000, '2018-01-01'),
('Engineer 2', '1992-08-27', 'Engineering', 85000, '2019-01-01'),
('IT Support', '1995-09-28', 'IT Room', 60000, '2020-01-01'),
('CEO', '1960-10-29', 'Penthouse', 250000, '2000-01-01'),
('COO', '1965-11-30', 'Exec Office', 200000, '2002-01-01'),
('CFO', '1968-12-31', 'Exec Office', 200000, '2004-01-01'),
('Intern', '2002-01-01', 'Breakroom', 30000, '2023-06-01');

-- Insert Technicians (Employees 1-25)
INSERT INTO technicians (id, shift_schedule) 
SELECT id, CASE WHEN id % 2 = 0 THEN 'Night' ELSE 'Day' END 
FROM employee WHERE id <= 25;

-- Assign Certifications to Technicians
INSERT INTO technician_certifications (technician_id, certification_id, date_acquired) VALUES
(1, 1, '2016-01-01'), (1, 2, '2017-01-01'), -- John Smith: Airframe & Powerplant
(2, 3, '2018-05-05'), -- Jane Doe: Avionics
(3, 4, '2020-02-01'), -- Mike Ross: Composites
(4, 5, '2015-06-01'), -- Sarah Connor: NDT
(5, 1, '2011-01-01'), (5, 2, '2011-01-01'), (5, 5, '2015-01-01'), -- Bruce Wayne: Expert
(7, 3, '2009-01-01'), (7, 5, '2010-01-01'); -- Tony Stark: Avionics & NDT

-- 6. INVENTORY (50 Entries)
-- Random quantities of parts from the catalog
INSERT INTO inventory (part_id, quantity, location) VALUES
(1, 5, 'Shelf A1'), (2, 2, 'Shelf A2'), (3, 10, 'Bin B1'), (4, 15, 'Bin B2'), (5, 3, 'Shelf A3'),
(6, 4, 'Shelf A4'), (7, 20, 'Bin B3'), (8, 100, 'Rack C1'), (9, 10, 'Rack C2'), (10, 8, 'Shelf A5'),
(11, 6, 'Shelf A6'), (12, 5, 'Shelf A7'), (13, 2, 'Safe 1'), (14, 2, 'Safe 2'), (15, 50, 'Hazmat 1'),
(16, 30, 'Bin B4'), (17, 25, 'Bin B5'), (18, 200, 'Bin B6'), (19, 50, 'Bin B7'), (20, 100, 'Bin B8'),
(21, 40, 'Bin C3'), (22, 40, 'Bin C4'), (23, 100, 'Elec 1'), (24, 100, 'Elec 2'), (25, 10, 'Elec 3'),
(26, 60, 'Bin C5'), (27, 20, 'Bin C6'), (28, 4, 'Shelf D1'), (29, 10, 'Rack D2'), (30, 10, 'Rack D3'),
(31, 3, 'Fragile 1'), (32, 10, 'Bin C7'), (33, 5, 'Elec 4'), (34, 8, 'Elec 5'), (35, 12, 'Elec 6'),
(36, 6, 'Bin C8'), (37, 2, 'Shelf E1'), (38, 3, 'Shelf E2'), (39, 4, 'Shelf E3'), (40, 2, 'Elec 7'),
(41, 3, 'Elec 8'), (42, 10, 'Hazmat 2'), (43, 20, 'Bin C9'), (44, 50, 'Bin C10'), (45, 30, 'Bin D4'),
(46, 10, 'Rack E4'), (47, 100, 'Bin D5'), (48, 100, 'Bin D6'), (49, 15, 'Hazmat 3'), (50, 20, 'Bin D7');

-- 7. CUSTOMER PARTS (50 Assets)
-- Specific serialized items sent by customers
INSERT INTO customer_parts (customer_id, part_id, serial_number, name, expected_return_date) VALUES
(1, 1, 'SN-GE90-001', 'Eng 1 Fan Set', '2023-12-01'), -- Delta
(1, 2, 'SN-LG-001', 'Nose Gear', '2023-11-20'),
(2, 3, 'SN-HYD-999', 'Pump Alpha', '2023-10-30'), -- United
(3, 33, 'SN-TXP-888', 'Transponder', '2023-11-15'), -- American
(5, 10, 'SN-OVN-777', 'Fwd Galley Oven', '2023-11-01'), -- JetBlue
(11, 1, 'SN-GE90-002', 'Eng 2 Fan Set', '2023-12-05'), -- Lufthansa
(17, 4, 'SN-ALT-101', 'Capt Altimeter', '2023-10-25'), -- Emirates
(17, 28, 'SN-BRK-555', 'MLG Brake 1', '2023-11-10'),
(17, 28, 'SN-BRK-556', 'MLG Brake 2', '2023-11-10'),
(17, 28, 'SN-BRK-557', 'MLG Brake 3', '2023-11-10'),
(20, 5, 'SN-APU-222', 'APU Gen', '2023-12-20'), -- Turkish
(1, 13, 'SN-CVR-123', 'CVR Unit', '2023-11-05'),
(2, 14, 'SN-FDR-456', 'FDR Unit', '2023-11-05'),
(4, 30, 'SN-TIRE-99', 'Nose Wheel Assy', '2023-10-20'), -- Southwest
(6, 9, 'SN-ACT-321', 'Seat 1A Motor', '2023-11-30'), -- Spirit
(7, 31, 'SN-WIN-001', 'Windshield L', '2023-11-12'), -- Alaska
(8, 50, 'SN-SMK-001', 'Lav A Smoke', '2023-10-15'),
(9, 50, 'SN-SMK-002', 'Lav B Smoke', '2023-10-15'),
(10, 20, 'SN-SEAL-KIT', 'Hydraulic Block', '2023-11-01'),
(12, 40, 'SN-FSC-100', 'Computer 1', '2023-12-01'), -- BA
(13, 34, 'SN-VHF-200', 'Radio 1', '2023-11-15'),
(14, 35, 'SN-GPS-300', 'GPS 1', '2023-11-15'),
(15, 29, 'SN-TIRE-100', 'Main Wheel 1', '2023-10-22'), -- Ryanair
(15, 29, 'SN-TIRE-101', 'Main Wheel 2', '2023-10-22'),
(16, 29, 'SN-TIRE-102', 'Main Wheel 3', '2023-10-22'),
(21, 6, 'SN-RAD-001', 'Radar R/T', '2023-11-25'),
(22, 11, 'SN-LAV-001', 'Vac Pump', '2023-11-05'),
(23, 41, 'SN-ECU-001', 'EEC Ch A', '2023-12-10'),
(24, 42, 'SN-BAT-001', 'Main Batt', '2023-10-28'),
(25, 49, 'SN-EXT-001', 'Hand Fire Ex', '2023-10-10'),
(26, 12, 'SN-CARGO-1', 'Aft Cargo', '2023-11-01'),
(27, 8, 'SN-TRACK-1', 'Seat Rail', '2023-11-01'),
(28, 19, 'SN-FILT-1', 'Filter Assy', '2023-10-18'),
(29, 21, 'SN-BEAR-1', 'Roller', '2023-10-18'),
(30, 22, 'SN-BEAR-2', 'Ball', '2023-10-18'),
(31, 23, 'SN-CB-1', 'Panel 1 CB', '2023-10-12'),
(32, 24, 'SN-REL-1', 'Relay Box', '2023-10-12'),
(33, 25, 'SN-HARN-1', 'Pylon Harness', '2023-11-20'),
(34, 26, 'SN-WICK-1', 'L Wing Wicks', '2023-10-15'),
(35, 27, 'SN-LENS-1', 'Nav Red', '2023-10-15'),
(36, 15, 'SN-O2-1', 'O2 Gen Row 1', '2023-10-10'),
(37, 16, 'SN-LATCH-1', 'Fan Cowl 1', '2023-10-20'),
(38, 17, 'SN-NOZ-1', 'Nozzle Set', '2023-11-25'),
(39, 18, 'SN-IGN-1', 'Igniter Box', '2023-11-25'),
(40, 32, 'SN-WIP-1', 'Capt Wiper', '2023-10-30'),
(41, 36, 'SN-AOA-1', 'AoA Heat', '2023-11-05'),
(42, 37, 'SN-TQ-1', 'Throttle Assy', '2023-12-15'),
(43, 38, 'SN-YOKE-1', 'Capt Column', '2023-12-15'),
(44, 39, 'SN-RUD-1', 'Pedal Adj', '2023-11-30'),
(45, 43, 'SN-PSU-1', 'Exit PSU', '2023-10-25');

-- 8. CONTRACTS (20 Contracts)
-- Varied labor rates to simulate different business deals
INSERT INTO contract (customer_id, document_link, sla_terms, labor_rate, start_date, end_date) VALUES
(1, 'http://contracts.com/delta-23', '24hr AOG', 150.00, '2023-01-01', '2025-12-31'), -- Delta Premium
(2, 'http://contracts.com/united-23', 'Standard', 120.00, '2023-01-01', '2024-12-31'),
(3, 'http://contracts.com/aa-23', 'Standard', 125.00, '2023-06-01', '2024-06-01'),
(4, 'http://contracts.com/swa-23', 'Bulk Rate', 100.00, '2022-01-01', '2025-01-01'), -- Low cost
(5, 'http://contracts.com/b6-23', 'Standard', 130.00, '2023-01-01', '2023-12-31'),
(11, 'http://contracts.com/lh-23', 'Euro Priority', 160.00, '2023-01-01', '2024-12-31'),
(17, 'http://contracts.com/ek-23', 'Platinum', 200.00, '2023-01-01', '2026-01-01'), -- Emirates High Value
(20, 'http://contracts.com/tk-23', 'Standard', 110.00, '2023-03-01', '2024-03-01'),
(15, 'http://contracts.com/fr-23', 'Economy', 90.00, '2023-01-01', '2023-12-31'), -- Ryanair cheap
(12, 'http://contracts.com/ba-23', 'Standard', 140.00, '2023-01-01', '2025-01-01'),
(6, 'http://contracts.com/nk-23', 'Economy', 95.00, '2023-01-01', '2024-01-01'),
(7, 'http://contracts.com/as-23', 'Standard', 120.00, '2023-02-01', '2024-02-01'),
(8, 'http://contracts.com/ha-23', 'Island Hop', 125.00, '2023-01-01', '2024-01-01'),
(9, 'http://contracts.com/f9-23', 'Economy', 90.00, '2023-04-01', '2024-04-01'),
(10, 'http://contracts.com/g4-23', 'Economy', 90.00, '2023-05-01', '2024-05-01'),
(13, 'http://contracts.com/af-23', 'Euro Std', 135.00, '2023-01-01', '2024-12-31'),
(14, 'http://contracts.com/kl-23', 'Euro Std', 135.00, '2023-01-01', '2024-12-31'),
(16, 'http://contracts.com/u2-23', 'Economy', 95.00, '2023-01-01', '2024-01-01'),
(18, 'http://contracts.com/qr-23', 'Platinum', 190.00, '2023-01-01', '2025-01-01'),
(19, 'http://contracts.com/ey-23', 'Gold', 180.00, '2023-01-01', '2024-12-31');

-- 9. ORDERS (40 Orders)
INSERT INTO orders (customer_part_id, contract_id, status) VALUES
(1, 1, 'in_progress'), -- Delta Fan
(2, 1, 'closed'),      -- Delta Gear
(3, 2, 'hold'),        -- United Pump (Waiting on parts)
(4, 3, 'in_progress'), -- American Transponder
(5, 5, 'open'),        -- JetBlue Oven
(6, 6, 'review'),      -- Lufthansa Fan
(7, 7, 'in_progress'), -- Emirates Altimeter
(8, 7, 'closed'),      -- Emirates Brake 1
(9, 7, 'in_progress'), -- Emirates Brake 2
(10, 7, 'open'),       -- Emirates Brake 3
(11, 8, 'closed'),     -- Turkish APU
(12, 1, 'in_progress'), -- Delta CVR
(13, 2, 'open'),       -- United FDR
(14, 4, 'closed'),     -- SWA Tire
(15, 11, 'hold'),      -- Spirit Seat (Credit hold maybe?)
(16, 12, 'in_progress'),
(17, 13, 'closed'),
(18, 14, 'open'),
(19, 15, 'in_progress'),
(20, 10, 'closed'),
(21, 16, 'open'),
(22, 16, 'open'),
(23, 9, 'in_progress'),
(24, 9, 'closed'),
(25, 9, 'closed'),
(26, 7, 'review'),
(27, 7, 'in_progress'),
(28, 7, 'open'),
(29, 7, 'open'),
(30, 7, 'open'),
(31, 1, 'in_progress'),
(32, 1, 'closed'),
(33, 2, 'in_progress'),
(34, 2, 'closed'),
(35, 3, 'open'),
(36, 4, 'closed'),
(37, 5, 'hold'),
(38, 6, 'in_progress'),
(39, 8, 'closed'),
(40, 10, 'open');

-- 10. ORDER TASKS (Logs & Labor)
-- Linking techs to orders. Some have inventory.
INSERT INTO order_task (order_id, technician_id, inventory_id, status, logs, hours) VALUES
(1, 1, NULL, 'completed', 'Visual inspection of fan blade roots.', 2.0),
(1, 1, NULL, 'in_progress', 'NDT ultrasonic scan performed.', 4.0), -- Tech 1 busy
(2, 5, 20, 'completed', 'Replaced seal kit. Leak check pass.', 6.5), -- Bruce Wayne fixed gear
(3, 2, NULL, 'blocked', 'Disassembled. Waiting on replacement shaft.', 3.0), -- United pump stuck
(4, 7, NULL, 'in_progress', 'Bench test failed. Troubleshooting circuit.', 5.0), -- Tony Stark on avionics
(7, 7, 4, 'completed', 'Replaced internal diaphragm.', 2.0),
(8, 5, 28, 'completed', 'Replaced carbon stack.', 8.0),
(9, 5, 28, 'in_progress', 'Disassembled brake unit.', 3.0),
(11, 2, NULL, 'completed', 'Generator brush replacement.', 4.0),
(12, 7, NULL, 'in_progress', 'Download data check.', 1.0),
(14, 1, 30, 'completed', 'Tire change.', 1.5),
(15, 3, 9, 'blocked', 'Actuator seized. Need lubricant.', 2.0),
(16, 5, 31, 'in_progress', 'Sealant curing.', 5.0),
(17, 5, NULL, 'completed', 'Test', 1.0),
(19, 2, 20, 'in_progress', 'Installing seals', 2.5),
(23, 1, 29, 'completed', 'Wheel build up', 3.0),
(24, 1, 29, 'completed', 'Wheel build up', 3.0),
(25, 1, 29, 'completed', 'Wheel build up', 3.0),
(26, 7, 6, 'completed', 'Radar mapping', 6.0),
(31, 23, NULL, 'in_progress', 'Cleaning', 2.0), -- Rey cleaning
(32, 23, NULL, 'completed', 'Cleaning', 1.0),
(36, 18, 29, 'completed', 'Tire change', 1.5), -- Han Solo tire change
(2, 1, NULL, 'completed', 'Final sign off', 0.5),
(8, 1, NULL, 'completed', 'Final sign off', 0.5),
(11, 1, NULL, 'completed', 'Final sign off', 0.5),
(14, 1, NULL, 'completed', 'Final sign off', 0.5),
(17, 1, NULL, 'completed', 'Final sign off', 0.5),
(24, 1, NULL, 'completed', 'Final sign off', 0.5),
(25, 1, NULL, 'completed', 'Final sign off', 0.5),
(36, 1, NULL, 'completed', 'Final sign off', 0.5);

-- 11. TASK TOOLS (Tool Usage)
INSERT INTO task_tools (order_task_id, tool_id) VALUES
(1, 3), -- Borescope for fan inspection
(2, 3),
(3, 1), -- Torque wrench for gear
(3, 4), -- Hydraulic mule
(5, 2), -- Multimeter for avionics
(6, 9), -- Pitot tester
(7, 4), -- Jack stands
(7, 1),
(11, 1), -- Tire change needs torque
(11, 10), -- Jack stands
(16, 1),
(16, 10),
(17, 1),
(17, 10),
(18, 1),
(18, 10),
(22, 1),
(22, 10),
(29, 2);

-- 12. INVOICES
-- Generate invoices for closed orders
INSERT INTO invoice (order_id, amount) VALUES
(2, 1500.00), -- Delta Gear (Labor + Parts Markup approx)
(8, 3000.00), -- Emirates Brake
(11, 600.00), -- Turkish APU
(14, 400.00), -- SWA Tire
(17, 200.00),
(20, 300.00),
(24, 500.00),
(25, 500.00),
(32, 100.00),
(34, 400.00),
(36, 250.00),
(39, 300.00);