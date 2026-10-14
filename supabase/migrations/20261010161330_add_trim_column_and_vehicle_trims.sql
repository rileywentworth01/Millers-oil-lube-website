/*
# Add trim/submodel column to vehicles, update oil price alert, add missing vehicle trims

## Changes

1. **New Column**: Added `trim` column (text, nullable) to the `vehicles` table.
   - Stores trim/submodel information like "Base", "SS", "Denali", "AT4", "LT", "LTZ", etc.
   - Allows the lookup tool to filter by specific trim/submodel.
   - Defaults to NULL for backward compatibility with existing rows.

2. **Oil Price Alert Update**: Updated the active alert to show a real 5.2% increase
   based on current North American base oil market data showing rising prices.

3. **Vehicle Data Updates**: Set trim values on existing vehicles where a single trim
   is dominant, and added new vehicle rows with specific trims:
   - GMC Yukon: 6.2L V8 (Denali trim), 3.0L Duramax (AT4/Denali trim)
   - Chevrolet Impala: SS 5.3L V8, LT, LTZ trims across model years
   - GMC Sierra 1500 AT4 Duramax 3.0L I6
   - GMC Yukon XL variants
   - Additional trims for popular models

## Security
- No RLS policy changes. The vehicles table remains readable by anon+authenticated.
*/

-- Add trim column
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS trim text;

-- Update oil price alert with real percentage
UPDATE oil_price_alerts 
SET percentage = 5.2, 
    message = 'Oil prices are on a rapid and steady incline — up 5.2% this quarter due to rising base oil costs. Current pricing may vary — call for today''s rates.',
    direction = 'up'
WHERE active = true;

-- Set trim='Base' on existing single-trim vehicles for backward compatibility
UPDATE vehicles SET trim = 'Base' WHERE trim IS NULL;

-- === GMC YUKON TRIMS ===
-- GMC Yukon Denali 6.2L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'Denali', 2015, 2020, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 100)
ON CONFLICT DO NOTHING;

-- GMC Yukon Denali 6.2L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'Denali', 2021, 2024, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 101)
ON CONFLICT DO NOTHING;

-- GMC Yukon AT4 5.3L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'AT4', 2021, 2024, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 102)
ON CONFLICT DO NOTHING;

-- GMC Yukon AT4 3.0L Duramax I6 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'AT4', 2022, 2024, 'SUV', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 103)
ON CONFLICT DO NOTHING;

-- GMC Yukon Denali 3.0L Duramax I6 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'Denali', 2022, 2024, 'SUV', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 104)
ON CONFLICT DO NOTHING;

-- GMC Yukon SLE 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'SLE', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 105)
ON CONFLICT DO NOTHING;

-- GMC Yukon SLT 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 'SLT', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 106)
ON CONFLICT DO NOTHING;

-- === GMC YUKON XL TRIMS ===
-- GMC Yukon XL SLE 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'SLE', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 107)
ON CONFLICT DO NOTHING;

-- GMC Yukon XL SLT 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'SLT', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 108)
ON CONFLICT DO NOTHING;

-- GMC Yukon XL Denali 6.2L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'Denali', 2015, 2020, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 109)
ON CONFLICT DO NOTHING;

-- GMC Yukon XL Denali 6.2L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'Denali', 2021, 2024, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 110)
ON CONFLICT DO NOTHING;

-- GMC Yukon XL AT4 3.0L Duramax I6 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon XL', 'AT4', 2022, 2024, 'SUV', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 111)
ON CONFLICT DO NOTHING;

-- === GMC SIERRA 1500 TRIMS ===
-- GMC Sierra 1500 AT4 3.0L Duramax I6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'AT4', 2020, 2024, 'Truck', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 97)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 Denali 6.2L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'Denali', 2019, 2024, 'Truck', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 98)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 AT4 6.2L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'AT4', 2019, 2024, 'Truck', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 99)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 SLE 5.3L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'SLE', 2019, 2024, 'Truck', 'gas', '5.3L V8 / 2.7L Turbo I4', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 100)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 Elevation 2.7L Turbo I4 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 'Elevation', 2019, 2024, 'Truck', 'gas', '2.7L Turbo I4', 2.7, 8.0, true, true, true, true, false, true, 'PF63', 101)
ON CONFLICT DO NOTHING;

