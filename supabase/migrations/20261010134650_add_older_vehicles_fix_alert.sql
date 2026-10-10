/*
# Add older vehicle generations, fix engine options, update oil price alert

1. New vehicle records added for older model years (back to 1970s):
   - Jeep Wrangler 3.8L V6 (2007-2011), 3.6L V6 (2012-2018)
   - Ford F-150 older generations (2004-2014)
   - Chevrolet Silverado 1500 older (2007-2018)
   - Toyota Tacoma older (2005-2015)
   - Honda Civic/Accord older (2001-2015)
   - And more popular models with older year ranges

2. Updated oil_price_alerts: changed from 8.5% to a more general "rapid and steady incline" message

3. All new vehicles include proper engine_liters, oil_capacity_quarts, drivetrain flags, and serviceable=true
*/

-- Jeep Wrangler 3.8L V6 (2007-2011)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 2007, 2011, 'SUV', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 17)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler 3.6L V6 Pentastar (2012-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 2012, 2018, 'SUV', 'gas', '3.6L Pentastar V6', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 18)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler 4.0L I6 (1997-2006)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 1997, 2006, 'SUV', 'gas', '4.0L AMC I6', 4.0, 6.0, false, true, true, true, false, true, 'M1-300', 16)
ON CONFLICT DO NOTHING;

-- Jeep Wrangler 2.5L I4 (1997-2002)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Wrangler', 1997, 2002, 'SUV', 'gas', '2.5L AMC I4', 2.5, 4.0, false, true, true, true, false, true, 'M1-200', 15)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee older (1999-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 1999, 2010, 'SUV', 'gas', '4.0L I6 / 4.7L V8 / 5.7L HEMI V8', 4.7, 6.0, false, true, true, true, false, true, 'M1-301', 19)
ON CONFLICT DO NOTHING;

-- Jeep Grand Cherokee 3.6L V6 (2011-2021)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Grand Cherokee', 2011, 2021, 'SUV', 'gas', '3.6L Pentastar V6 / 5.7L HEMI V8', 3.6, 5.0, true, true, true, true, false, true, 'M1-108', 20)
ON CONFLICT DO NOTHING;

-- Jeep Cherokee 4.0L I6 (1984-2001)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Cherokee', 1984, 2001, 'SUV', 'gas', '4.0L AMC I6', 4.0, 6.0, false, true, true, true, false, true, 'M1-300', 21)
ON CONFLICT DO NOTHING;

-- Ford F-150 5.4L V8 (2004-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 2004, 2010, 'Truck', 'gas', '4.6L V8 / 5.4L V8', 5.4, 7.0, false, true, true, true, false, true, 'FL820S', 2)
ON CONFLICT DO NOTHING;

-- Ford F-150 3.5L EcoBoost V6 (2011-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 2011, 2014, 'Truck', 'gas', '3.5L EcoBoost V6 / 5.0L V8', 3.5, 7.0, true, true, true, true, false, true, 'FL820S', 3)
ON CONFLICT DO NOTHING;

-- Ford F-150 4.2L V6 (1997-2008)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-150', 1997, 2008, 'Truck', 'gas', '4.2L V6 / 4.6L V8', 4.2, 6.0, false, true, true, true, false, true, 'FL820S', 1)
ON CONFLICT DO NOTHING;

-- Ford Mustang 4.6L V8 (1996-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 1996, 2010, 'Sedan', 'gas', '4.0L V6 / 4.6L V8', 4.6, 6.0, false, false, false, false, false, true, 'FL820S', 8)
ON CONFLICT DO NOTHING;

-- Ford Mustang 5.0L V8 (2011-2017)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Mustang', 2011, 2017, 'Sedan', 'gas', '3.7L V6 / 5.0L Coyote V8', 5.0, 8.0, true, false, false, false, false, true, 'FL820S', 9)
ON CONFLICT DO NOTHING;

