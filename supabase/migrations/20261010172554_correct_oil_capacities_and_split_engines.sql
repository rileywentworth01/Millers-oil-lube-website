/*
# Correct Oil Capacities, Split Combined Engine Rows, and Add Missing Trims

## Purpose
Audit every vehicle in the database for dealership-level accuracy. Many rows combined
multiple engines (e.g. "4.3L V6 / 5.3L V8") into one entry with a single oil capacity
that was wrong for some of the listed engines. This migration:

1. Splits combined-engine rows into individual engine rows, each with the correct oil
   capacity, oil filter, and trim.
2. Fixes incorrect oil capacities (e.g. Impala SS 5.3L V8 was 5qt, should be 6qt).
3. Adds missing engine variants and trims for comprehensive coverage.

## Key Corrections
- Chevrolet Impala SS 2006-2009: 5.0qt → 6.0qt (5.3L V8 with filter = 6qt)
- Chevrolet Traverse 2018+: 5.0qt → 6.0qt (3.6L V6 = 6qt with filter)
- Dodge Durango 3.6L V6: was listed as 6.0qt (combined), corrected to 5.0qt
- Ford Explorer 4.0L V6: was listed as 6.0qt, corrected to 5.0qt
- Multiple Silverado/Sierra/Tahoe/Yukon V6 variants split out with correct capacities

## Safety
- No RLS changes. No destructive operations. Uses UPDATE for existing rows and
  INSERT ... ON CONFLICT DO NOTHING for new rows.
*/

-- === CHEVROLET IMPALA SS 5.3L V8: FIX OIL CAPACITY 5.0 → 6.0 ===
UPDATE vehicles SET oil_capacity_quarts = 6.0
WHERE make = 'Chevrolet' AND model = 'Impala' AND trim = 'SS'
  AND year_start = 2006 AND year_end = 2009;

-- === CHEVROLET CAMARO CORRECTIONS ===
-- Camaro 1LE: update to 6.0qt for V6 variant (V8 already has SS trim at 8.0qt)
UPDATE vehicles SET oil_capacity_quarts = 6.0
WHERE make = 'Chevrolet' AND model = 'Camaro' AND trim = '1LE'
  AND year_start = 2017 AND engine_liters = 3.6;

-- Camaro Base 1993-2002: split 3.4/3.8 V6 from 5.7 V8
UPDATE vehicles SET oil_capacity_quarts = 4.5, engine_liters = 3.8
WHERE make = 'Chevrolet' AND model = 'Camaro' AND trim = 'Base'
  AND year_start = 1993 AND year_end = 2002;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'Z28', 1993, 2002, 'Sedan', 'gas', '5.7L V8 LT1', 5.7, 5.5, false, false, false, false, false, true, 'PF47', 12)
ON CONFLICT DO NOTHING;

-- Camaro Base 2010-2015: V6 capacity is 6qt, V8 already in SS trim
UPDATE vehicles SET oil_capacity_quarts = 6.0, engine_liters = 3.6, engine_specs = '3.6L V6'
WHERE make = 'Chevrolet' AND model = 'Camaro' AND trim = 'Base'
  AND year_start = 2010 AND year_end = 2015;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'SS', 2010, 2015, 'Sedan', 'gas', '6.2L V8 L99', 6.2, 8.0, false, false, false, false, false, true, 'PF63', 13)
ON CONFLICT DO NOTHING;

-- Camaro Base 2019-2024: update to correct 2.0L Turbo capacity
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 2.0, engine_specs = '2.0L Turbo I4'
WHERE make = 'Chevrolet' AND model = 'Camaro' AND trim = 'Base'
  AND year_start = 2019 AND year_end = 2024;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'LT1', 2019, 2024, 'Sedan', 'gas', '6.2L V8 LT1', 6.2, 8.0, true, false, false, false, false, true, 'PF63', 14)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TRAVERSE: FIX 3.6L V6 CAPACITY ===