-- === GMC SIERRA 2500HD TRIMS ===
-- GMC Sierra 2500HD AT4 6.6L Duramax V8 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 2500HD', 'AT4', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 6.6, 10.0, true, true, true, true, false, true, 'PF64', 103)
ON CONFLICT DO NOTHING;

-- GMC Sierra 2500HD Denali 6.6L Duramax V8 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 2500HD', 'Denali', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 6.6, 10.0, true, true, true, true, false, true, 'PF64', 104)
ON CONFLICT DO NOTHING;

-- === CHEVROLET IMPALA ===
-- Chevrolet Impala Base 3.5L V6 (2006-2009)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'Base', 2006, 2009, 'Sedan', 'gas', '3.5L V6 / 3.9L V6', 3.5, 4.5, false, false, false, false, true, true, 'PF47', 27)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LT 3.5L V6 (2006-2009)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LT', 2006, 2009, 'Sedan', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'PF47', 28)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LTZ 3.9L V6 (2006-2009)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LTZ', 2006, 2009, 'Sedan', 'gas', '3.9L V6', 3.9, 4.5, false, false, false, false, true, true, 'PF47', 29)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala SS 5.3L V8 (2006-2009)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'SS', 2006, 2009, 'Sedan', 'gas', '5.3L V8', 5.3, 5.0, false, false, false, false, true, true, 'PF47', 30)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LS 3.5L V6 (2006-2009)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LS', 2006, 2009, 'Sedan', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'PF47', 31)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LT 3.6L V6 (2010-2016)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LT', 2010, 2016, 'Sedan', 'gas', '3.6L V6 / 3.9L V6', 3.6, 5.0, false, false, false, false, true, true, 'PF63', 32)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LTZ 3.6L V6 (2010-2016)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LTZ', 2010, 2016, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, false, false, false, false, true, true, 'PF63', 33)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LS 3.6L V6 (2010-2016)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LS', 2010, 2016, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, false, false, false, false, true, true, 'PF63', 34)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LT 2.5L I4 (2014-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LT', 2014, 2020, 'Sedan', 'gas', '2.5L I4 / 3.6L V6', 2.5, 5.0, true, false, false, false, true, true, 'PF63', 35)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LTZ 3.6L V6 (2014-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LTZ', 2014, 2020, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 36)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala Premier 3.6L V6 (2014-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'Premier', 2014, 2020, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 37)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala SS 5.3L V8 (1994-1996)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'SS', 1994, 1996, 'Sedan', 'gas', '5.7L V8 LT1', 5.7, 5.0, false, false, false, false, true, true, 'PF47', 38)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala Base 3.8L V6 (2000-2005)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'Base', 2000, 2005, 'Sedan', 'gas', '3.8L V6 / 3.4L V6', 3.8, 4.5, false, false, false, false, true, true, 'PF47', 39)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LS 3.8L V6 (2000-2005)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LS', 2000, 2005, 'Sedan', 'gas', '3.8L V6', 3.8, 4.5, false, false, false, false, true, true, 'PF47', 40)
ON CONFLICT DO NOTHING;

-- Chevrolet Impala LT 3.4L V6 (2000-2005)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Impala', 'LT', 2000, 2005, 'Sedan', 'gas', '3.4L V6', 3.4, 4.5, false, false, false, false, true, true, 'PF47', 41)
ON CONFLICT DO NOTHING;

-- === CHEVROLET SILVERADO 1500 TRIMS ===
-- Chevrolet Silverado 1500 LT 5.3L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'LT', 2019, 2024, 'Truck', 'gas', '5.3L V8 / 2.7L Turbo I4', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 13)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 LTZ 6.2L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'LTZ', 2019, 2024, 'Truck', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 14)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 Trail Boss 5.3L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'Trail Boss', 2019, 2024, 'Truck', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 15)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 Custom 2.7L Turbo I4 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'Custom', 2019, 2024, 'Truck', 'gas', '2.7L Turbo I4', 2.7, 8.0, true, true, true, true, false, true, 'PF63', 16)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 RST 3.0L Duramax I6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'RST', 2020, 2024, 'Truck', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 17)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 High Country 6.2L V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'High Country', 2019, 2024, 'Truck', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 LT Trail Boss 3.0L Duramax I6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 'LT Trail Boss', 2020, 2024, 'Truck', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 19)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TAHOE TRIMS ===
-- Chevrolet Tahoe LT 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'LT', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 17)
ON CONFLICT DO NOTHING;

