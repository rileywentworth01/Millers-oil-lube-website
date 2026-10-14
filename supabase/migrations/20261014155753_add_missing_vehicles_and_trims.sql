/*
# Add Missing Vehicle Models and Trims

## Purpose
Add vehicles reported as missing: Honda Accord Crosstour, Subaru trims (Limited,
Premium, Wilderness, etc.), and expand trim coverage for existing models.
Also add missing models across multiple makes.

## New Vehicles Added
- Honda Accord Crosstour (2010-2015) with EX-L and Touring trims, 3.5L V6
- Honda Accord trims for 1998-2012 era (LX, EX, EX-V6)
- Honda CR-V trims for 1997-2016 era (LX, EX, EX-L)
- Honda Odyssey trims (EX, EX-L, Touring, Elite)
- Honda Pilot trims (LX, EX, EX-L for older generations)
- Honda Ridgeline trims (RTL, Black Edition)
- Honda Civic trims for 1996-2015 era (LX, EX, Si)
- Subaru Outback trims (Limited, Premium, Wilderness, Touring)
- Subaru Forester trims (Limited, Premium, Wilderness, Touring)
- Subaru Crosstrek trims (Limited, Premium, Wilderness)
- Subaru Impreza trims (Limited, Sport, WRX, WRX STI)
- Subaru Legacy trims (Limited, Premium, Sport)
- Subaru Ascent trims (Limited, Premium, Touring)
- Subaru WRX (separate model) with Premium, Limited, STI trims
- Subaru BRZ with Premium, Limited trims
- Toyota Avalon trims (XLE, Limited, Touring)
- Toyota Corolla trims (LE, SE, XLE)
- Toyota Camry trims (LE, XLE, SE for older generations)
- Nissan Maxima trims (SV, SL, SR, Platinum)
- Nissan Pathfinder trims (S, SV, SL, Platinum)
- Nissan Frontier trims (S, SV, PRO-4X)
- Ford Edge trims (SEL, Titanium, ST)
- Ford Escape trims (S, SE, SEL, Titanium)
- Ford Explorer trims (XLT already exists; add Base for 2018-2024)
- Hyundai Tucson trims (SEL, Limited, N Line)
- Hyundai Santa Fe trims (SEL, Limited, Calligraphy)
- Kia Sportage trims (LX, EX, SX)
- Kia Seltos trims (LX, S, EX, SX)
- Mazda CX-5 trims (Touring, Carbon Edition, Signature)
- Mazda3 trims (Select, Premium, Turbo)
- Volkswagen Jetta trims (SE, SEL, R-Line)
- Volkswagen Tiguan trims (SE, SEL, R-Line)
- Audi Q5 trims (Premium, Premium Plus, Prestige)
- BMW 3 Series trims (330i, 330e, M340i)
- Mercedes-Benz C-Class trims (C300, AMG C43)

## Safety
- No RLS changes. No destructive operations. Uses INSERT ... ON CONFLICT DO NOTHING.
*/

-- === HONDA ACCORD CROSSTOUR ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Accord Crosstour', 'EX-L', 2010, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 58),
('Honda', 'Accord Crosstour', 'EX-L 4WD', 2010, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 59),
('Honda', 'Accord Crosstour', 'Touring', 2010, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 60),
('Honda', 'Accord Crosstour', 'Touring 4WD', 2010, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 61)
ON CONFLICT DO NOTHING;