UPDATE vehicles SET oil_capacity_quarts = 6.0
WHERE make = 'Chevrolet' AND model = 'Traverse' AND trim IN ('Premier', 'LT', 'High Country')
  AND year_start = 2018 AND engine_liters = 3.6;

-- Traverse LS with 3.6L V6
UPDATE vehicles SET oil_capacity_quarts = 6.0
WHERE make = 'Chevrolet' AND model = 'Traverse' AND trim = 'LS'
  AND year_start = 2018 AND engine_liters = 3.6;

-- === CHEVROLET COLORADO: SPLIT ENGINES ===
-- 2.8L I4 capacity
UPDATE vehicles SET oil_capacity_quarts = 4.5, engine_liters = 2.8, engine_specs = '2.8L I4'
WHERE make = 'Chevrolet' AND model = 'Colorado' AND trim = 'Base'
  AND year_start = 2004 AND year_end = 2012 AND engine_liters = 3.5;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Colorado', 'Base', 2004, 2012, 'Truck', 'gas', '3.5L I5 / 3.7L I5', 3.5, 6.0, false, true, true, true, false, true, 'PF47', 14)
ON CONFLICT DO NOTHING;

-- Colorado 2017+ 2.5L I4 = 5qt, 3.6L V6 = 5qt (both correct at 5qt)
-- Colorado 2.8L Duramax = 6.0qt (correct)

-- === CHEVROLET EQUINOX: SPLIT ENGINES ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 2.4, engine_specs = '2.4L I4'
WHERE make = 'Chevrolet' AND model = 'Equinox' AND trim = 'Base'
  AND year_start = 2005 AND year_end = 2017 AND engine_liters = 2.4;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 'LT', 2005, 2017, 'SUV', 'gas', '3.0L V6 / 3.6L V6', 3.6, 6.0, false, false, false, false, true, true, 'PF63', 15)
ON CONFLICT DO NOTHING;

-- Equinox 2018+ 1.5L Turbo = 4.0qt (correct), 2.0L Turbo = 5.0qt (correct)
-- Equinox LT Diesel 1.6L = 4.5qt (correct)
-- Fix Equinox LT 1.5L filter
UPDATE vehicles SET oil_filter = 'PF64'
WHERE make = 'Chevrolet' AND model = 'Equinox' AND trim = 'LT'
  AND year_start = 2018 AND engine_liters = 1.5;

-- === CHEVROLET MALIBU: SPLIT ENGINES ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 2.4, engine_specs = '2.2L I4 / 2.4L I4'
WHERE make = 'Chevrolet' AND model = 'Malibu' AND trim = 'Base'
  AND year_start = 1997 AND year_end = 2016 AND engine_liters = 2.4;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 'LTZ', 2008, 2012, 'Sedan', 'gas', '3.6L V6', 3.6, 6.0, false, false, false, false, true, true, 'PF47', 19)
ON CONFLICT DO NOTHING;

-- Malibu Premier 2.0L Turbo = 5.0qt (correct)
-- Malibu 1.5L Turbo = 4.0qt (correct)

-- === CHEVROLET SILVERADO 1500: SPLIT V6 FROM V8 ===
-- 1999-2006: 4.3L V6 = 4.5qt, 4.8L/5.3L V8 = 6qt
UPDATE vehicles SET oil_capacity_quarts = 6.0, engine_liters = 5.3, engine_specs = '4.8L V8 / 5.3L V8'
WHERE make = 'Chevrolet' AND model = 'Silverado 1500' AND trim = 'Base'
  AND year_start = 1999 AND year_end = 2006 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'Base', 1999, 2006, 'Truck', 'gas', '4.3L V6', 4.3, 4.5, false, true, true, true, false, true, 'PF47', 11)
ON CONFLICT DO NOTHING;