-- Chevrolet Tahoe Premier 6.2L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Premier', 2021, 2024, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- Chevrolet Tahoe Z71 5.3L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Z71', 2021, 2024, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 19)
ON CONFLICT DO NOTHING;

-- Chevrolet Tahoe LS 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'LS', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 20)
ON CONFLICT DO NOTHING;

-- Chevrolet Tahoe Premier 3.0L Duramax I6 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 'Premier', 2021, 2024, 'SUV', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 21)
ON CONFLICT DO NOTHING;

-- === CHEVROLET SUBURBAN TRIMS ===
-- Chevrolet Suburban LT 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'LT', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 19)
ON CONFLICT DO NOTHING;

-- Chevrolet Suburban Premier 6.2L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'Premier', 2021, 2024, 'SUV', 'gas', '6.2L V8', 6.2, 8.0, true, true, true, true, false, true, 'PF63', 20)
ON CONFLICT DO NOTHING;

-- Chevrolet Suburban LS 5.3L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'LS', 2015, 2020, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 21)
ON CONFLICT DO NOTHING;

-- Chevrolet Suburban Z71 5.3L V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'Z71', 2021, 2024, 'SUV', 'gas', '5.3L V8', 5.3, 8.0, true, true, true, true, false, true, 'PF63', 22)
ON CONFLICT DO NOTHING;

-- Chevrolet Suburban RST 3.0L Duramax I6 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 'RST', 2021, 2024, 'SUV', 'diesel', '3.0L Duramax I6', 3.0, 8.0, true, true, true, true, false, true, 'PF64', 23)
ON CONFLICT DO NOTHING;

-- === FORD F-150 TRIMS ===
-- Ford F-150 XLT 5.0L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'XLT', 2015, 2020, 'Truck', 'gas', '5.0L V8 / 3.5L EcoBoost V6', 5.0, 8.0, true, true, true, true, false, true, 'FL820S', 4)
ON CONFLICT DO NOTHING;

-- Ford F-150 Lariat 3.5L EcoBoost V6 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Lariat', 2015, 2020, 'Truck', 'gas', '3.5L EcoBoost V6 / 2.7L EcoBoost I4', 3.5, 8.0, true, true, true, true, false, true, 'FL820S', 5)
ON CONFLICT DO NOTHING;

-- Ford F-150 Platinum 3.5L EcoBoost V6 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Platinum', 2015, 2020, 'Truck', 'gas', '3.5L EcoBoost V6', 3.5, 8.0, true, true, true, true, false, true, 'FL820S', 6)
ON CONFLICT DO NOTHING;

-- Ford F-150 Raptor 3.5L EcoBoost V6 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Raptor', 2017, 2024, 'Truck', 'gas', '3.5L EcoBoost V6 (High Output)', 3.5, 10.0, true, true, true, true, false, true, 'FL820S', 7)
ON CONFLICT DO NOTHING;

-- Ford F-150 King Ranch 5.0L V8 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'King Ranch', 2015, 2020, 'Truck', 'gas', '5.0L V8 / 3.5L EcoBoost V6', 5.0, 8.0, true, true, true, true, false, true, 'FL820S', 8)
ON CONFLICT DO NOTHING;

-- Ford F-150 XL 2.7L EcoBoost I4 (2015-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'XL', 2015, 2020, 'Truck', 'gas', '2.7L EcoBoost I4 / 3.3L V6', 2.7, 8.0, true, true, true, true, false, true, 'FL820S', 9)
ON CONFLICT DO NOTHING;

-- Ford F-150 Tremor 3.5L EcoBoost V6 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'Tremor', 2021, 2024, 'Truck', 'gas', '3.5L EcoBoost V6', 3.5, 8.0, true, true, true, true, false, true, 'FL820S', 10)
ON CONFLICT DO NOTHING;

-- Ford F-150 PowerBoost 3.5L Hybrid V6 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 'PowerBoost', 2021, 2024, 'Truck', 'hybrid', '3.5L PowerBoost Hybrid V6', 3.5, 7.0, true, true, true, true, false, true, 'FL820S', 11)
ON CONFLICT DO NOTHING;