-- Ford Explorer 4.0L V6 (1995-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Explorer', 1995, 2010, 'SUV', 'gas', '4.0L V6 / 5.0L V8', 4.0, 6.0, false, true, true, true, false, true, 'FL820S', 5)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 5.3L V8 (1999-2006)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 1999, 2006, 'Truck', 'gas', '4.3L V6 / 4.8L V8 / 5.3L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF47', 11)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 1500 5.3L V8 (2007-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 1500', 2007, 2018, 'Truck', 'gas', '4.3L V6 / 5.3L V8 / 6.2L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 12)
ON CONFLICT DO NOTHING;

-- Chevrolet Silverado 2500HD 6.0L V8 (2001-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Silverado 2500HD', 2001, 2010, 'Truck', 'gas', '6.0L V8 / 8.1L V8', 6.0, 7.0, false, true, true, true, false, true, 'PF63', 14)
ON CONFLICT DO NOTHING;

-- Chevrolet Tahoe 5.3L V8 (1995-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Tahoe', 1995, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF63', 16)
ON CONFLICT DO NOTHING;

-- Chevrolet Suburban 5.3L V8 (2000-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Suburban', 2000, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF63', 18)
ON CONFLICT DO NOTHING;

-- Chevrolet Camaro 3.6L V6 (2010-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 2010, 2015, 'Sedan', 'gas', '3.6L V6 / 6.2L V8', 3.6, 6.0, true, false, false, false, false, true, 'PF63', 21)
ON CONFLICT DO NOTHING;

-- Chevrolet Camaro older (1993-2002)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Camaro', 1993, 2002, 'Sedan', 'gas', '3.4L V6 / 3.8L V6 / 5.7L V8', 3.8, 5.0, false, false, false, false, false, true, 'PF47', 20)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma 3.4L V6 (1995-2004)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 1995, 2004, 'Truck', 'gas', '2.4L I4 / 2.7L I4 / 3.4L V6', 3.4, 6.0, false, true, true, true, false, true, 'M1-110', 44)
ON CONFLICT DO NOTHING;

-- Toyota Tacoma 4.0L V6 (2005-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tacoma', 2005, 2015, 'Truck', 'gas', '2.7L I4 / 4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 45)
ON CONFLICT DO NOTHING;

-- Toyota Camry older (1997-2011)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Camry', 1997, 2011, 'Sedan', 'gas', '2.2L I4 / 3.0L V6 / 2.5L I4', 2.5, 5.0, false, false, false, false, true, true, 'M1-110', 35)
ON CONFLICT DO NOTHING;

-- Toyota Corolla older (1998-2013)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Corolla', 1998, 2013, 'Sedan', 'gas', '1.8L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 37)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner 4.0L V6 (2003-2024)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 2003, 2024, 'SUV', 'gas', '4.0L V6', 4.0, 6.0, true, true, true, true, false, true, 'M1-108', 43)
ON CONFLICT DO NOTHING;

-- Toyota Tundra 4.6L/5.7L V8 (2007-2021)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 2007, 2021, 'Truck', 'gas', '4.6L V8 / 5.7L V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 48)
ON CONFLICT DO NOTHING;

-- Honda Civic older (1996-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic', 1996, 2015, 'Sedan', 'gas', '1.6L I4 / 1.8L I4 / 2.0L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 57)
ON CONFLICT DO NOTHING;

-- Honda Accord older (1998-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Accord', 1998, 2012, 'Sedan', 'gas', '2.3L I4 / 3.0L V6 / 2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 60)
ON CONFLICT DO NOTHING;