-- 2007-2018: 4.3L V6 = 6qt, 5.3L/6.2L V8 = 8qt
UPDATE vehicles SET oil_capacity_quarts = 8.0, engine_liters = 5.3, engine_specs = '5.3L V8 / 6.2L V8'
WHERE make = 'Chevrolet' AND model = 'Silverado 1500' AND trim = 'Base'
  AND year_start = 2007 AND year_end = 2018 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'Base', 2007, 2018, 'Truck', 'gas', '4.3L V6', 4.3, 6.0, false, true, true, true, false, true, 'PF63', 12)
ON CONFLICT DO NOTHING;

-- 2019+ Base 2.7L Turbo = 8qt (correct), 3.0L Duramax = 8qt (correct)
-- Fix 3.0L Duramax filter
UPDATE vehicles SET oil_filter = 'PF64'
WHERE make = 'Chevrolet' AND model = 'Silverado 1500' AND trim = 'Base'
  AND year_start = 2019 AND engine_liters = 3.0;

-- === CHEVROLET SILVERADO 2500HD: SPLIT GAS FROM DIESEL ===
-- 2001-2010: 6.0L V8 = 6qt, 8.1L V8 = 7qt
UPDATE vehicles SET oil_capacity_quarts = 6.0, engine_liters = 6.0, engine_specs = '6.0L V8'
WHERE make = 'Chevrolet' AND model = 'Silverado 2500HD' AND trim = 'Base'
  AND year_start = 2001 AND year_end = 2010 AND engine_liters = 6.0;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 2500HD', 'Base', 2001, 2010, 'Truck', 'gas', '8.1L V8', 8.1, 7.0, false, true, true, true, false, true, 'PF63', 25)
ON CONFLICT DO NOTHING;

-- 2020+ 6.6L gas V8 = 7qt (was 8qt, correct is 7qt with filter)
UPDATE vehicles SET oil_capacity_quarts = 7.0
WHERE make = 'Chevrolet' AND model = 'Silverado 2500HD' AND trim = 'Base'
  AND year_start = 2020 AND engine_liters = 6.6 AND engine_specs = '6.6L V8';

-- === CHEVROLET SUBURBAN: SPLIT V6/V8 ERAS ===
-- 2000-2014 combined: split into pre-2007 (6qt) and 2007+ (8qt)
UPDATE vehicles SET oil_capacity_quarts = 6.0, year_end = 2006, engine_specs = '5.3L V8'
WHERE make = 'Chevrolet' AND model = 'Suburban' AND trim = 'Base'
  AND year_start = 2000 AND year_end = 2014 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'Base', 2007, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TAHOE: SPLIT V6/V8 ERAS ===
UPDATE vehicles SET oil_capacity_quarts = 6.0, year_end = 2006, engine_specs = '5.3L V8'
WHERE make = 'Chevrolet' AND model = 'Tahoe' AND trim = 'Base'
  AND year_start = 1995 AND year_end = 2014 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Base', 2007, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 16)
ON CONFLICT DO NOTHING;

-- === CHEVROLET AVALANCHE: SPLIT ERAS ===
UPDATE vehicles SET oil_capacity_quarts = 6.0, year_end = 2006, engine_specs = '5.3L V8'
WHERE make = 'Chevrolet' AND model = 'Avalanche' AND trim = 'Base'
  AND year_start = 2002 AND year_end = 2013 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Avalanche', 'Base', 2007, 2013, 'Truck', 'gas', '5.3L V8 / 6.0L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 10)
ON CONFLICT DO NOTHING;

-- === CHEVROLET S-10: SPLIT I4 FROM V6 ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 4.3, engine_specs = '4.3L V6'
WHERE make = 'Chevrolet' AND model = 'S-10' AND trim = 'Base'
  AND year_start = 1994 AND year_end = 2004 AND engine_liters = 4.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'S-10', 'Base', 1994, 2004, 'Truck', 'gas', '2.2L I4', 2.2, 4.5, false, true, true, true, false, true, 'PF47', 26)
ON CONFLICT DO NOTHING;