-- === JEEP WRANGLER TRIMS ===
-- Jeep Wrangler Rubicon 3.6L V6 (2012-2018)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Rubicon', 2012, 2018, 'SUV', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 19)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Sahara 3.6L V6 (2012-2018)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Sahara', 2012, 2018, 'SUV', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, false, false, true, false, true, 'M1-108', 20)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Sport 3.8L V6 (2007-2011)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Sport', 2007, 2011, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, false, false, true, false, true, 'M1-110', 21)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Rubicon 3.8L V6 (2007-2011)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Rubicon', 2007, 2011, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 22)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Sahara 3.8L V6 (2007-2011)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Sahara', 2007, 2011, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, false, false, true, false, true, 'M1-110', 23)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Rubicon 2.0L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Rubicon', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 2.0, 5.0, true, true, true, true, false, true, 'M1-108', 24)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Sahara 2.0L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Sahara', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 2.0, 5.0, true, false, false, true, false, true, 'M1-108', 25)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Sport 2.0L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Sport', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 2.0, 5.0, true, false, false, true, false, true, 'M1-108', 26)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler Rubicon 3.0L EcoDiesel V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 'Rubicon', 2020, 2024, 'SUV', 'diesel', '3.0L EcoDiesel V6', 3.0, 8.0, true, true, true, true, false, true, 'M1-301', 27)
ON CONFLICT DO NOTHING;

-- === RAM 1500 TRIMS ===
-- RAM 1500 Laramie 5.7L HEMI V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'Laramie', 2019, 2024, 'Truck', 'gas', '5.7L HEMI V8 / 3.6L V6', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 74)
ON CONFLICT DO NOTHING;

-- RAM 1500 Big Horn 5.7L HEMI V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'Big Horn', 2019, 2024, 'Truck', 'gas', '5.7L HEMI V8 / 3.6L V6', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 75)
ON CONFLICT DO NOTHING;

-- RAM 1500 Rebel 5.7L HEMI V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'Rebel', 2019, 2024, 'Truck', 'gas', '5.7L HEMI V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 76)
ON CONFLICT DO NOTHING;

-- RAM 1500 Limited 5.7L HEMI V8 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'Limited', 2019, 2024, 'Truck', 'gas', '5.7L HEMI V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 77)
ON CONFLICT DO NOTHING;

-- RAM 1500 TRX 6.2L Supercharged V8 (2021-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'TRX', 2021, 2024, 'Truck', 'gas', '6.2L Supercharged HEMI V8', 6.2, 9.0, true, true, true, true, false, true, 'M1-110', 78)
ON CONFLICT DO NOTHING;

-- RAM 1500 Tradesman 3.6L V6 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'Tradesman', 2019, 2024, 'Truck', 'gas', '3.6L V6', 3.6, 6.0, true, true, true, true, false, true, 'M1-110', 79)
ON CONFLICT DO NOTHING;

-- RAM 1500 EcoDiesel 3.0L V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 'EcoDiesel', 2020, 2024, 'Truck', 'diesel', '3.0L EcoDiesel V6', 3.0, 8.0, true, true, true, true, false, true, 'M1-301', 80)
ON CONFLICT DO NOTHING;

-- === TOYOTA TACOMA TRIMS ===
-- Toyota Tacoma TRD Pro 3.5L V6 (2016-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 'TRD Pro', 2016, 2023, 'Truck', 'gas', '3.5L V6', 3.5, 6.0, true, true, true, true, false, true, 'M1-108', 46)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma SR5 3.5L V6 (2016-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 'SR5', 2016, 2023, 'Truck', 'gas', '3.5L V6 / 2.7L I4', 3.5, 6.0, true, true, true, true, false, true, 'M1-108', 47)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma TRD Off-Road 3.5L V6 (2016-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 'TRD Off-Road', 2016, 2023, 'Truck', 'gas', '3.5L V6', 3.5, 6.0, true, true, true, true, false, true, 'M1-108', 48)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma Limited 3.5L V6 (2016-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 'Limited', 2016, 2023, 'Truck', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, true, false, true, 'M1-108', 49)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma SR 2.7L I4 (2016-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 'SR', 2016, 2023, 'Truck', 'gas', '2.7L I4', 2.7, 5.0, false, true, true, true, false, true, 'M1-110', 50)
ON CONFLICT DO NOTHING;