-- === HONDA ACCORD 1998-2012 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Accord', 'LX', 1998, 2002, 'Sedan', 'gas', '2.3L I4', 2.3, 4.5, false, false, false, false, true, true, 'M1-110', 57),
('Honda', 'Accord', 'EX', 1998, 2002, 'Sedan', 'gas', '2.3L I4 / 3.0L V6', 2.3, 4.5, false, false, false, false, true, true, 'M1-110', 58),
('Honda', 'Accord', 'EX V6', 1998, 2002, 'Sedan', 'gas', '3.0L V6', 3.0, 4.5, false, false, false, false, true, true, 'M1-110', 59),
('Honda', 'Accord', 'LX', 2003, 2007, 'Sedan', 'gas', '2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 60),
('Honda', 'Accord', 'EX', 2003, 2007, 'Sedan', 'gas', '2.4L I4 / 3.0L V6', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 61),
('Honda', 'Accord', 'EX V6', 2003, 2007, 'Sedan', 'gas', '3.0L V6', 3.0, 4.5, false, false, false, false, true, true, 'M1-110', 62),
('Honda', 'Accord', 'LX', 2008, 2012, 'Sedan', 'gas', '2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 63),
('Honda', 'Accord', 'EX', 2008, 2012, 'Sedan', 'gas', '2.4L I4 / 3.5L V6', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 64),
('Honda', 'Accord', 'EX-L', 2008, 2012, 'Sedan', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 65),
('Honda', 'Accord', 'LX', 2013, 2017, 'Sedan', 'gas', '2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 66),
('Honda', 'Accord', 'EX', 2013, 2017, 'Sedan', 'gas', '2.4L I4 / 3.5L V6', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 67),
('Honda', 'Accord', 'EX-L', 2013, 2017, 'Sedan', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 68),
('Honda', 'Accord', 'Touring', 2013, 2017, 'Sedan', 'gas', '3.5L V6', 3.5, 4.5, false, false, false, false, true, true, 'M1-110', 69),
('Honda', 'Accord', 'Sport', 2013, 2017, 'Sedan', 'gas', '2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 70)
ON CONFLICT DO NOTHING;

-- === HONDA CR-V 1997-2016 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'CR-V', 'LX', 1997, 2001, 'SUV', 'gas', '2.0L I4', 2.0, 4.0, false, true, true, true, true, true, 'M1-110', 71),
('Honda', 'CR-V', 'EX', 1997, 2001, 'SUV', 'gas', '2.0L I4', 2.0, 4.0, false, true, true, true, true, true, 'M1-110', 72),
('Honda', 'CR-V', 'LX', 2002, 2006, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 73),
('Honda', 'CR-V', 'EX', 2002, 2006, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 74),
('Honda', 'CR-V', 'LX', 2007, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 75),
('Honda', 'CR-V', 'EX', 2007, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 76),
('Honda', 'CR-V', 'EX-L', 2007, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 77),
('Honda', 'CR-V', 'LX', 2012, 2016, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 78),
('Honda', 'CR-V', 'EX', 2012, 2016, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 79),
('Honda', 'CR-V', 'EX-L', 2012, 2016, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 80)
ON CONFLICT DO NOTHING;

-- === HONDA CIVIC 1996-2015 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Civic', 'LX', 1996, 2000, 'Sedan', 'gas', '1.6L I4', 1.6, 3.5, false, false, false, false, true, true, 'M1-110', 59),
('Honda', 'Civic', 'EX', 1996, 2000, 'Sedan', 'gas', '1.6L I4', 1.6, 3.5, false, false, false, false, true, true, 'M1-110', 60),
('Honda', 'Civic', 'Si', 1999, 2000, 'Sedan', 'gas', '1.6L I4', 1.6, 3.5, false, false, false, false, true, true, 'M1-110', 61),
('Honda', 'Civic', 'LX', 2001, 2005, 'Sedan', 'gas', '1.7L I4', 1.7, 3.5, false, false, false, false, true, true, 'M1-110', 62),
('Honda', 'Civic', 'EX', 2001, 2005, 'Sedan', 'gas', '1.7L I4', 1.7, 3.5, false, false, false, false, true, true, 'M1-110', 63),
('Honda', 'Civic', 'Si', 2002, 2005, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, false, false, false, false, true, true, 'M1-110', 64),
('Honda', 'Civic', 'LX', 2006, 2011, 'Sedan', 'gas', '1.8L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 65),
('Honda', 'Civic', 'EX', 2006, 2011, 'Sedan', 'gas', '1.8L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 66),
('Honda', 'Civic', 'Si', 2006, 2011, 'Sedan', 'gas', '2.0L I4', 2.0, 4.5, false, false, false, false, true, true, 'M1-110', 67),
('Honda', 'Civic', 'LX', 2012, 2015, 'Sedan', 'gas', '1.8L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 68),
('Honda', 'Civic', 'EX', 2012, 2015, 'Sedan', 'gas', '1.8L I4', 1.8, 4.0, false, false, false, false, true, true, 'M1-110', 69),
('Honda', 'Civic', 'Si', 2012, 2015, 'Sedan', 'gas', '2.4L I4', 2.4, 4.5, false, false, false, false, true, true, 'M1-110', 70)
ON CONFLICT DO NOTHING;

-- === HONDA ODYSSEY TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Odyssey', 'EX', 2018, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, false, false, false, false, true, true, 'HON-15400', 81),
('Honda', 'Odyssey', 'EX-L', 2018, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, false, false, false, false, true, true, 'HON-15400', 82),
('Honda', 'Odyssey', 'Touring', 2018, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, false, false, false, false, true, true, 'HON-15400', 83),
('Honda', 'Odyssey', 'Elite', 2018, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, false, false, false, true, true, 'HON-15400', 84)
ON CONFLICT DO NOTHING;

-- === HONDA PILOT OLDER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Pilot', 'LX', 2003, 2008, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 85),
('Honda', 'Pilot', 'EX', 2003, 2008, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 86),
('Honda', 'Pilot', 'EX-L', 2003, 2008, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 87),
('Honda', 'Pilot', 'LX', 2009, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 88),
('Honda', 'Pilot', 'EX', 2009, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 89),
('Honda', 'Pilot', 'EX-L', 2009, 2015, 'SUV', 'gas', '3.5L V6', 3.5, 4.5, false, true, true, true, true, true, 'M1-110', 90)
ON CONFLICT DO NOTHING;

-- === HONDA RIDGELINE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Ridgeline', 'RTL', 2017, 2024, 'Truck', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 91),
('Honda', 'Ridgeline', 'Black Edition', 2017, 2024, 'Truck', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 92)
ON CONFLICT DO NOTHING;

-- === SUBARU OUTBACK TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Outback', 'Premium', 2020, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 100),
('Subaru', 'Outback', 'Limited', 2020, 2024, 'SUV', 'gas', '2.5L I4 / 2.4L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 101),
('Subaru', 'Outback', 'Touring', 2020, 2024, 'SUV', 'gas', '2.5L I4 / 2.4L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 102),
('Subaru', 'Outback', 'Wilderness', 2022, 2024, 'SUV', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 103),
('Subaru', 'Outback', 'Premium', 2015, 2019, 'SUV', 'gas', '2.5L I4 / 3.6L H6', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 104),
('Subaru', 'Outback', 'Limited', 2015, 2019, 'SUV', 'gas', '2.5L I4 / 3.6L H6', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 105),
('Subaru', 'Outback', 'Touring', 2015, 2019, 'SUV', 'gas', '2.5L I4 / 3.6L H6', 3.6, 5.0, true, true, true, true, false, true, 'SOA-517', 106),
('Subaru', 'Outback', '3.6R', 2015, 2019, 'SUV', 'gas', '3.6L H6', 3.6, 5.0, true, true, true, true, false, true, 'SOA-517', 107)
ON CONFLICT DO NOTHING;

-- === SUBARU FORESTER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Forester', 'Premium', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 108),
('Subaru', 'Forester', 'Limited', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 109),
('Subaru', 'Forester', 'Touring', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 110),
('Subaru', 'Forester', 'Wilderness', 2022, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 111),
('Subaru', 'Forester', 'Sport', 2019, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 112),
('Subaru', 'Forester', 'Premium', 2014, 2018, 'SUV', 'gas', '2.5L I4 / 2.0L Turbo H4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 113),
('Subaru', 'Forester', 'Limited', 2014, 2018, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 114),
('Subaru', 'Forester', 'Touring', 2014, 2018, 'SUV', 'gas', '2.5L I4 / 2.0L Turbo H4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 115)
ON CONFLICT DO NOTHING;

-- === SUBARU CROSSTREK TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Crosstrek', 'Premium', 2021, 2024, 'SUV', 'gas', '2.0L I4 / 2.5L I4', 2.0, 5.0, true, true, true, true, false, true, 'SOA-517', 116),
('Subaru', 'Crosstrek', 'Limited', 2021, 2024, 'SUV', 'gas', '2.0L I4 / 2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 117),
('Subaru', 'Crosstrek', 'Wilderness', 2024, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 118),
('Subaru', 'Crosstrek', 'Sport', 2021, 2023, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 119),
('Subaru', 'Crosstrek', 'Premium', 2013, 2019, 'SUV', 'gas', '2.0L H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 120),
('Subaru', 'Crosstrek', 'Limited', 2013, 2019, 'SUV', 'gas', '2.0L H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 121),
('Subaru', 'Crosstrek', 'Hybrid', 2014, 2016, 'SUV', 'hybrid', '2.0L I4 Hybrid', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 122)
ON CONFLICT DO NOTHING;

-- === SUBARU IMPREZA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Impreza', 'Premium', 2017, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, true, true, true, true, false, true, 'SOA-517', 123),
('Subaru', 'Impreza', 'Limited', 2017, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, true, true, true, true, false, true, 'SOA-517', 124),
('Subaru', 'Impreza', 'Sport', 2017, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.0, true, true, true, true, false, true, 'SOA-517', 125),
('Subaru', 'Impreza', 'Premium', 2012, 2016, 'Sedan', 'gas', '2.0L H4 / 2.5L H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 126),
('Subaru', 'Impreza', 'Limited', 2012, 2016, 'Sedan', 'gas', '2.0L H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 127),
('Subaru', 'Impreza', 'Sport', 2012, 2016, 'Sedan', 'gas', '2.0L H4 / 2.5L H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 128),
('Subaru', 'Impreza', 'WRX', 2002, 2014, 'Sedan', 'gas', '2.0L Turbo H4', 2.0, 4.5, true, true, true, true, false, true, 'SOA-517', 129),
('Subaru', 'Impreza', 'WRX STI', 2004, 2014, 'Sedan', 'gas', '2.5L Turbo H4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 130)
ON CONFLICT DO NOTHING;

-- === SUBARU WRX (SEPARATE MODEL) ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'WRX', 'Premium', 2015, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 2.4L Turbo I4', 2.0, 5.0, true, true, true, true, false, true, 'SOA-517', 131),
('Subaru', 'WRX', 'Limited', 2015, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 2.4L Turbo I4', 2.0, 5.0, true, true, true, true, false, true, 'SOA-517', 132),
('Subaru', 'WRX', 'STI', 2015, 2021, 'Sedan', 'gas', '2.5L Turbo H4', 2.5, 5.5, true, true, true, true, false, true, 'SOA-517', 133),
('Subaru', 'WRX', 'Base', 2015, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 2.4L Turbo I4', 2.0, 5.0, true, true, true, true, false, true, 'SOA-517', 134)
ON CONFLICT DO NOTHING;

-- === SUBARU LEGACY TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Legacy', 'Premium', 2020, 2024, 'Sedan', 'gas', '2.5L I4 / 2.4L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 135),
('Subaru', 'Legacy', 'Limited', 2020, 2024, 'Sedan', 'gas', '2.5L I4 / 2.4L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 136),
('Subaru', 'Legacy', 'Sport', 2020, 2024, 'Sedan', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 137),
('Subaru', 'Legacy', 'Touring', 2020, 2024, 'Sedan', 'gas', '2.5L I4 / 2.4L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 138),
('Subaru', 'Legacy', 'Premium', 2015, 2019, 'Sedan', 'gas', '2.5L I4 / 3.6L H6', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 139),
('Subaru', 'Legacy', 'Limited', 2015, 2019, 'Sedan', 'gas', '2.5L I4 / 3.6L H6', 2.5, 5.0, true, true, true, true, false, true, 'SOA-517', 140)
ON CONFLICT DO NOTHING;

-- === SUBARU ASCENT TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'Ascent', 'Premium', 2019, 2024, 'SUV', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 141),
('Subaru', 'Ascent', 'Limited', 2019, 2024, 'SUV', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 142),
('Subaru', 'Ascent', 'Touring', 2019, 2024, 'SUV', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 143),
('Subaru', 'Ascent', 'Onyx Edition', 2023, 2024, 'SUV', 'gas', '2.4L Turbo I4', 2.4, 5.0, true, true, true, true, false, true, 'SOA-517', 144)
ON CONFLICT DO NOTHING;

-- === SUBARU BRZ ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Subaru', 'BRZ', 'Premium', 2013, 2020, 'Sedan', 'gas', '2.0L H4', 2.0, 5.0, true, false, false, false, true, true, 'SOA-517', 145),
('Subaru', 'BRZ', 'Limited', 2013, 2020, 'Sedan', 'gas', '2.0L H4', 2.0, 5.0, true, false, false, false, true, true, 'SOA-517', 146),
('Subaru', 'BRZ', 'Premium', 2022, 2024, 'Sedan', 'gas', '2.4L I4', 2.4, 5.0, true, false, false, false, true, true, 'SOA-517', 147),
('Subaru', 'BRZ', 'Limited', 2022, 2024, 'Sedan', 'gas', '2.4L I4', 2.4, 5.0, true, false, false, false, true, true, 'SOA-517', 148)
ON CONFLICT DO NOTHING;

-- === TOYOTA AVALON TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Toyota', 'Avalon', 'XLE', 2019, 2024, 'Sedan', 'gas', '3.5L V6 / 2.5L Hybrid I4', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 43),
('Toyota', 'Avalon', 'Limited', 2019, 2024, 'Sedan', 'gas', '3.5L V6 / 2.5L Hybrid I4', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 44),
('Toyota', 'Avalon', 'Touring', 2019, 2024, 'Sedan', 'gas', '3.5L V6 / 2.5L Hybrid I4', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 45),
('Toyota', 'Avalon', 'XLE', 2013, 2018, 'Sedan', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 46),
('Toyota', 'Avalon', 'Limited', 2013, 2018, 'Sedan', 'gas', '3.5L V6', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 47)
ON CONFLICT DO NOTHING;

-- === TOYOTA COROLLA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Toyota', 'Corolla', 'LE', 2014, 2019, 'Sedan', 'gas', '1.8L I4', 1.8, 4.4, false, false, false, false, true, true, 'M1-108', 51),
('Toyota', 'Corolla', 'SE', 2014, 2019, 'Sedan', 'gas', '1.8L I4 / 2.0L I4', 1.8, 4.4, false, false, false, false, true, true, 'M1-108', 52),
('Toyota', 'Corolla', 'XLE', 2014, 2019, 'Sedan', 'gas', '1.8L I4', 1.8, 4.4, false, false, false, false, true, true, 'M1-108', 53),
('Toyota', 'Corolla', 'LE', 2020, 2024, 'Sedan', 'gas', '1.8L I4 / 2.0L I4', 1.8, 4.4, true, false, false, false, true, true, 'M1-108', 54),
('Toyota', 'Corolla', 'XLE', 2020, 2024, 'Sedan', 'gas', '2.0L I4', 2.0, 4.4, true, false, false, false, true, true, 'M1-108', 55),
('Toyota', 'Corolla', 'Apex', 2021, 2022, 'Sedan', 'gas', '2.0L I4', 2.0, 4.4, true, false, false, false, true, true, 'M1-108', 56)
ON CONFLICT DO NOTHING;

-- === TOYOTA CAMRY OLDER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Toyota', 'Camry', 'LE', 2012, 2017, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 5.0, false, false, false, false, true, true, 'M1-108', 57),
('Toyota', 'Camry', 'SE', 2012, 2017, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 5.0, false, false, false, false, true, true, 'M1-108', 58),
('Toyota', 'Camry', 'XLE', 2012, 2017, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 5.0, false, false, false, false, true, true, 'M1-108', 59),
('Toyota', 'Camry', 'LE', 2018, 2024, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 2.5, 4.8, true, false, false, false, true, true, 'M1-108', 60),
('Toyota', 'Camry', 'XLE', 2018, 2024, 'Sedan', 'gas', '3.5L V6 / 2.5L Hybrid I4', 3.5, 6.0, true, false, false, false, true, true, 'M1-108', 61)
ON CONFLICT DO NOTHING;

-- === TOYOTA SIENNA ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Toyota', 'Sienna', 'LE', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 62),
('Toyota', 'Sienna', 'XLE', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 63),
('Toyota', 'Sienna', 'Limited', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 64),
('Toyota', 'Sienna', 'Base', 2011, 2020, 'SUV', 'gas', '3.5L V6', 3.5, 6.0, false, false, false, false, true, true, 'M1-108', 65)
ON CONFLICT DO NOTHING;

-- === TOYOTA VENZA ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Toyota', 'Venza', 'LE', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 66),
('Toyota', 'Venza', 'XLE', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 67),
('Toyota', 'Venza', 'Limited', 2021, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-108', 68)
ON CONFLICT DO NOTHING;

-- === NISSAN MAXIMA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Nissan', 'Maxima', 'SV', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 5.0, true, false, false, false, true, true, 'M1-110', 70),
('Nissan', 'Maxima', 'SL', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 5.0, true, false, false, false, true, true, 'M1-110', 71),
('Nissan', 'Maxima', 'SR', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 5.0, true, false, false, false, true, true, 'M1-110', 72),
('Nissan', 'Maxima', 'Platinum', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 5.0, true, false, false, false, true, true, 'M1-110', 73)
ON CONFLICT DO NOTHING;

-- === NISSAN PATHFINDER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Nissan', 'Pathfinder', 'S', 2021, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'M1-110', 74),
('Nissan', 'Pathfinder', 'SV', 2021, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'M1-110', 75),
('Nissan', 'Pathfinder', 'SL', 2021, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'M1-110', 76),
('Nissan', 'Pathfinder', 'Platinum', 2021, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'M1-110', 77),
('Nissan', 'Pathfinder', 'Rock Creek', 2023, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'M1-110', 78)
ON CONFLICT DO NOTHING;

-- === NISSAN FRONTIER TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Nissan', 'Frontier', 'S', 2022, 2024, 'Truck', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 79),
('Nissan', 'Frontier', 'SV', 2022, 2024, 'Truck', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 80),
('Nissan', 'Frontier', 'PRO-4X', 2022, 2024, 'Truck', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 81),
('Nissan', 'Frontier', 'PRO-X', 2022, 2024, 'Truck', 'gas', '3.8L V6', 3.8, 6.0, true, true, true, true, false, true, 'M1-110', 82)
ON CONFLICT DO NOTHING;

-- === FORD EDGE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Ford', 'Edge', 'SEL', 2017, 2024, 'SUV', 'gas', '2.0L EcoBoost I4', 2.0, 5.5, true, false, false, false, true, true, 'FL-2011', 18),
('Ford', 'Edge', 'Titanium', 2017, 2024, 'SUV', 'gas', '2.0L EcoBoost I4 / 2.7L V6', 2.0, 5.5, true, false, false, false, true, true, 'FL-2011', 19),
('Ford', 'Edge', 'ST', 2019, 2024, 'SUV', 'gas', '2.7L EcoBoost V6', 2.7, 6.0, true, true, true, true, false, true, 'FL-2011', 20)
ON CONFLICT DO NOTHING;

-- === FORD ESCAPE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Ford', 'Escape', 'S', 2020, 2024, 'SUV', 'gas', '1.5L EcoBoost I4', 1.5, 4.5, true, false, false, false, true, true, 'FL-2011', 21),
('Ford', 'Escape', 'SE', 2020, 2024, 'SUV', 'gas', '1.5L EcoBoost I4 / 2.0L EcoBoost I4', 2.0, 5.0, true, false, false, false, true, true, 'FL-2011', 22),
('Ford', 'Escape', 'SEL', 2020, 2024, 'SUV', 'gas', '2.0L EcoBoost I4 / 2.5L Hybrid I4', 2.0, 5.0, true, false, false, false, true, true, 'FL-2011', 23),
('Ford', 'Escape', 'Titanium', 2020, 2024, 'SUV', 'gas', '2.0L EcoBoost I4 / 2.5L Hybrid I4', 2.0, 5.0, true, false, false, false, true, true, 'FL-2011', 24)
ON CONFLICT DO NOTHING;

-- === HYUNDAI TUCSON TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Hyundai', 'Tucson', 'SEL', 2022, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 73),
('Hyundai', 'Tucson', 'Limited', 2022, 2024, 'SUV', 'gas', '2.5L I4 / 1.6L Turbo Hybrid I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 74),
('Hyundai', 'Tucson', 'N Line', 2022, 2024, 'SUV', 'gas', '2.5L Turbo I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 75),
('Hyundai', 'Tucson', 'Blue', 2022, 2024, 'SUV', 'hybrid', '1.6L Turbo Hybrid I4', 1.6, 4.5, true, true, true, true, false, true, 'M1-110', 76)
ON CONFLICT DO NOTHING;

-- === HYUNDAI SANTA FE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Hyundai', 'Santa Fe', 'SEL', 2020, 2024, 'SUV', 'gas', '2.5L I4 / 1.6L Turbo Hybrid I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 77),
('Hyundai', 'Santa Fe', 'Limited', 2020, 2024, 'SUV', 'gas', '2.5L Turbo I4 / 1.6L Turbo Hybrid I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 78),
('Hyundai', 'Santa Fe', 'Calligraphy', 2021, 2024, 'SUV', 'gas', '2.5L Turbo I4 / 1.6L Turbo Hybrid I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 79)
ON CONFLICT DO NOTHING;

-- === KIA SPORTAGE TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Kia', 'Sportage', 'LX', 2023, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 75),
('Kia', 'Sportage', 'EX', 2023, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 76),
('Kia', 'Sportage', 'SX', 2023, 2024, 'SUV', 'gas', '2.5L I4 / 1.6L Turbo Hybrid I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 77),
('Kia', 'Sportage', 'X-Line', 2023, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 5.0, true, true, true, true, false, true, 'M1-110', 78)
ON CONFLICT DO NOTHING;

-- === KIA SELTOS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Kia', 'Seltos', 'LX', 2021, 2024, 'SUV', 'gas', '2.0L I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 79),
('Kia', 'Seltos', 'S', 2021, 2024, 'SUV', 'gas', '2.0L I4', 2.0, 4.5, true, false, false, false, true, true, 'M1-110', 80),
('Kia', 'Seltos', 'EX', 2021, 2024, 'SUV', 'gas', '2.0L I4 / 1.6L Turbo I4', 2.0, 4.5, true, true, true, true, false, true, 'M1-110', 81),
('Kia', 'Seltos', 'SX', 2021, 2024, 'SUV', 'gas', '1.6L Turbo I4', 1.6, 4.5, true, true, true, true, false, true, 'M1-110', 82)
ON CONFLICT DO NOTHING;

-- === KIA K5 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Kia', 'K5', 'LX', 2021, 2024, 'Sedan', 'gas', '1.6L Turbo I4', 1.6, 4.5, true, false, false, false, true, true, 'M1-110', 83),
('Kia', 'K5', 'GT-Line', 2021, 2024, 'Sedan', 'gas', '1.6L Turbo I4', 1.6, 4.5, true, false, false, false, true, true, 'M1-110', 84),
('Kia', 'K5', 'EX', 2021, 2024, 'Sedan', 'gas', '1.6L Turbo I4', 1.6, 4.5, true, false, false, false, true, true, 'M1-110', 85),
('Kia', 'K5', 'GT', 2021, 2024, 'Sedan', 'gas', '2.5L Turbo I4', 2.5, 5.0, true, false, false, false, true, true, 'M1-110', 86)
ON CONFLICT DO NOTHING;

-- === MAZDA CX-5 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Mazda', 'CX-5', 'Touring', 2017, 2024, 'SUV', 'gas', '2.5L I4 / 2.5L Turbo I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 70),
('Mazda', 'CX-5', 'Carbon Edition', 2021, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 71),
('Mazda', 'CX-5', 'Signature', 2018, 2024, 'SUV', 'gas', '2.5L Turbo I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 72),
('Mazda', 'CX-5', 'Premium', 2017, 2024, 'SUV', 'gas', '2.5L I4 / 2.5L Turbo I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 73),
('Mazda', 'CX-5', 'Select', 2017, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 74)
ON CONFLICT DO NOTHING;

-- === MAZDA3 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Mazda', '3', 'Select', 2019, 2024, 'Sedan', 'gas', '2.5L I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-110', 75),
('Mazda', '3', 'Premium', 2019, 2024, 'Sedan', 'gas', '2.5L I4 / 2.5L Turbo I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-110', 76),
('Mazda', '3', 'Turbo', 2019, 2024, 'Sedan', 'gas', '2.5L Turbo I4', 2.5, 4.8, true, false, false, false, true, true, 'M1-110', 77)
ON CONFLICT DO NOTHING;

-- === MAZDA CX-30 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Mazda', 'CX-30', 'Select', 2020, 2024, 'SUV', 'gas', '2.5L I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 78),
('Mazda', 'CX-30', 'Premium', 2020, 2024, 'SUV', 'gas', '2.5L I4 / 2.5L Turbo I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 79),
('Mazda', 'CX-30', 'Turbo', 2020, 2024, 'SUV', 'gas', '2.5L Turbo I4', 2.5, 4.8, true, true, true, true, false, true, 'M1-110', 80)
ON CONFLICT DO NOTHING;

-- === VOLKSWAGEN JETTA TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Volkswagen', 'Jetta', 'SE', 2019, 2024, 'Sedan', 'gas', '1.4L Turbo I4 / 1.5L Turbo I4', 1.4, 4.5, true, false, false, false, true, true, 'VW-03L', 65),
('Volkswagen', 'Jetta', 'SEL', 2019, 2024, 'Sedan', 'gas', '1.4L Turbo I4 / 1.5L Turbo I4', 1.4, 4.5, true, false, false, false, true, true, 'VW-03L', 66),
('Volkswagen', 'Jetta', 'R-Line', 2019, 2024, 'Sedan', 'gas', '1.4L Turbo I4 / 1.5L Turbo I4', 1.4, 4.5, true, false, false, false, true, true, 'VW-03L', 67),
('Volkswagen', 'Jetta', 'GLI', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 5.5, true, false, false, false, true, true, 'VW-03L', 68)
ON CONFLICT DO NOTHING;

-- === VOLKSWAGEN TIGUAN TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Volkswagen', 'Tiguan', 'SE', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 5.5, true, true, true, true, false, true, 'VW-03L', 69),
('Volkswagen', 'Tiguan', 'SEL', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 5.5, true, true, true, true, false, true, 'VW-03L', 70),
('Volkswagen', 'Tiguan', 'R-Line', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 5.5, true, true, true, true, false, true, 'VW-03L', 71)
ON CONFLICT DO NOTHING;

-- === VOLKSWAGEN ATLAS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Volkswagen', 'Atlas', 'SE', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 2.0, 5.5, true, true, true, true, false, true, 'VW-03L', 72),
('Volkswagen', 'Atlas', 'SEL', 2018, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 6.5, true, true, true, true, false, true, 'VW-03L', 73),
('Volkswagen', 'Atlas', 'SEL Premium', 2018, 2024, 'SUV', 'gas', '3.6L V6', 3.6, 6.5, true, true, true, true, false, true, 'VW-03L', 74)
ON CONFLICT DO NOTHING;

-- === AUDI Q5 TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Audi', 'Q5', 'Premium', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo V6', 2.0, 6.0, true, true, true, true, false, true, 'AUD-06L', 60),
('Audi', 'Q5', 'Premium Plus', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo V6', 2.0, 6.0, true, true, true, true, false, true, 'AUD-06L', 61),
('Audi', 'Q5', 'Prestige', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo V6', 2.0, 6.0, true, true, true, true, false, true, 'AUD-06L', 62),
('Audi', 'Q5', 'SQ5', 2018, 2024, 'SUV', 'gas', '3.0L Turbo V6', 3.0, 6.5, true, true, true, true, false, true, 'AUD-06L', 63)
ON CONFLICT DO NOTHING;

-- === BMW 3 SERIES TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('BMW', '3 Series', '330i', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4', 2.0, 5.6, true, false, false, false, true, true, 'BMW-02L', 70),
('BMW', '3 Series', '330e', 2020, 2024, 'Sedan', 'hybrid', '2.0L Turbo I4 Hybrid', 2.0, 5.6, true, false, false, false, true, true, 'BMW-02L', 71),
('BMW', '3 Series', 'M340i', 2020, 2024, 'Sedan', 'gas', '3.0L Turbo I6', 3.0, 6.5, true, false, false, false, true, true, 'BMW-02L', 72),
('BMW', '3 Series', 'M3', 2021, 2024, 'Sedan', 'gas', '3.0L Twin-Turbo I6', 3.0, 6.9, true, false, false, false, true, true, 'BMW-02L', 73)
ON CONFLICT DO NOTHING;

-- === BMW X5 ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('BMW', 'X5', 'xDrive40i', 2020, 2024, 'SUV', 'gas', '3.0L Turbo I6', 3.0, 6.5, true, true, true, true, false, true, 'BMW-02L', 74),
('BMW', 'X5', 'xDrive45e', 2020, 2024, 'SUV', 'hybrid', '3.0L Turbo I6 Hybrid', 3.0, 6.5, true, true, true, true, false, true, 'BMW-02L', 75),
('BMW', 'X5', 'M50i', 2020, 2024, 'SUV', 'gas', '4.4L Twin-Turbo V8', 4.4, 7.5, true, true, true, true, false, true, 'BMW-02L', 76)
ON CONFLICT DO NOTHING;

-- === MERCEDES-BENZ C-Class TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Mercedes-Benz', 'C-Class', 'C300', 2022, 2024, 'Sedan', 'gas', '2.0L Turbo I4 Hybrid', 2.0, 6.5, true, false, false, false, true, true, 'MB-001', 70),
('Mercedes-Benz', 'C-Class', 'AMG C43', 2022, 2024, 'Sedan', 'gas', '2.0L Turbo I4 Hybrid', 2.0, 7.0, true, false, false, false, true, true, 'MB-001', 71),
('Mercedes-Benz', 'C-Class', 'C300', 2015, 2021, 'Sedan', 'gas', '2.0L Turbo I4 / 3.0L V6', 2.0, 6.5, true, false, false, false, true, true, 'MB-001', 72),
('Mercedes-Benz', 'C-Class', 'AMG C63', 2015, 2021, 'Sedan', 'gas', '4.0L Twin-Turbo V8', 4.0, 8.5, true, false, false, false, true, true, 'MB-001', 73)
ON CONFLICT DO NOTHING;

-- === MERCEDES-BENZ GLC ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Mercedes-Benz', 'GLC', 'GLC300', 2020, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 6.5, true, true, true, true, false, true, 'MB-001', 74),
('Mercedes-Benz', 'GLC', 'GLC300 4MATIC', 2020, 2024, 'SUV', 'gas', '2.0L Turbo I4', 2.0, 6.5, true, true, true, true, false, true, 'MB-001', 75),
('Mercedes-Benz', 'GLC', 'AMG GLC43', 2020, 2024, 'SUV', 'gas', '3.0L Twin-Turbo V6', 3.0, 7.5, true, true, true, true, false, true, 'MB-001', 76)
ON CONFLICT DO NOTHING;

-- === LEXUS RX TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Lexus', 'RX', 'RX350', 2016, 2024, 'SUV', 'gas', '3.5L V6 / 2.4L Turbo I4', 3.5, 6.4, true, true, true, true, false, true, 'LEX-04L', 60),
('Lexus', 'RX', 'RX350L', 2018, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 6.4, true, true, true, true, false, true, 'LEX-04L', 61),
('Lexus', 'RX', 'RX450h', 2016, 2024, 'SUV', 'hybrid', '3.5L V6 Hybrid', 3.5, 6.4, true, true, true, true, false, true, 'LEX-04L', 62),
('Lexus', 'RX', 'RX500h', 2023, 2024, 'SUV', 'hybrid', '2.4L Turbo I4 Hybrid', 2.4, 6.4, true, true, true, true, false, true, 'LEX-04L', 63)
ON CONFLICT DO NOTHING;

-- === LEXUS ES ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Lexus', 'ES', 'ES350', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 3.5, 6.4, true, false, false, false, true, true, 'LEX-04L', 64),
('Lexus', 'ES', 'ES300h', 2019, 2024, 'Sedan', 'hybrid', '2.5L I4 Hybrid', 2.5, 6.4, true, false, false, false, true, true, 'LEX-04L', 65)
ON CONFLICT DO NOTHING;

-- === HONOTA HR-V TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'HR-V', 'LX', 2019, 2022, 'SUV', 'gas', '1.8L I4', 1.8, 4.0, false, true, true, true, true, true, 'HON-15400', 93),
('Honda', 'HR-V', 'EX', 2019, 2022, 'SUV', 'gas', '1.8L I4', 1.8, 4.0, false, true, true, true, true, true, 'HON-15400', 94),
('Honda', 'HR-V', 'EX-L', 2019, 2022, 'SUV', 'gas', '1.8L I4', 1.8, 4.0, false, true, true, true, true, true, 'HON-15400', 95),
('Honda', 'HR-V', 'LX', 2023, 2024, 'SUV', 'gas', '2.0L I4', 2.0, 4.4, true, true, true, true, true, true, 'HON-15400', 96),
('Honda', 'HR-V', 'EX-L', 2023, 2024, 'SUV', 'gas', '2.0L I4', 2.0, 4.4, true, true, true, true, true, true, 'HON-15400', 97),
('Honda', 'HR-V', 'Sport', 2023, 2024, 'SUV', 'gas', '2.0L I4', 2.0, 4.4, true, true, true, true, true, true, 'HON-15400', 98)
ON CONFLICT DO NOTHING;

-- === HONDA PASSPORT TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Passport', 'EX-L', 2019, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 99),
('Honda', 'Passport', 'Touring', 2019, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 100),
('Honda', 'Passport', 'Elite', 2019, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 101),
('Honda', 'Passport', 'TrailSport', 2022, 2024, 'SUV', 'gas', '3.5L V6', 3.5, 5.0, true, true, true, true, false, true, 'HON-15400', 102)
ON CONFLICT DO NOTHING;

-- === HONDA ELEMENT TRIMS ===
INSERT INTO vehicles (make, model, trim, year_start, year_end, body_type, engine_type, engine_specs, engine_liters, oil_capacity_quarts, synthetic_recommended, rear_diff_service, front_diff_service, transfer_case_service, transaxle_service, serviceable, oil_filter, sort_order)
VALUES
('Honda', 'Element', 'LX', 2003, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 103),
('Honda', 'Element', 'EX', 2003, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 104),
('Honda', 'Element', 'SC', 2007, 2011, 'SUV', 'gas', '2.4L I4', 2.4, 4.5, false, true, true, true, true, true, 'M1-110', 105)
ON CONFLICT DO NOTHING;