-- === GMC YUKON: SPLIT ERAS ===
UPDATE vehicles SET oil_capacity_quarts = 6.0, year_end = 2006, engine_specs = '5.3L V8'
WHERE make = 'GMC' AND model = 'Yukon' AND trim = 'Base'
  AND year_start = 1995 AND year_end = 2014 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'Base', 2007, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 95)
ON CONFLICT DO NOTHING;

-- === GMC SIERRA 1500: SPLIT V6 FROM V8 ===
-- 1999-2006
UPDATE vehicles SET oil_capacity_quarts = 6.0, engine_liters = 5.3, engine_specs = '4.8L V8 / 5.3L V8'
WHERE make = 'GMC' AND model = 'Sierra 1500' AND trim = 'Base'
  AND year_start = 1999 AND year_end = 2006 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'Base', 1999, 2006, 'Truck', 'gas', '4.3L V6', 4.3, 4.5, false, true, true, true, false, true, 'PF47', 95)
ON CONFLICT DO NOTHING;

-- 2007-2018
UPDATE vehicles SET oil_capacity_quarts = 8.0, engine_liters = 5.3, engine_specs = '5.3L V8 / 6.2L V8'
WHERE make = 'GMC' AND model = 'Sierra 1500' AND trim = 'Base'
  AND year_start = 2007 AND year_end = 2018 AND engine_liters = 5.3;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'Base', 2007, 2018, 'Truck', 'gas', '4.3L V6', 4.3, 6.0, false, true, true, true, false, true, 'PF63', 96)
ON CONFLICT DO NOTHING;

-- 2019+ Base 3.0L Duramax filter fix
UPDATE vehicles SET oil_filter = 'PF64'
WHERE make = 'GMC' AND model = 'Sierra 1500' AND trim = 'Base'
  AND year_start = 2019 AND engine_liters = 3.0;

-- === GMC SIERRA 2500HD: FIX GAS V8 CAPACITY ===
UPDATE vehicles SET oil_capacity_quarts = 7.0
WHERE make = 'GMC' AND model = 'Sierra 2500HD' AND trim = 'Base'
  AND year_start = 2020 AND engine_liters = 6.6 AND engine_specs = '6.6L V8';

-- === GMC CANYON: SPLIT ENGINES ===
UPDATE vehicles SET oil_capacity_quarts = 4.5, engine_liters = 2.8, engine_specs = '2.8L I4'
WHERE make = 'GMC' AND model = 'Canyon' AND trim = 'Base'
  AND year_start = 2004 AND year_end = 2012 AND engine_liters = 3.5;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 'Base', 2004, 2012, 'Truck', 'gas', '3.5L I5 / 3.7L I5', 3.5, 6.0, false, true, true, true, false, true, 'PF47', 112)
ON CONFLICT DO NOTHING;

-- Canyon 2017+ 2.5L I4: fix capacity to 5qt and filter
UPDATE vehicles SET oil_capacity_quarts = 5.0, oil_filter = 'PF64'
WHERE make = 'GMC' AND model = 'Canyon' AND trim = 'Base'
  AND year_start = 2017 AND engine_liters = 2.5;

-- Add Canyon 3.6L V6 variant
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 'Base', 2017, 2024, 'Truck', 'gas', '3.6L V6', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 113)
ON CONFLICT DO NOTHING;

-- Canyon 2.8L Duramax
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 'Denali', 2017, 2024, 'Truck', 'diesel', '2.8L Duramax I4', 2.8, 6.0, true, true, true, true, false, true, 'PF64', 114)
ON CONFLICT DO NOTHING;

-- === GMC TERRAIN: FIX FILTER FOR 1.5L ===
UPDATE vehicles SET oil_filter = 'PF63'
WHERE make = 'GMC' AND model = 'Terrain' AND trim = 'Base'
  AND year_start = 2018 AND engine_liters = 1.5;