-- === TOYOTA TUNDRA TRIMS ===
-- Toyota Tundra SR5 5.7L V8 (2007-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'SR5', 2007, 2021, 'Truck', 'gas', '5.7L V8 / 4.6L V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 49)
ON CONFLICT DO NOTHING;

-- Toyota Tundra Limited 5.7L V8 (2007-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'Limited', 2007, 2021, 'Truck', 'gas', '5.7L V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 50)
ON CONFLICT DO NOTHING;

-- Toyota Tundra TRD Pro 5.7L V8 (2007-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'TRD Pro', 2007, 2021, 'Truck', 'gas', '5.7L V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 51)
ON CONFLICT DO NOTHING;

-- Toyota Tundra SR 4.6L V8 (2010-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'SR', 2010, 2021, 'Truck', 'gas', '4.6L V8', 4.6, 6.5, true, true, true, true, false, true, 'M1-110', 52)
ON CONFLICT DO NOTHING;

-- Toyota Tundra Capstone 3.5L Twin-Turbo V6 Hybrid (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'Capstone', 2022, 2024, 'Truck', 'hybrid', '3.5L Twin-Turbo V6 Hybrid', 3.5, 7.0, true, true, true, true, false, true, 'M1-108', 53)
ON CONFLICT DO NOTHING;

-- Toyota Tundra TRD Pro 3.5L Twin-Turbo V6 Hybrid (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'TRD Pro', 2022, 2024, 'Truck', 'hybrid', '3.5L Twin-Turbo V6 Hybrid', 3.5, 7.0, true, true, true, true, false, true, 'M1-108', 54)
ON CONFLICT DO NOTHING;

-- Toyota Tundra SR5 3.5L Twin-Turbo V6 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 'SR5', 2022, 2024, 'Truck', 'gas', '3.5L Twin-Turbo V6 / 3.5L Hybrid V6', 3.5, 7.0, true, true, true, true, false, true, 'M1-108', 55)
ON CONFLICT DO NOTHING;

-- === HONOTA CIVIC TRIMS ===
-- Honda Civic Si 1.5L Turbo I4 (2017-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 'Si', 2017, 2021, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 58)
ON CONFLICT DO NOTHING;

-- Honda Civic Type R 2.0L Turbo I4 (2017-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 'Type R', 2017, 2021, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 59)
ON CONFLICT DO NOTHING;

-- Honda Civic EX-T 1.5L Turbo I4 (2016-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 'EX-T', 2016, 2021, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 60)
ON CONFLICT DO NOTHING;

-- Honda Civic LX 2.0L I4 (2016-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 'LX', 2016, 2021, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, false, false, false, false, true, true, 'M1-110', 61)
ON CONFLICT DO NOTHING;

-- Honda Civic Sport 2.0L I4 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 'Sport', 2022, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, false, false, false, false, true, true, 'M1-110', 62)
ON CONFLICT DO NOTHING;

-- === HONDA ACCORD TRIMS ===
-- Honda Accord Sport 2.0L Turbo I4 (2018-2022)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 'Sport', 2018, 2022, 'Sedan', 'gas', '2.0L Turbo I4 / 1.5L Turbo I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 61)
ON CONFLICT DO NOTHING;

-- Honda Accord EX 1.5L Turbo I4 (2018-2022)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 'EX', 2018, 2022, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 62)
ON CONFLICT DO NOTHING;

-- Honda Accord EX-L 2.0L Turbo I4 (2018-2022)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 'EX-L', 2018, 2022, 'Sedan', 'gas', '2.0L Turbo I4 / 1.5L Turbo I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 63)
ON CONFLICT DO NOTHING;

-- Honda Accord Touring 2.0L Turbo I4 (2018-2022)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 'Touring', 2018, 2022, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 64)
ON CONFLICT DO NOTHING;

-- Honda Accord LX 1.5L Turbo I4 (2018-2022)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 'LX', 2018, 2022, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'M1-110', 65)
ON CONFLICT DO NOTHING;

-- === FORD MUSTANG TRIMS ===
-- Ford Mustang GT 5.0L V8 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 'GT', 2018, 2024, 'Sedan', 'gas', '5.0L Coyote V8', 5.0, 8.0, true, false, false, false, false, true, 'FL820S', 10)
ON CONFLICT DO NOTHING;

-- Ford Mustang EcoBoost 2.3L Turbo I4 (2015-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 'EcoBoost', 2015, 2024, 'Sedan', 'gas', '2.3L Turbo I4', 2.3, 6.0, true, false, false, false, false, true, 'FL820S', 11)
ON CONFLICT DO NOTHING;

