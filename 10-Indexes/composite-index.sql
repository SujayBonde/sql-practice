-- Composite multi-column index and leftmost prefix ordering
-- Target: ANSI SQL

DROP TABLE IF EXISTS vehicle_registry;

CREATE TABLE vehicle_registry (
    vin VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    model_year INT,
    state_code VARCHAR(2)
);

INSERT INTO vehicle_registry VALUES
('1HGCR2F83HA000001', 'Honda',  'Accord', 2017, 'CA'),
('1HGCR2F83HA000002', 'Honda',  'Civic',  2019, 'CA'),
('1HGCR2F83HA000003', 'Toyota', 'Camry',  2020, 'NY'),
('1HGCR2F83HA000004', 'Ford',   'F-150',  2018, 'TX');

-- Composite index: (make, model, model_year)
CREATE INDEX idx_vehicle_make_model_year 
ON vehicle_registry(make, model, model_year);

-- Index used: prefix match (make, model)
SELECT * FROM vehicle_registry WHERE make = 'Honda' AND model = 'Civic';

-- Index used: leading column match (make)
SELECT * FROM vehicle_registry WHERE make = 'Honda';