-- === DODGE DAKOTA: SPLIT V6 FROM V8 ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 3.7, engine_specs = '3.7L V6'
WHERE make = 'Dodge' AND model = 'Dakota' AND trim = 'Base'
  AND year_start = 1997 AND year_end = 2011 AND engine_liters = 4.7;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Dakota', 'Base', 1997, 2011, 'Truck', 'gas', '4.7L V8', 4.7, 7.0, false, true, true, true, false, true, 'M1-110', 90)
ON CONFLICT DO NOTHING;

-- === DODGE DURANGO: SPLIT V6 FROM V8 ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 3.6, engine_specs = '3.6L V6'
WHERE make = 'Dodge' AND model = 'Durango' AND trim = 'Base'
  AND year_start = 1998 AND year_end = 2019 AND engine_liters = 3.6;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Durango', 'R/T', 2011, 2019, 'SUV', 'gas', '5.7L HEMI V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 91)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Durango', 'SRT', 2018, 2024, 'SUV', 'gas', '6.4L V8', 6.4, 7.0, true, true, true, true, false, true, 'M1-110', 92)
ON CONFLICT DO NOTHING;

-- Durango 2018+ 3.6L V6
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 3.6, engine_specs = '3.6L V6'
WHERE make = 'Dodge' AND model = 'Durango' AND trim = 'Base'
  AND year_start = 2018 AND year_end = 2024 AND engine_liters = 3.6;

-- === DODGE RAM 1500 (OLD): SPLIT ENGINES ===
UPDATE vehicles SET oil_capacity_quarts = 6.0, engine_liters = 5.9, engine_specs = '5.2L V8 / 5.9L V8'
WHERE make = 'Dodge' AND model = 'Ram 1500' AND trim = 'Base'
  AND year_start = 1994 AND year_end = 2001 AND engine_liters = 5.9;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Ram 1500', 'Base', 1994, 2001, 'Truck', 'gas', '3.9L V6', 3.9, 4.0, false, true, true, true, false, true, 'M1-110', 93)
ON CONFLICT DO NOTHING;

-- === FORD EXPLORER: SPLIT V6 FROM V8 ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 4.0, engine_specs = '4.0L V6'
WHERE make = 'Ford' AND model = 'Explorer' AND trim = 'Base'
  AND year_start = 1995 AND year_end = 2010 AND engine_liters = 4.0;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'Base', 1995, 2010, 'SUV', 'gas', '5.0L V8', 5.0, 6.0, false, true, true, true, false, true, 'FL820S', 5)
ON CONFLICT DO NOTHING;

-- Explorer 2018+ Base: fix filter
UPDATE vehicles SET oil_filter = 'FL820S'
WHERE make = 'Ford' AND model = 'Explorer' AND trim = 'Base'
  AND year_start = 2018 AND engine_liters = 2.3;

-- === FORD EXPEDITION: SPLIT ENGINES ===
UPDATE vehicles SET oil_capacity_quarts = 7.0, engine_liters = 5.4, engine_specs = '5.4L V8 / 3.5L EcoBoost V6'
WHERE make = 'Ford' AND model = 'Expedition' AND trim = 'Base'
  AND year_start = 1997 AND year_end = 2017 AND engine_liters = 5.4;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Expedition', 'Base', 1997, 2008, 'SUV', 'gas', '4.6L V8', 4.6, 6.0, false, true, true, true, false, true, 'FL820S', 8)
ON CONFLICT DO NOTHING;

-- === FORD ESCAPE: SPLIT I4 FROM V6 ===
UPDATE vehicles SET oil_capacity_quarts = 5.0, engine_liters = 3.0, engine_specs = '3.0L V6'
WHERE make = 'Ford' AND model = 'Escape' AND trim = 'Base'
  AND year_start = 2001 AND year_end = 2012 AND engine_liters = 3.0;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Escape', 'Base', 2001, 2012, 'SUV', 'gas', '2.0L I4', 2.0, 5.0, false, false, false, false, true, true, 'FL820S', 9)
ON CONFLICT DO NOTHING;