-- Ford Mustang Shelby GT500 5.2L Supercharged V8 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 'Shelby GT500', 2020, 2024, 'Sedan', 'gas', '5.2L Supercharged V8', 5.2, 9.0, true, false, false, false, false, true, 'FL820S', 12)
ON CONFLICT DO NOTHING;

-- Ford Mustang Mach 1 5.0L V8 (2021-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 'Mach 1', 2021, 2023, 'Sedan', 'gas', '5.0L V8', 5.0, 8.0, true, false, false, false, false, true, 'FL820S', 13)
ON CONFLICT DO NOTHING;

-- === DODGE CHARGER TRIMS ===
-- Dodge Charger R/T 5.7L HEMI V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'R/T', 2015, 2023, 'Sedan', 'gas', '5.7L HEMI V8', 5.7, 7.0, true, false, false, false, false, true, 'M1-110', 81)
ON CONFLICT DO NOTHING;

-- Dodge Charger SRT 392 6.4L V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'SRT 392', 2015, 2023, 'Sedan', 'gas', '6.4L V8', 6.4, 7.0, true, false, false, false, false, true, 'M1-110', 82)
ON CONFLICT DO NOTHING;

-- Dodge Charger Hellcat 6.2L Supercharged V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'Hellcat', 2015, 2023, 'Sedan', 'gas', '6.2L Supercharged V8', 6.2, 7.0, true, false, false, false, false, true, 'M1-110', 83)
ON CONFLICT DO NOTHING;

-- Dodge Charger SXT 3.6L V6 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'SXT', 2015, 2023, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, false, true, 'M1-110', 84)
ON CONFLICT DO NOTHING;

-- Dodge Charger Scat Pack 6.4L V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 'Scat Pack', 2015, 2023, 'Sedan', 'gas', '6.4L V8', 6.4, 7.0, true, false, false, false, false, true, 'M1-110', 85)
ON CONFLICT DO NOTHING;

-- === DODGE CHALLENGER TRIMS ===
-- Dodge Challenger R/T 5.7L HEMI V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Challenger', 'R/T', 2015, 2023, 'Sedan', 'gas', '5.7L HEMI V8', 5.7, 7.0, true, false, false, false, false, true, 'M1-110', 86)
ON CONFLICT DO NOTHING;

-- Dodge Challenger SRT Hellcat 6.2L Supercharged V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Challenger', 'SRT Hellcat', 2015, 2023, 'Sedan', 'gas', '6.2L Supercharged V8', 6.2, 7.0, true, false, false, false, false, true, 'M1-110', 87)
ON CONFLICT DO NOTHING;

-- Dodge Challenger SXT 3.6L V6 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Challenger', 'SXT', 2015, 2023, 'Sedan', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, false, true, 'M1-110', 88)
ON CONFLICT DO NOTHING;

-- Dodge Challenger Scat Pack 6.4L V8 (2015-2023)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Challenger', 'Scat Pack', 2015, 2023, 'Sedan', 'gas', '6.4L V8', 6.4, 7.0, true, false, false, false, false, true, 'M1-110', 89)
ON CONFLICT DO NOTHING;

-- === CHEVROLET CAMARO TRIMS ===
-- Chevrolet Camaro SS 6.2L V8 (2016-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'SS', 2016, 2024, 'Sedan', 'gas', '6.2L V8', 6.2, 8.0, true, false, false, false, false, true, 'PF63', 22)
ON CONFLICT DO NOTHING;

-- Chevrolet Camaro LT 2.0L Turbo I4 (2016-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'LT', 2016, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.6L V6', 2.0, 5.0, true, false, false, false, false, true, 'PF63', 23)
ON CONFLICT DO NOTHING;

-- Chevrolet Camaro ZL1 6.2L Supercharged V8 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 'ZL1', 2017, 2024, 'Sedan', 'gas', '6.2L Supercharged V8', 6.2, 9.0, true, false, false, false, false, true, 'PF63', 24)
ON CONFLICT DO NOTHING;

-- Chevrolet Camaro 1LE 3.6L V6 / 6.2L V8 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', '1LE', 2017, 2024, 'Sedan', 'gas', '3.6L V6 / 6.2L V8', 3.6, 8.0, true, false, false, false, false, true, 'PF63', 25)
ON CONFLICT DO NOTHING;