-- Honda CR-V older (1997-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'CR-V', 1997, 2016, 'SUV', 'gas', '2.0L I4 / 2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 63)
ON CONFLICT DO NOTHING;

-- Honda Odyssey older (1999-2017)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Odyssey', 1999, 2017, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 66)
ON CONFLICT DO NOTHING;

-- Honda Pilot older (2003-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Pilot', 2003, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 68)
ON CONFLICT DO NOTHING;

-- RAM 1500 5.7L HEMI V8 (2003-2013)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '1500', 2003, 2013, 'Truck', 'gas', '3.7L V6 / 4.7L V8 / 5.7L HEMI V8', 5.7, 7.0, false, true, true, true, false, true, 'M1-110', 73)
ON CONFLICT DO NOTHING;

-- RAM 2500 5.7L/5.9L (1994-2010)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '2500', 1994, 2010, 'Truck', 'gas', '5.2L V8 / 5.9L V8 / 8.0L V10', 5.9, 7.0, false, true, true, true, false, true, 'M1-110', 76)
ON CONFLICT DO NOTHING;

-- RAM 2500 5.9L Cummins Diesel (1994-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('RAM', '2500', 1994, 2012, 'Truck', 'diesel', '5.9L / 6.7L Cummins I6', 6.7, 12.0, true, true, true, true, false, true, 'M1-301', 77)
ON CONFLICT DO NOTHING;

-- Dodge Charger older (2006-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Charger', 2006, 2014, 'Sedan', 'gas', '3.5L V6 / 5.7L HEMI V8 / 6.1L SRT V8', 5.7, 7.0, false, false, false, false, false, true, 'M1-110', 80)
ON CONFLICT DO NOTHING;

-- Dodge Durango older (1998-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Durango', 1998, 2019, 'SUV', 'gas', '4.7L V8 / 5.7L HEMI V8 / 3.6L V6', 3.6, 6.0, false, true, true, true, false, true, 'M1-110', 82)
ON CONFLICT DO NOTHING;

-- Nissan Altima older (2002-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Altima', 2002, 2012, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 4.5, false, false, false, false, true, true, 'M1-110', 86)
ON CONFLICT DO NOTHING;

-- Nissan Frontier older (1998-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Frontier', 1998, 2014, 'Truck', 'gas', '2.4L I4 / 2.5L I4 / 4.0L V6', 4.0, 5.0, false, true, true, true, false, true, 'M1-110', 89)
ON CONFLICT DO NOTHING;

-- Nissan Titan older (2004-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Titan', 2004, 2015, 'Truck', 'gas', '5.6L V8', 5.6, 6.5, false, true, true, true, false, true, 'M1-110', 91)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 5.3L V8 (1999-2006)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 1999, 2006, 'Truck', 'gas', '4.3L V6 / 4.8L V8 / 5.3L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF47', 95)
ON CONFLICT DO NOTHING;

-- GMC Sierra 1500 5.3L V8 (2007-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Sierra 1500', 2007, 2018, 'Truck', 'gas', '4.3L V6 / 5.3L V8 / 6.2L V8', 5.3, 8.0, false, true, true, true, false, true, 'PF63', 96)
ON CONFLICT DO NOTHING;

-- GMC Yukon older (1995-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Yukon', 1995, 2014, 'SUV', 'gas', '5.3L V8 / 6.0L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF63', 99)
ON CONFLICT DO NOTHING;

-- Subaru Outback older (2000-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Subaru', 'Outback', 2000, 2014, 'SUV', 'gas', '2.5L H4 / 3.0L H6 / 3.6L H6', 2.5, 5.0, false, true, false, false, false, true, 'M1-110', 105)
ON CONFLICT DO NOTHING;

-- Subaru Forester older (1998-2013)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Subaru', 'Forester', 1998, 2013, 'SUV', 'gas', '2.5L H4 / 2.0L Turbo H4', 2.5, 4.5, false, true, false, false, false, true, 'M1-110', 107)
ON CONFLICT DO NOTHING;

-- Subaru Legacy older (1995-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Subaru', 'Legacy', 1995, 2014, 'Sedan', 'gas', '2.2L H4 / 2.5L H4', 2.5, 4.5, false, true, false, false, false, true, 'M1-110', 109)
ON CONFLICT DO NOTHING;

-- Ford Escape older (2001-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Escape', 2001, 2012, 'SUV', 'gas', '2.0L I4 / 3.0L V6', 3.0, 5.0, false, false, false, false, true, true, 'FL820S', 6)
ON CONFLICT DO NOTHING;

-- Ford F-250 Super Duty 6.2L V8 / 7.3L (1999-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-250 Super Duty', 1999, 2016, 'Truck', 'gas', '6.2L V8 / 7.3L V8', 6.2, 7.0, false, true, true, true, false, true, 'FL820S', 13)
ON CONFLICT DO NOTHING;

-- Ford F-250 Super Duty Diesel (2011-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'F-250 Super Duty', 2011, 2016, 'Truck', 'diesel', '6.7L PowerStroke V8', 6.7, 13.0, true, true, true, true, false, true, 'FL2016B', 14)
ON CONFLICT DO NOTHING;

-- Toyota RAV4 older (1996-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'RAV4', 1996, 2012, 'SUV', 'gas', '2.0L I4 / 2.5L I4 / 3.5L V6', 2.5, 4.5, false, false, false, false, true, true, 'M1-110', 39)
ON CONFLICT DO NOTHING;

-- Toyota Highlander older (2001-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Highlander', 2001, 2019, 'SUV', 'gas', '2.4L I4 / 3.0L V6 / 3.5L V6', 3.5, 6.0, false, false, false, false, true, true, 'M1-110', 41)
ON CONFLICT DO NOTHING;

-- Toyota Sequoia older (2001-2022)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Sequoia', 2001, 2022, 'SUV', 'gas', '4.7L V8 / 5.7L V8', 5.7, 7.0, true, true, true, true, false, true, 'M1-110', 50)
ON CONFLICT DO NOTHING;

-- Toyota Avalon older (1995-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Avalon', 1995, 2018, 'Sedan', 'gas', '3.0L V6 / 3.5L V6', 3.5, 6.0, false, false, false, false, true, true, 'M1-110', 52)
ON CONFLICT DO NOTHING;

-- Chevrolet Equinox older (2005-2017)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Equinox', 2005, 2017, 'SUV', 'gas', '2.4L I4 / 3.0L V6 / 3.6L V6', 2.4, 5.0, false, false, false, false, true, true, 'PF63', 15)
ON CONFLICT DO NOTHING;

-- Chevrolet Malibu older (1997-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Malibu', 1997, 2016, 'Sedan', 'gas', '2.2L I4 / 2.4L I4 / 3.6L V6', 2.4, 5.0, false, false, false, false, true, true, 'PF47', 19)
ON CONFLICT DO NOTHING;

-- Chevrolet Traverse older (2009-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Traverse', 2009, 2016, 'SUV', 'gas', '3.6L V6', 3.6, 6.0, false, false, false, false, true, true, 'PF63', 17)
ON CONFLICT DO NOTHING;

-- Ford Expedition older (1997-2017)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Expedition', 1997, 2017, 'SUV', 'gas', '4.6L V8 / 5.4L V8 / 3.5L EcoBoost V6', 5.4, 7.0, false, true, true, true, false, true, 'FL820S', 10)
ON CONFLICT DO NOTHING;

-- Ford Ranger older (1993-2011)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Ranger', 1993, 2011, 'Truck', 'gas', '2.3L I4 / 3.0L V6 / 4.0L V6', 4.0, 6.0, false, true, true, true, false, true, 'FL820S', 11)
ON CONFLICT DO NOTHING;

-- Ford Fusion older (2006-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Fusion', 2006, 2016, 'Sedan', 'gas', '2.5L I4 / 3.0L V6 / 3.5L V6', 2.5, 5.0, false, false, false, false, true, true, 'FL820S', 7)
ON CONFLICT DO NOTHING;

-- Jeep Liberty (2002-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Liberty', 2002, 2012, 'SUV', 'gas', '3.7L V6 / 2.8L Diesel I4', 3.7, 5.0, false, true, true, true, false, true, 'M1-108', 22)
ON CONFLICT DO NOTHING;

-- Jeep Compass older (2007-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Jeep', 'Compass', 2007, 2016, 'SUV', 'gas', '2.0L I4 / 2.4L I4', 2.4, 5.0, false, false, false, false, true, true, 'M1-110', 23)
ON CONFLICT DO NOTHING;

-- Honda Pilot older already added above

-- Toyota Tundra older (2000-2006)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Tundra', 2000, 2006, 'Truck', 'gas', '3.4L V6 / 4.7L V8', 4.7, 6.0, false, true, true, true, false, true, 'M1-110', 47)
ON CONFLICT DO NOTHING;

-- Nissan Pathfinder older (1996-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Pathfinder', 1996, 2012, 'SUV', 'gas', '3.3L V6 / 3.5L V6 / 4.0L V6', 4.0, 5.0, false, true, true, true, false, true, 'M1-110', 88)
ON CONFLICT DO NOTHING;

-- Nissan Rogue older (2008-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Rogue', 2008, 2019, 'SUV', 'gas', '2.5L I4', 2.5, 4.5, false, false, false, false, true, true, 'M1-110', 87)
ON CONFLICT DO NOTHING;

-- Honda Ridgeline older (2006-2014)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Ridgeline', 2006, 2014, 'Truck', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 70)
ON CONFLICT DO NOTHING;

-- Volkswagen Jetta older (1999-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Volkswagen', 'Jetta', 1999, 2018, 'Sedan', 'gas', '1.8T I4 / 2.0L I4 / 2.5L I5', 2.0, 4.5, false, false, false, false, true, true, 'M1-110', 112)
ON CONFLICT DO NOTHING;

-- Volkswagen Passat older (1998-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Volkswagen', 'Passat', 1998, 2018, 'Sedan', 'gas', '1.8T I4 / 2.0T I4 / 3.6L VR6', 2.0, 5.0, false, false, false, false, true, true, 'M1-110', 114)
ON CONFLICT DO NOTHING;

-- Hyundai Elantra older (2001-2016)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Elantra', 2001, 2016, 'Sedan', 'gas', '1.8L I4 / 2.0L I4', 2.0, 4.5, false, false, false, false, true, true, 'M1-110', 119)
ON CONFLICT DO NOTHING;

-- Hyundai Sonata older (2001-2017)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Sonata', 2001, 2017, 'Sedan', 'gas', '2.4L I4 / 3.3L V6 / 2.0T I4', 2.4, 5.0, false, false, false, false, true, true, 'M1-110', 121)
ON CONFLICT DO NOTHING;

-- Mazda3 older (2004-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Mazda', 'Mazda3', 2004, 2018, 'Sedan', 'gas', '2.0L I4 / 2.5L I4', 2.0, 4.5, false, false, false, false, true, true, 'M1-110', 126)
ON CONFLICT DO NOTHING;

-- Mazda CX-5 older (2013-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Mazda', 'CX-5', 2013, 2018, 'SUV', 'gas', '2.0L I4 / 2.5L I4', 2.5, 4.5, false, false, false, false, true, true, 'M1-110', 128)
ON CONFLICT DO NOTHING;

-- Lexus RX 350 older (2007-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Lexus', 'RX 350', 2007, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-110', 132)
ON CONFLICT DO NOTHING;

-- Lexus ES 350 older (2007-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Lexus', 'ES 350', 2007, 2018, 'Sedan', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-110', 130)
ON CONFLICT DO NOTHING;

-- BMW 3 Series older (1999-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('BMW', '3 Series', 1999, 2018, 'Sedan', 'gas', '2.0L I4 / 2.5L I6 / 3.0L I6', 3.0, 6.5, true, false, false, false, false, true, 'M1-110', 138)
ON CONFLICT DO NOTHING;

-- BMW 5 Series older (1997-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('BMW', '5 Series', 1997, 2018, 'Sedan', 'gas', '2.5L I6 / 3.0L I6 / 4.4L V8', 3.0, 7.0, true, false, false, false, false, true, 'M1-110', 140)
ON CONFLICT DO NOTHING;

-- Mercedes C-Class older (2001-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Mercedes-Benz', 'C-Class', 2001, 2019, 'Sedan', 'gas', '1.8L I4 / 2.5L V6 / 3.0L V6 / 3.5L V6', 3.0, 7.0, true, false, false, false, false, true, 'M1-110', 144)
ON CONFLICT DO NOTHING;

-- Mercedes E-Class older (1996-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Mercedes-Benz', 'E-Class', 1996, 2019, 'Sedan', 'gas', '2.6L I4 / 3.2L V6 / 4.2L V8 / 5.0L V8', 3.2, 8.0, true, false, false, false, false, true, 'M1-110', 146)
ON CONFLICT DO NOTHING;

-- Kia Sorento older (2003-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Kia', 'Sorento', 2003, 2019, 'SUV', 'gas', '2.4L I4 / 3.3L V6 / 3.5L V6', 3.3, 5.0, false, true, true, true, false, true, 'M1-110', 151)
ON CONFLICT DO NOTHING;

-- Kia Sportage older (1995-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Kia', 'Sportage', 1995, 2019, 'SUV', 'gas', '2.0L I4 / 2.4L I4 / 2.0T I4', 2.4, 5.0, false, false, false, false, true, true, 'M1-110', 149)
ON CONFLICT DO NOTHING;

-- Honda HR-V older is not needed, it's a newer model

-- Toyota Prius (2001-2024)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Prius', 2001, 2024, 'Sedan', 'hybrid', '1.8L I4 Hybrid', 1.8, 4.5, true, false, false, false, true, true, 'M1-110', 53)
ON CONFLICT DO NOTHING;

-- Ford Bronco older (1990-1996)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Bronco', 1990, 1996, 'SUV', 'gas', '4.9L I6 / 5.0L V8 / 5.8L V8', 5.0, 6.0, false, true, true, true, false, true, 'FL820S', 4)
ON CONFLICT DO NOTHING;

-- Chevrolet S-10 (1994-2004)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'S-10', 1994, 2004, 'Truck', 'gas', '2.2L I4 / 4.3L V6', 4.3, 5.0, false, true, true, true, false, true, 'PF47', 25)
ON CONFLICT DO NOTHING;

-- Ford Taurus (1990-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Taurus', 1990, 2019, 'Sedan', 'gas', '3.0L V6 / 3.5L V6', 3.0, 5.0, false, false, false, false, true, true, 'FL820S', 12)
ON CONFLICT DO NOTHING;

-- Honda Element (2003-2011)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Element', 2003, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, false, false, true, true, 'M1-110', 72)
ON CONFLICT DO NOTHING;

-- Nissan Sentra older (2000-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Sentra', 2000, 2019, 'Sedan', 'gas', '1.8L I4 / 2.0L I4 / 2.5L I4', 2.0, 4.0, false, false, false, false, true, true, 'M1-110', 85)
ON CONFLICT DO NOTHING;

-- Nissan Maxima (1995-2020)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Nissan', 'Maxima', 1995, 2020, 'Sedan', 'gas', '3.0L V6 / 3.5L V6', 3.5, 5.0, false, false, false, false, true, true, 'M1-110', 92)
ON CONFLICT DO NOTHING;

-- GMC Canyon older (2004-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('GMC', 'Canyon', 2004, 2012, 'Truck', 'gas', '2.8L I4 / 3.5L I5 / 3.7L I5', 3.5, 5.0, false, true, true, true, false, true, 'PF47', 98)
ON CONFLICT DO NOTHING;

-- Chevrolet Avalanche (2002-2013)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Avalanche', 2002, 2013, 'Truck', 'gas', '5.3L V8 / 6.0L V8', 5.3, 6.0, false, true, true, true, false, true, 'PF63', 26)
ON CONFLICT DO NOTHING;

-- Dodge Ram 1500 older (1994-2001)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Ram 1500', 1994, 2001, 'Truck', 'gas', '3.9L V6 / 5.2L V8 / 5.9L V8', 5.9, 6.0, false, true, true, true, false, true, 'M1-110', 84)
ON CONFLICT DO NOTHING;

-- Dodge Dakota (1997-2011)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Dodge', 'Dakota', 1997, 2011, 'Truck', 'gas', '3.7L V6 / 4.7L V8', 4.7, 5.0, false, true, true, true, false, true, 'M1-110', 83)
ON CONFLICT DO NOTHING;

-- Subaru Impreza older (1993-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Subaru', 'Impreza', 1993, 2019, 'Sedan', 'gas', '1.8L H4 / 2.0L H4 / 2.5L H4', 2.0, 4.5, false, true, false, false, false, true, 'M1-110', 111)
ON CONFLICT DO NOTHING;

-- Subaru Crosstrek older (2013-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Subaru', 'Crosstrek', 2013, 2019, 'SUV', 'gas', '2.0L H4', 2.0, 4.5, false, true, false, false, false, true, 'M1-110', 106)
ON CONFLICT DO NOTHING;

-- Subaru Ascent older is newer model, skip

-- Hyundai Tucson older (2005-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Tucson', 2005, 2019, 'SUV', 'gas', '2.0L I4 / 2.4L I4 / 2.0T I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 123)
ON CONFLICT DO NOTHING;

-- Hyundai Santa Fe older (2001-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Hyundai', 'Santa Fe', 2001, 2019, 'SUV', 'gas', '2.4L I4 / 3.5L V6 / 3.3L V6', 3.5, 5.0, false, false, false, false, true, true, 'M1-110', 122)
ON CONFLICT DO NOTHING;

-- Volkswagen Golf GTI older (1995-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Volkswagen', 'Golf GTI', 1995, 2019, 'Sedan', 'gas', '1.8T I4 / 2.0T I4', 2.0, 5.0, true, false, false, false, false, true, 'M1-110', 116)
ON CONFLICT DO NOTHING;

-- Audi A4 older (1996-2019)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Audi', 'A4', 1996, 2019, 'Sedan', 'gas', '1.8T I4 / 2.0T I4 / 3.0L V6', 2.0, 5.5, true, false, false, false, false, true, 'M1-110', 155)
ON CONFLICT DO NOTHING;

-- Honda Civic hybrid older (2003-2015)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Honda', 'Civic Hybrid', 2003, 2015, 'Sedan', 'hybrid', '1.3L I4 Hybrid / 1.5L I4 Hybrid', 1.5, 3.5, true, false, false, false, true, true, 'M1-110', 59)
ON CONFLICT DO NOTHING;

-- Toyota 4Runner older (1990-2002)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', '4Runner', 1990, 2002, 'SUV', 'gas', '2.4L I4 / 3.0L V6 / 3.4L V6', 3.4, 6.0, false, true, true, true, false, true, 'M1-110', 42)
ON CONFLICT DO NOTHING;

-- Ford Explorer older already added above (1995-2010)

-- Chevrolet Colorado older (2004-2012)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Chevrolet', 'Colorado', 2004, 2012, 'Truck', 'gas', '2.8L I4 / 3.5L I5 / 3.7L I5', 3.5, 5.0, false, true, true, true, false, true, 'PF47', 13)
ON CONFLICT DO NOTHING;

-- Toyota Sienna (1998-2020)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Toyota', 'Sienna', 1998, 2020, 'SUV', 'gas', '3.0L V6 / 3.5L V6', 3.5, 6.0, false, false, false, false, true, true, 'M1-110', 54)
ON CONFLICT DO NOTHING;

-- Ford Edge older (2007-2018)
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES ('Ford', 'Edge', 2007, 2018, 'SUV', 'gas', '3.5L V6 / 2.0L EcoBoost I4', 3.5, 6.0, false, false, false, false, true, true, 'FL820S', 8)
ON CONFLICT DO NOTHING;

-- Now update the oil price alert
UPDATE oil_price_alerts SET percentage = 0, message = 'Oil prices are on a rapid and steady incline due to global supply impacts. Current prices are always changing — call for today''s pricing.', direction = 'up' WHERE active = true;