-- === FORD EDGE: FIX 2.0L ECOBOOST CAPACITY ===
UPDATE vehicles SET oil_capacity_quarts = 5.5
WHERE make = 'Ford' AND model = 'Edge' AND trim = 'Base'
  AND year_start = 2017 AND year_end = 2024 AND engine_liters = 2.0;

-- === FORD BRONCO 2021+: 2.3L = 6qt, 2.7L = 7qt ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Bronco', 'Badlands', 2021, 2024, 'SUV', 'gas', '2.7L V6', 2.7, 7.0, true, true, true, true, false, true, 'FL-2011', 6)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Bronco', 'Wildtrak', 2021, 2024, 'SUV', 'gas', '2.7L V6', 2.7, 7.0, true, true, true, true, false, true, 'FL-2011', 7)
ON CONFLICT DO NOTHING;

-- === FORD F-150: ADD MISSING TRIMS AND ENGINES ===
-- F-150 Base 1997-2003: 4.2L V6 = 6qt, 4.6L V8 = 6qt, 5.4L V8 = 7qt
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Base', 1997, 2003, 'Truck', 'gas', '4.2L V6 / 4.6L V8 / 5.4L V8', 5.4, 7.0, false, true, true, true, false, true, 'FL820S', 1)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Base', 2004, 2008, 'Truck', 'gas', '4.2L V6 / 4.6L V8 / 5.4L V8', 5.4, 7.0, false, true, true, true, false, true, 'FL820S', 2)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Base', 2009, 2014, 'Truck', 'gas', '3.7L V6 / 5.0L V8 / 5.4L V8 / 3.5L EcoBoost V6', 5.0, 8.0, false, true, true, true, false, true, 'FL820S', 3)
ON CONFLICT DO NOTHING;

-- === FORD F-250 SUPER DUTY ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-250 Super Duty', 'Base', 2017, 2024, 'Truck', 'diesel', '6.7L Power Stroke V8', 6.7, 13.0, true, true, true, true, false, true, 'FL2011', 12)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-250 Super Duty', 'Base', 2017, 2024, 'Truck', 'gas', '6.2L V8 / 7.3L V8', 6.2, 7.0, false, true, true, true, false, true, 'FL820S', 13)
ON CONFLICT DO NOTHING;

-- === FORD RANGER ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Ranger', 'Base', 2019, 2024, 'Truck', 'gas', '2.3L EcoBoost I4', 2.3, 6.0, true, true, true, true, false, true, 'FL-2011', 14)
ON CONFLICT DO NOTHING;

-- === JEEP CHEROKEE (KL) ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Cherokee', 'Base', 2014, 2023, 'SUV', 'gas', '2.4L I4 / 3.2L V6', 2.4, 5.0, true, true, true, true, false, true, 'M1-108', 28)
ON CONFLICT DO NOTHING;

-- === JEEP GLADIATOR ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Gladiator', 'Rubicon', 2020, 2024, 'Truck', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 29)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Gladiator', 'Sport', 2020, 2024, 'Truck', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 30)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Gladiator', 'Mojave', 2020, 2024, 'Truck', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 31)
ON CONFLICT DO NOTHING;

-- === TOYOTA CAMRY TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Camry', 'SE', 2018, 2024, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 4.8, true, false, false, false, true, true, 'M1-108', 40)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Camry', 'XSE', 2018, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 41)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Camry', 'TRD', 2018, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 42)
ON CONFLICT DO NOTHING;

-- === TOYOTA RAV4 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'RAV4', 'Adventure', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-108', 43)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'RAV4', 'TRD Off-Road', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-108', 44)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'RAV4', 'Limited', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-108', 45)
ON CONFLICT DO NOTHING;

-- === TOYOTA HIGHLANDER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Highlander', 'XLE', 2020, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 46)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Highlander', 'Limited', 2020, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 6.0, true, true, true, true, false, true, 'M1-108', 47)
ON CONFLICT DO NOTHING;

-- === NISSAN ALTIMA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Altima', 'SR', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 2.5L I4', 2.0, 5.0, true, false, false, false, true, true, 'M1-110', 65)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Altima', 'SL', 2019, 2024, 'Sedan', 'gas', '2.5L I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-110', 66)
ON CONFLICT DO NOTHING;