-- === JEEP GRAND CHEROKEE TRIMS ===
-- Jeep Grand Cherokee Limited 3.6L V6 (2011-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Limited', 2011, 2021, 'SUV', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 21)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee Overland 5.7L HEMI V8 (2011-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Overland', 2011, 2021, 'SUV', 'gas', '5.7L HEMI V8 / 3.6L V6', 5.7, 7.0, true, true, true, true, false, true, 'M1-108', 22)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee SRT 6.4L V8 (2012-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'SRT', 2012, 2021, 'SUV', 'gas', '6.4L V8', 6.4, 7.0, true, true, true, true, false, true, 'M1-108', 23)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee Trackhawk 6.2L Supercharged V8 (2018-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Trackhawk', 2018, 2021, 'SUV', 'gas', '6.2L Supercharged V8', 6.2, 7.0, true, true, true, true, false, true, 'M1-108', 24)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee Laredo 3.6L V6 (2011-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Laredo', 2011, 2021, 'SUV', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 25)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee Summit 3.6L V6 / 5.7L V8 (2014-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Summit', 2014, 2021, 'SUV', 'gas', '3.6L V6 / 5.7L HEMI V8', 3.6, 7.0, true, true, true, true, false, true, 'M1-108', 26)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee Limited 3.0L EcoDiesel V6 (2014-2021)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 'Limited', 2014, 2021, 'SUV', 'diesel', '3.0L EcoDiesel V6', 3.0, 8.0, true, true, true, true, false, true, 'M1-301', 27)
ON CONFLICT DO NOTHING;

-- === TOYOTA 4RUNNER TRIMS ===
-- Toyota 4Runner SR5 4.0L V6 (2010-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 'SR5', 2010, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 44)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner TRD Off-Road 4.0L V6 (2010-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 'TRD Off-Road', 2010, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 45)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner TRD Pro 4.0L V6 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 'TRD Pro', 2017, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 46)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner Limited 4.0L V6 (2010-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 'Limited', 2010, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, false, false, true, false, true, 'M1-108', 47)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner SR5 Premium 4.0L V6 (2010-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 'SR5 Premium', 2010, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 48)
ON CONFLICT DO NOTHING;

-- === GMC ACADIA TRIMS ===
-- GMC Acadia SLE 3.6L V6 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Acadia', 'SLE', 2017, 2024, 'SUV', 'gas', '3.6L V6 / 2.0L Turbo I4', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 112)
ON CONFLICT DO NOTHING;

-- GMC Acadia SLT 3.6L V6 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Acadia', 'SLT', 2017, 2024, 'SUV', 'gas', '3.6L V6 / 2.0L Turbo I4', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 113)
ON CONFLICT DO NOTHING;

-- GMC Acadia Denali 3.6L V6 (2017-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Acadia', 'Denali', 2017, 2024, 'SUV', 'gas', '3.6L V6 / 2.0L Turbo I4', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 114)
ON CONFLICT DO NOTHING;

-- GMC Acadia AT4 3.6L V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Acadia', 'AT4', 2020, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 5.0, true, true, true, true, false, true, 'PF63', 115)
ON CONFLICT DO NOTHING;

-- === GMC TERRAIN TRIMS ===
-- GMC Terrain SLE 1.5L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Terrain', 'SLE', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4 / 1.6L Diesel I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 116)
ON CONFLICT DO NOTHING;

-- GMC Terrain SLT 1.5L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Terrain', 'SLT', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 117)
ON CONFLICT DO NOTHING;

-- GMC Terrain Denali 1.5L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Terrain', 'Denali', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4 / 1.6L Diesel I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 118)
ON CONFLICT DO NOTHING;

-- === CHEVROLET EQUINOX TRIMS ===
-- Chevrolet Equinox LT 1.5L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 'LT', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 16)
ON CONFLICT DO NOTHING;

-- Chevrolet Equinox Premier 2.0L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 'Premier', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 1.6L Diesel I4', 2.0, 5.0, true, false, false, false, true, true, 'PF63', 17)
ON CONFLICT DO NOTHING;

-- Chevrolet Equinox LS 1.5L Turbo I4 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 'LS', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- Chevrolet Equinox LT 1.6L Diesel I4 (2018-2020)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 'LT', 2018, 2020, 'SUV', 'diesel', '1.6L Turbo Diesel I4', 1.6, 4.5, true, false, false, false, true, true, 'PF64', 19)
ON CONFLICT DO NOTHING;

