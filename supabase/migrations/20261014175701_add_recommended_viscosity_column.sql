/*
# Add recommended oil viscosity/weight to vehicles

Adds a `recommended_viscosity` column (e.g. "5W-30", "0W-20") and populates it
based on manufacturer specs for each vehicle.
*/

ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS recommended_viscosity text;

-- === DIESEL ENGINES: 5W-40 (Rotella T-6) or 15W-40 ===
UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE engine_type = 'diesel' AND (recommended_viscosity IS NULL OR recommended_viscosity = '');

UPDATE vehicles SET recommended_viscosity = '15W-40'
WHERE engine_type = 'diesel' AND engine_specs ILIKE '%15W%' AND (recommended_viscosity IS NULL OR recommended_viscosity = '');

-- === FORD ===
-- Ford EcoBoost and most modern Ford: 5W-30 for trucks, 5W-20 for cars
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Ford' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND (model IN ('F-150','F-250 Super Duty','Expedition','Explorer','Ranger','Bronco') OR engine_specs ILIKE '%EcoBoost%');

UPDATE vehicles SET recommended_viscosity = '5W-20'
WHERE make = 'Ford' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- Older Ford with 5.4L V8
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Ford' AND engine_specs ILIKE '%5.4L%' AND recommended_viscosity IS NULL;

-- === CHEVROLET / GMC ===
-- GM trucks and SUVs: 5W-30 for most, 0W-20 for newer
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make IN ('Chevrolet','GMC') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND (body_type IN ('Truck','SUV') OR engine_liters >= 4.3);

-- GM cars: 5W-30 for older, 0W-20 for newer
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make IN ('Chevrolet','GMC') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start < 2018;

UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make IN ('Chevrolet','GMC') AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- Corvette / Camaro SS / ZL1
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Chevrolet' AND model IN ('Camaro','Corvette') AND engine_liters >= 5.7 AND recommended_viscosity IS NULL;

-- === DODGE / RAM / JEEP ===
-- HEMI V8: 5W-20
UPDATE vehicles SET recommended_viscosity = '5W-20'
WHERE make IN ('Dodge','RAM','Jeep') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND (engine_specs ILIKE '%HEMI%' OR engine_specs ILIKE '%5.7%' OR engine_specs ILIKE '%6.4%');

-- Pentastar V6: 5W-20
UPDATE vehicles SET recommended_viscosity = '5W-20'
WHERE make IN ('Dodge','RAM','Jeep') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND engine_specs ILIKE '%3.6%';

-- Jeep 4.0L I6: 10W-30
UPDATE vehicles SET recommended_viscosity = '10W-30'
WHERE make = 'Jeep' AND engine_specs ILIKE '%4.0L%' AND year_start < 2007 AND recommended_viscosity IS NULL;

-- Jeep Wrangler 2.0L Turbo: 0W-20
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Jeep' AND engine_specs ILIKE '%2.0L%' AND year_start >= 2018 AND recommended_viscosity IS NULL;

-- Dodge/Jeep remaining
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make IN ('Dodge','RAM','Jeep') AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === HONDA ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Honda' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2011;

UPDATE vehicles SET recommended_viscosity = '5W-20'
WHERE make = 'Honda' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2003;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Honda' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- Honda hybrid
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Honda' AND engine_type = 'hybrid' AND recommended_viscosity IS NULL;

-- === TOYOTA ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Toyota' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2010;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Toyota' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2000;

UPDATE vehicles SET recommended_viscosity = '10W-30'
WHERE make = 'Toyota' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Toyota' AND engine_type = 'hybrid' AND recommended_viscosity IS NULL;

-- === NISSAN ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Nissan' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2013;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Nissan' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === SUBARU ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Subaru' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2010;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Subaru' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- Subaru WRX STI 2.5L Turbo: 5W-30
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Subaru' AND (model = 'WRX' OR engine_specs ILIKE '%Turbo%') AND recommended_viscosity IS NULL;

-- === MAZDA ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Mazda' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2018;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Mazda' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === HYUNDAI / KIA ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make IN ('Hyundai','Kia') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2020;

UPDATE vehicles SET recommended_viscosity = '5W-20'
WHERE make IN ('Hyundai','Kia') AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2015;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make IN ('Hyundai','Kia') AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === AUDI ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Audi' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2020;

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE make = 'Audi' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2012;

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE make = 'Audi' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === BMW ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'BMW' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2019;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'BMW' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2012;

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE make = 'BMW' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'BMW' AND engine_type = 'hybrid' AND recommended_viscosity IS NULL;

-- === MERCEDES-BENZ ===
UPDATE vehicles SET recommended_viscosity = '0W-40'
WHERE make = 'Mercedes-Benz' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND (engine_specs ILIKE '%AMG%' OR engine_specs ILIKE '%V8%');

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE make = 'Mercedes-Benz' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === LEXUS ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Lexus' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2013;

UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'Lexus' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Lexus' AND engine_type = 'hybrid' AND recommended_viscosity IS NULL;

-- === VOLKSWAGEN ===
UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE make = 'Volkswagen' AND engine_type = 'gas' AND recommended_viscosity IS NULL
  AND year_start >= 2019;

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE make = 'Volkswagen' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === TESLA ===
UPDATE vehicles SET recommended_viscosity = 'N/A'
WHERE make = 'Tesla' AND recommended_viscosity IS NULL;

-- === MINI ===
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE make = 'MINI' AND engine_type = 'gas' AND recommended_viscosity IS NULL;

-- === CATCH-ALL: 5W-30 for any remaining gas, 5W-40 diesel ===
UPDATE vehicles SET recommended_viscosity = '5W-30'
WHERE engine_type = 'gas' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = '5W-40'
WHERE engine_type = 'diesel' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = '0W-20'
WHERE engine_type = 'hybrid' AND recommended_viscosity IS NULL;

UPDATE vehicles SET recommended_viscosity = 'N/A'
WHERE engine_type = 'electric' AND recommended_viscosity IS NULL;