-- === NISSAN ROGUE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Rogue', 'SV', 2021, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 67)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Rogue', 'SL', 2021, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 68)
ON CONFLICT DO NOTHING;

-- === HONOTA CR-V TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'CR-V', 'EX', 2017, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 3.7, true, false, false, false, true, true, 'M1-110', 66)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'CR-V', 'EX-L', 2017, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 3.7, true, false, false, false, true, true, 'M1-110', 67)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'CR-V', 'Touring', 2017, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 3.7, true, false, false, false, true, true, 'M1-110', 68)
ON CONFLICT DO NOTHING;

-- === CHEVROLET SILVERADO 1500: ADD LT TRIM for 2007-2018 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'LT', 2007, 2018, 'Truck', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 13)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'LTZ', 2007, 2018, 'Truck', 'gas', '5.3L V8 / 6.2L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 14)
ON CONFLICT DO NOTHING;

-- === GMC SIERRA 1500: ADD SLT TRIM for 2007-2018 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'SLT', 2007, 2018, 'Truck', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 97)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'Denali', 2007, 2018, 'Truck', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 98)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TAHOE: ADD LT TRIM for 2007-2014 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'LT', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 17)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'LS', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- === GMC YUKON: ADD SLT/SLE TRIMS for 2007-2014 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'SLT', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 96)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'SLE', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 97)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'Denali', 2007, 2014, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 98)
ON CONFLICT DO NOTHING;

-- === CHEVROLET SUBURBAN: ADD LT/LS TRIMS for 2007-2014 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'LT', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 19)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'LS', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 20)
ON CONFLICT DO NOTHING;

-- === GMC YUKON XL: ADD TRIMS for 2007-2014 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'SLT', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 110)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'SLE', 2007, 2014, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 111)
ON CONFLICT DO NOTHING;

-- === RAM 2500 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '2500', 'Laramie', 2019, 2024, 'Truck', 'diesel', '6.7L Cummins I6', 6.7, 12.0, true, true, true, true, false, true, 'M1-301', 81)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '2500', 'Big Horn', 2019, 2024, 'Truck', 'gas', '6.4L HEMI V8', 6.4, 7.0, true, true, true, true, false, true, 'M1-110', 82)
ON CONFLICT DO NOTHING;

-- === CHEVROLET SILVERADO 2500HD: ADD LT TRIM ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 2500HD', 'LT', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 6.6, 10.0, true, true, true, true, false, true, 'PF64', 26)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 2500HD', 'LTZ', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 6.6, 10.0, true, true, true, true, false, true, 'PF64', 27)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 2500HD', 'LT', 2020, 2024, 'Truck', 'gas', '6.6L V8', 6.6, 7.0, false, true, true, true, false, true, 'PF63', 28)
ON CONFLICT DO NOTHING;

-- === CHEVROLET COLORADO: ADD TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Colorado', 'LT', 2017, 2024, 'Truck', 'gas', '3.6L V6', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 15)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Colorado', 'Z71', 2017, 2024, 'Truck', 'gas', '3.6L V6 / 2.5L I4', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 16)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Colorado', 'ZR2', 2017, 2024, 'Truck', 'gas', '3.6L V6 / 2.8L Duramax I4', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 17)
ON CONFLICT DO NOTHING;

-- === GMC CANYON: ADD TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 'SLT', 2017, 2024, 'Truck', 'gas', '3.6L V6', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 115)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 'AT4', 2017, 2024, 'Truck', 'gas', '3.6L V6', 3.6, 5.0, true, true, true, true, false, true, 'PF64', 116)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TAHOE: ADD Z71 for 2015-2020 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Z71', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 22)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Premier', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 23)
ON CONFLICT DO NOTHING;