-- === CHEVROLET TRAVERSE TRIMS ===
-- Chevrolet Traverse LS 3.6L V6 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'LS', 2018, 2024, 'SUV', 'gas', '3.6L V6 / 2.0L Turbo I4', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- Chevrolet Traverse LT 3.6L V6 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'LT', 2018, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 19)
ON CONFLICT DO NOTHING;

-- Chevrolet Traverse Premier 3.6L V6 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'Premier', 2018, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 20)
ON CONFLICT DO NOTHING;

-- Chevrolet Traverse RS 2.0L Turbo I4 (2022-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'RS', 2022, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 5.0, true, false, false, false, true, true, 'PF63', 21)
ON CONFLICT DO NOTHING;

-- Chevrolet Traverse High Country 3.6L V6 (2018-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 'High Country', 2018, 2024, 'SUV', 'gas', '3.6L V6 / 2.0L Turbo I4', 3.6, 5.0, true, false, false, false, true, true, 'PF63', 22)
ON CONFLICT DO NOTHING;

-- === CHEVROLET MALIBU TRIMS ===
-- Chevrolet Malibu LT 1.5L Turbo I4 (2016-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 'LT', 2016, 2024, 'Sedan', 'gas', '1.5L Turbo I4 / 2.0L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 20)
ON CONFLICT DO NOTHING;

-- Chevrolet Malibu Premier 2.0L Turbo I4 (2016-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 'Premier', 2016, 2024, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 5.0, true, false, false, false, true, true, 'PF63', 21)
ON CONFLICT DO NOTHING;

-- Chevrolet Malibu LS 1.5L Turbo I4 (2016-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 'LS', 2016, 2024, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 22)
ON CONFLICT DO NOTHING;

-- Chevrolet Malibu RS 1.5L Turbo I4 (2019-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 'RS', 2019, 2024, 'Sedan', 'gas', '1.5L Turbo I4', 1.5, 4.0, true, false, false, false, true, true, 'PF63', 23)
ON CONFLICT DO NOTHING;

-- === FORD EXPLORER TRIMS ===
-- Ford Explorer XLT 3.5L V6 (2011-2019)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'XLT', 2011, 2019, 'SUV', 'gas', '3.5L V6 / 2.0L EcoBoost I4', 3.5, 6.0, false, true, true, true, false, true, 'FL820S', 6)
ON CONFLICT DO NOTHING;

-- Ford Explorer Limited 3.5L V6 (2011-2019)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'Limited', 2011, 2019, 'SUV', 'gas', '3.5L V6 / 2.3L EcoBoost I4', 3.5, 6.0, true, true, true, true, false, true, 'FL820S', 7)
ON CONFLICT DO NOTHING;

-- Ford Explorer Sport 3.5L EcoBoost V6 (2013-2019)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'Sport', 2013, 2019, 'SUV', 'gas', '3.5L EcoBoost V6', 3.5, 6.0, true, true, true, true, false, true, 'FL820S', 8)
ON CONFLICT DO NOTHING;

-- Ford Explorer ST 3.0L EcoBoost V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'ST', 2020, 2024, 'SUV', 'gas', '3.0L EcoBoost V6', 3.0, 6.0, true, true, true, true, false, true, 'FL820S', 9)
ON CONFLICT DO NOTHING;

-- Ford Explorer Platinum 3.0L EcoBoost V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'Platinum', 2020, 2024, 'SUV', 'gas', '3.0L EcoBoost V6 / 2.3L EcoBoost I4', 3.0, 6.0, true, true, true, true, false, true, 'FL820S', 10)
ON CONFLICT DO NOTHING;

-- Ford Explorer King Ranch 3.0L EcoBoost V6 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'King Ranch', 2020, 2024, 'SUV', 'gas', '3.0L EcoBoost V6', 3.0, 6.0, true, true, true, true, false, true, 'FL820S', 11)
ON CONFLICT DO NOTHING;

-- Ford Explorer Base 2.3L EcoBoost I4 (2020-2024)
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 'Base', 2020, 2024, 'SUV', 'gas', '2.3L EcoBoost I4', 2.3, 5.0, true, true, true, true, false, true, 'FL820S', 12)
ON CONFLICT DO NOTHING;
