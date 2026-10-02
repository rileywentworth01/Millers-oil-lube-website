/*
# Seed vehicle data — Ford, Chevrolet, RAM, Dodge, Jeep, Toyota, Honda, Nissan

1. Data
- Seeds vehicles table with popular makes/models covering SUVs, sedans, and trucks.
- Each entry includes engine specs, oil capacity (quarts), synthetic recommendation, rear diff service availability, and oil filter.
- Covers gas, diesel, hybrid, and electric engine types.

2. Security
- No schema changes — data only.
*/

INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, oil_capacity_quarts, synthetic_recommended, rear_diff_service, oil_filter, sort_order) VALUES
('Ford', 'F-150', 2015, 2024, 'Truck', 'gas', '3.5L EcoBoost V6 / 5.0L V8', 6.0, true, true, 'FL-820S', 1),
('Ford', 'F-150', 2015, 2024, 'Truck', 'diesel', '3.0L Power Stroke V6', 6.0, true, true, 'FL-2051', 2),
('Ford', 'F-250 Super Duty', 2017, 2024, 'Truck', 'gas', '6.2L V8 / 7.3L V8', 7.0, true, true, 'FL-820S', 3),
('Ford', 'F-250 Super Duty', 2017, 2024, 'Truck', 'diesel', '6.7L Power Stroke V8', 13.0, true, true, 'FL-2051', 4),
('Ford', 'Explorer', 2018, 2024, 'SUV', 'gas', '2.3L EcoBoost I4 / 3.0L V6', 6.0, true, true, 'FL-2011', 5),
('Ford', 'Escape', 2020, 2024, 'SUV', 'gas', '1.5L EcoBoost I4 / 2.0L EcoBoost I4', 5.0, true, false, 'FL-2011', 6),
('Ford', 'Edge', 2017, 2024, 'SUV', 'gas', '2.0L EcoBoost I4 / 2.7L V6', 5.0, true, false, 'FL-2011', 7),
('Ford', 'Ranger', 2019, 2024, 'Truck', 'gas', '2.3L EcoBoost I4', 6.0, true, true, 'FL-2011', 8),
('Ford', 'Expedition', 2018, 2024, 'SUV', 'gas', '3.5L EcoBoost V6', 7.0, true, true, 'FL-820S', 9),
('Ford', 'Mustang', 2018, 2024, 'Sedan', 'gas', '2.3L EcoBoost I4 / 5.0L V8', 5.0, true, false, 'FL-820S', 10),
('Ford', 'Fusion', 2017, 2020, 'Sedan', 'gas', '1.5L EcoBoost I4 / 2.0L EcoBoost I4', 5.0, true, false, 'FL-2011', 11),
('Ford', 'Bronco', 2021, 2024, 'SUV', 'gas', '2.3L EcoBoost I4 / 2.7L V6', 6.0, true, true, 'FL-2011', 12),
('Chevrolet', 'Silverado 1500', 2019, 2024, 'Truck', 'gas', '2.7L Turbo I4 / 5.3L V8 / 6.2L V8', 8.0, true, true, 'PF63', 13),
('Chevrolet', 'Silverado 1500', 2019, 2024, 'Truck', 'diesel', '3.0L Duramax I6', 8.0, true, true, 'PF63', 14),
('Chevrolet', 'Silverado 2500HD', 2020, 2024, 'Truck', 'gas', '6.6L V8', 8.0, true, true, 'PF63', 15),
('Chevrolet', 'Silverado 2500HD', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 10.0, true, true, 'PF63', 16),
('Chevrolet', 'Equinox', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4', 4.0, true, false, 'PF64', 17),
('Chevrolet', 'Tahoe', 2021, 2024, 'SUV', 'gas', '5.3L V8 / 6.2L V8', 8.0, true, true, 'PF63', 18),
('Chevrolet', 'Suburban', 2021, 2024, 'SUV', 'gas', '5.3L V8 / 6.2L V8', 8.0, true, true, 'PF63', 19),
('Chevrolet', 'Traverse', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 5.0, true, false, 'PF64', 20),
('Chevrolet', 'Malibu', 2018, 2024, 'Sedan', 'gas', '1.5L Turbo I4', 4.0, true, false, 'PF64', 21),
('Chevrolet', 'Camaro', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 6.2L V8', 5.0, true, false, 'PF63', 22),
('Chevrolet', 'Colorado', 2017, 2024, 'Truck', 'gas', '2.5L I4 / 3.6L V6', 5.0, true, true, 'PF64', 23),
('Chevrolet', 'Colorado', 2017, 2024, 'Truck', 'diesel', '2.8L Duramax I4', 6.0, true, true, 'PF64', 24),
('RAM', '1500', 2019, 2024, 'Truck', 'gas', '3.6L V6 / 5.7L HEMI V8', 7.0, true, true, 'Mopar 6835', 25),
('RAM', '1500', 2019, 2024, 'Truck', 'diesel', '3.0L EcoDiesel V6', 8.0, true, true, 'Mopar 6835', 26),
('RAM', '2500', 2019, 2024, 'Truck', 'gas', '6.4L HEMI V8', 7.0, true, true, 'Mopar 6835', 27),
('RAM', '2500', 2019, 2024, 'Truck', 'diesel', '6.7L Cummins I6', 12.0, true, true, 'Mopar 6835', 28),
('Dodge', 'Durango', 2018, 2024, 'SUV', 'gas', '3.6L V6 / 5.7L HEMI V8', 7.0, true, true, 'Mopar 6835', 29),
('Dodge', 'Charger', 2019, 2024, 'Sedan', 'gas', '3.6L V6 / 5.7L V8 / 6.4L V8', 7.0, true, false, 'Mopar 6835', 30),
('Dodge', 'Challenger', 2019, 2024, 'Sedan', 'gas', '3.6L V6 / 5.7L V8 / 6.2L Supercharged V8', 7.0, true, false, 'Mopar 6835', 31),
('Jeep', 'Grand Cherokee', 2021, 2024, 'SUV', 'gas', '3.6L V6 / 5.7L V8', 7.0, true, true, 'Mopar 6835', 32),
('Jeep', 'Wrangler', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 5.0, true, true, 'Mopar 6835', 33),
('Jeep', 'Wrangler', 2020, 2024, 'SUV', 'diesel', '3.0L EcoDiesel V6', 8.0, true, true, 'Mopar 6835', 34),
('Jeep', 'Cherokee', 2019, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.2L V6', 5.0, true, false, 'Mopar 6835', 35),
('Jeep', 'Compass', 2018, 2024, 'SUV', 'gas', '2.4L I4', 5.0, true, false, 'Mopar 6835', 36),
('Toyota', 'Camry', 2018, 2024, 'Sedan', 'gas', '2.5L I4 / 3.5L V6', 5.0, true, false, 'TOY-909', 37),
('Toyota', 'Corolla', 2020, 2024, 'Sedan', 'gas', '1.8L I4 / 2.0L I4', 4.0, true, false, 'TOY-909', 38),
('Toyota', 'RAV4', 2019, 2024, 'SUV', 'gas', '2.5L I4', 5.0, true, false, 'TOY-909', 39),
('Toyota', 'RAV4', 2019, 2024, 'SUV', 'hybrid', '2.5L Hybrid I4', 5.0, true, false, 'TOY-909', 40),
('Toyota', 'Highlander', 2020, 2024, 'SUV', 'gas', '3.5L V6', 6.0, true, false, 'TOY-909', 41),
('Toyota', '4Runner', 2018, 2024, 'SUV', 'gas', '4.0L V6', 6.0, true, true, 'TOY-909', 42),
('Toyota', 'Tacoma', 2016, 2024, 'Truck', 'gas', '2.7L I4 / 3.5L V6', 6.0, true, true, 'TOY-909', 43),
('Toyota', 'Tundra', 2018, 2024, 'Truck', 'gas', '5.7L V8', 8.0, true, true, 'TOY-909', 44),
('Toyota', 'Tundra', 2022, 2024, 'Truck', 'hybrid', '3.5L Twin Turbo V6 Hybrid', 8.0, true, true, 'TOY-909', 45),
('Toyota', 'Avalon', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 6.0, true, false, 'TOY-909', 46),
('Toyota', 'Sequoia', 2020, 2024, 'SUV', 'gas', '5.7L V8', 7.0, true, true, 'TOY-909', 47),
('Honda', 'Civic', 2017, 2024, 'Sedan', 'gas', '1.5L Turbo I4 / 2.0L I4', 4.0, true, false, 'HON-15400', 48),
('Honda', 'Accord', 2018, 2024, 'Sedan', 'gas', '1.5L Turbo I4 / 2.0L Turbo I4', 4.0, true, false, 'HON-15400', 49),
('Honda', 'CR-V', 2017, 2024, 'SUV', 'gas', '1.5L Turbo I4', 4.0, true, false, 'HON-15400', 50),
('Honda', 'Pilot', 2019, 2024, 'SUV', 'gas', '3.5L V6', 5.0, true, false, 'HON-15400', 51),
('Honda', 'HR-V', 2019, 2024, 'SUV', 'gas', '1.8L I4', 4.0, true, false, 'HON-15400', 52),
('Honda', 'Passport', 2019, 2024, 'SUV', 'gas', '3.5L V6', 5.0, true, true, 'HON-15400', 53),
('Honda', 'Ridgeline', 2017, 2024, 'Truck', 'gas', '3.5L V6', 5.0, true, true, 'HON-15400', 54),
('Honda', 'Odyssey', 2018, 2024, 'SUV', 'gas', '3.5L V6', 5.0, true, false, 'HON-15400', 55),
('Nissan', 'Altima', 2019, 2024, 'Sedan', 'gas', '2.5L I4 / 2.0L Turbo I4', 5.0, true, false, 'NIS-15208', 56),
('Nissan', 'Sentra', 2020, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.0L I4', 4.0, true, false, 'NIS-15208', 57),
('Nissan', 'Rogue', 2021, 2024, 'SUV', 'gas', '1.5L Turbo I4', 5.0, true, false, 'NIS-15208', 58),
('Nissan', 'Pathfinder', 2022, 2024, 'SUV', 'gas', '3.5L V6', 5.0, true, true, 'NIS-15208', 59),
('Nissan', 'Frontier', 2022, 2024, 'Truck', 'gas', '3.8L V6', 5.0, true, true, 'NIS-15208', 60),
('Nissan', 'Titan', 2017, 2024, 'Truck', 'gas', '5.6L V8', 7.0, true, true, 'NIS-15208', 61),
('Nissan', 'Murano', 2019, 2024, 'SUV', 'gas', '3.5L V6', 5.0, true, false, 'NIS-15208', 62)
ON CONFLICT DO NOTHING;