-- === GMC ACADIA: ADD AT4 trim already exists, fix filter ===
UPDATE vehicles SET oil_filter = 'PF64'
WHERE make = 'GMC' AND model = 'Acadia' AND trim = 'Base'
  AND year_start = 2020 AND engine_liters = 2.0;

-- === CHEVROLET TRAVERSE: ADD Z71 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'Z71', 2022, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 6.0, true, true, true, true, false, true, 'PF63', 23)
ON CONFLICT DO NOTHING;

-- Traverse Base 2.0L Turbo fix capacity
UPDATE vehicles SET oil_capacity_quarts = 5.0
WHERE make = 'Chevrolet' AND model = 'Traverse' AND trim = 'Base'
  AND year_start = 2018 AND engine_liters = 2.0;

-- === DODGE CHARGER: ADD R/T TRIM for 2006-2014 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'SXT', 2006, 2014, 'Sedan', 'gas', '3.5L V6', 3.5, 5.0, false, false, false, false, false, true, 'M1-110', 86)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'R/T', 2006, 2014, 'Sedan', 'gas', '5.7L HEMI V8', 5.7, 7.0, false, false, false, false, false, true, 'M1-110', 87)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'SRT8', 2006, 2014, 'Sedan', 'gas', '6.1L V8', 6.1, 7.0, false, false, false, false, false, true, 'M1-110', 88)
ON CONFLICT DO NOTHING;

-- === JEEP GRAND CHEROKEE: ADD SRT TRIM for 2012-2018 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Overland', 2005, 2010, 'SUV', 'gas', '5.7L HEMI V8 / 3.7L V6', 5.7, 7.0, false, true, true, true, false, true, 'M1-108', 28)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Laredo', 2005, 2010, 'SUV', 'gas', '3.7L V6', 3.7, 5.0, false, true, true, true, false, true, 'M1-108', 29)
ON CONFLICT DO NOTHING;

-- === TOYOTA COROLLA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Corolla', 'SE', 2020, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.4, true, false, false, false, true, true, 'M1-108', 49)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Corolla', 'XSE', 2020, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.4, true, false, false, false, true, true, 'M1-108', 50)
ON CONFLICT DO NOTHING;

-- === HONDA PILOT TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Pilot', 'EX-L', 2019, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, true, false, false, false, true, true, 'M1-110', 69)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Pilot', 'Touring', 2019, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, true, false, false, false, true, true, 'M1-110', 70)
ON CONFLICT DO NOTHING;

-- === NISSAN SENTRA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Sentra', 'SR', 2020, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, true, false, false, false, true, true, 'M1-110', 69)
ON CONFLICT DO NOTHING;

-- === HYUNDAI SONATA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Sonata', 'SEL', 2020, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.5L I4', 2.5, 4.5, true, false, false, false, true, true, 'M1-110', 71)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Sonata', 'Limited', 2020, 2024, 'Sedan', 'gas', '1.6L Turbo I4', 1.6, 4.5, true, false, false, false, true, true, 'M1-110', 72)
ON CONFLICT DO NOTHING;

-- === KIA TELLURIDE ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Kia', 'Telluride', 'EX', 2020, 2024, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, false, false, false, true, true, 'M1-110', 73)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Kia', 'Telluride', 'SX', 2020, 2024, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, false, false, false, true, true, 'M1-110', 74)
ON CONFLICT DO NOTHING;

-- === FORD FUSION TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Fusion', 'SE', 2013, 2020, 'Sedan', 'gas', '2.0L Turbo I4 / 1.5L Turbo I4 / 2.5L I4', 2.0, 5.5, true, false, false, false, true, true, 'FL820S', 15)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Fusion', 'Titanium', 2013, 2020, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 5.5, true, false, false, false, true, true, 'FL820S', 16)
ON CONFLICT DO NOTHING;

INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Fusion', 'Sport', 2017, 2020, 'Sedan', 'gas', '2.7L EcoBoost V6', 2.7, 6.0, true, false, false, false, true, true, 'FL820S', 17)
ON CONFLICT DO NOTHING;
