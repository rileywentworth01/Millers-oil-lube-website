/*
# Seed vehicle data — GMC, Subaru, Hyundai, Kia, Volkswagen, Lexus, Mazda, BMW, Mercedes-Benz, Audi, Tesla

1. Data
- Continues seeding vehicles table with remaining popular makes/models.
- Covers SUVs, sedans, and trucks with gas, diesel, hybrid, and electric engine types.

2. Security
- No schema changes — data only.
*/

INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, oil_capacity_quarts, synthetic_recommended, rear_diff_service, oil_filter, sort_order) VALUES
('GMC', 'Sierra 1500', 2019, 2024, 'Truck', 'gas', '2.7L Turbo I4 / 5.3L V8 / 6.2L V8', 8.0, true, true, 'PF63', 63),
('GMC', 'Sierra 1500', 2019, 2024, 'Truck', 'diesel', '3.0L Duramax I6', 8.0, true, true, 'PF63', 64),
('GMC', 'Sierra 2500HD', 2020, 2024, 'Truck', 'gas', '6.6L V8', 8.0, true, true, 'PF63', 65),
('GMC', 'Sierra 2500HD', 2020, 2024, 'Truck', 'diesel', '6.6L Duramax V8', 10.0, true, true, 'PF63', 66),
('GMC', 'Yukon', 2021, 2024, 'SUV', 'gas', '5.3L V8 / 6.2L V8', 8.0, true, true, 'PF63', 67),
('GMC', 'Terrain', 2018, 2024, 'SUV', 'gas', '1.5L Turbo I4 / 2.0L Turbo I4', 5.0, true, false, 'PF64', 68),
('GMC', 'Canyon', 2017, 2024, 'Truck', 'gas', '2.5L I4 / 3.6L V6', 5.0, true, true, 'PF64', 69),
('GMC', 'Acadia', 2020, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 5.0, true, false, 'PF64', 70),
('Subaru', 'Outback', 2020, 2024, 'SUV', 'gas', '2.5L I4 / 2.4L Turbo I4', 5.0, true, true, 'SUB-15208', 71),
('Subaru', 'Forester', 2019, 2024, 'SUV', 'gas', '2.5L I4', 5.0, true, true, 'SUB-15208', 72),
('Subaru', 'Crosstrek', 2021, 2024, 'SUV', 'gas', '2.0L I4 / 2.5L I4', 5.0, true, true, 'SUB-15208', 73),
('Subaru', 'Legacy', 2020, 2024, 'Sedan', 'gas', '2.5L I4 / 2.4L Turbo I4', 5.0, true, true, 'SUB-15208', 74),
('Subaru', 'Impreza', 2017, 2024, 'Sedan', 'gas', '2.0L I4', 4.0, true, true, 'SUB-15208', 75),
('Subaru', 'Ascent', 2019, 2024, 'SUV', 'gas', '2.4L Turbo I4', 5.0, true, true, 'SUB-15208', 76),
('Hyundai', 'Elantra', 2021, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.0L I4', 4.0, true, false, 'HYU-26320', 77),
('Hyundai', 'Sonata', 2020, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.5L I4', 5.0, true, false, 'HYU-26320', 78),
('Hyundai', 'Tucson', 2022, 2024, 'SUV', 'gas', '2.5L I4', 5.0, true, false, 'HYU-26320', 79),
('Hyundai', 'Santa Fe', 2019, 2024, 'SUV', 'gas', '2.4L I4 / 2.5L Turbo I4', 5.0, true, false, 'HYU-26320', 80),
('Hyundai', 'Palisade', 2020, 2024, 'SUV', 'gas', '3.8L V6', 6.0, true, false, 'HYU-26320', 81),
('Kia', 'Forte', 2019, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.0L I4', 4.0, true, false, 'KIA-26320', 82),
('Kia', 'K5', 2021, 2024, 'Sedan', 'gas', '1.6L Turbo I4 / 2.5L Turbo I4', 5.0, true, false, 'KIA-26320', 83),
('Kia', 'Sportage', 2023, 2024, 'SUV', 'gas', '1.6L Turbo I4 / 2.5L I4', 5.0, true, false, 'KIA-26320', 84),
('Kia', 'Sorento', 2021, 2024, 'SUV', 'gas', '2.5L I4 / 2.5L Turbo I4', 6.0, true, false, 'KIA-26320', 85),
('Kia', 'Telluride', 2020, 2024, 'SUV', 'gas', '3.8L V6', 6.0, true, false, 'KIA-26320', 86),
('Volkswagen', 'Jetta', 2019, 2024, 'Sedan', 'gas', '1.4L Turbo I4 / 1.5L Turbo I4', 5.0, true, false, 'VW-03L', 87),
('Volkswagen', 'Passat', 2020, 2022, 'Sedan', 'gas', '2.0L Turbo I4', 5.0, true, false, 'VW-03L', 88),
('Volkswagen', 'Tiguan', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4', 5.0, true, false, 'VW-03L', 89),
('Volkswagen', 'Atlas', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.6L V6', 6.0, true, false, 'VW-03L', 90),
('Volkswagen', 'Golf GTI', 2018, 2021, 'Sedan', 'gas', '2.0L Turbo I4', 5.0, true, false, 'VW-03L', 91),
('Lexus', 'ES 350', 2019, 2024, 'Sedan', 'gas', '3.5L V6', 6.0, true, false, 'LEX-909', 92),
('Lexus', 'IS 300', 2018, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.5L V6', 6.0, true, false, 'LEX-909', 93),
('Lexus', 'RX 350', 2020, 2024, 'SUV', 'gas', '2.4L Turbo I4 / 3.5L V6', 5.0, true, false, 'LEX-909', 94),
('Lexus', 'GX 460', 2020, 2024, 'SUV', 'gas', '4.6L V8', 7.0, true, true, 'LEX-909', 95),
('Lexus', 'NX 300', 2020, 2024, 'SUV', 'gas', '2.0L Turbo I4', 5.0, true, false, 'LEX-909', 96),
('Mazda', 'Mazda3', 2019, 2024, 'Sedan', 'gas', '2.0L I4 / 2.5L I4', 5.0, true, false, 'MAZ-PE01', 97),
('Mazda', 'Mazda6', 2018, 2024, 'Sedan', 'gas', '2.5L I4 / 2.5L Turbo I4', 5.0, true, false, 'MAZ-PE01', 98),
('Mazda', 'CX-5', 2017, 2024, 'SUV', 'gas', '2.5L I4 / 2.5L Turbo I4', 5.0, true, false, 'MAZ-PE01', 99),
('Mazda', 'CX-9', 2018, 2024, 'SUV', 'gas', '2.5L Turbo I4', 5.0, true, false, 'MAZ-PE01', 100),
('Mazda', 'CX-30', 2020, 2024, 'SUV', 'gas', '2.5L I4', 5.0, true, false, 'MAZ-PE01', 101),
('BMW', '3 Series', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 6.0, true, false, 'BMW-1142', 102),
('BMW', '5 Series', 2018, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 6.0, true, false, 'BMW-1142', 103),
('BMW', 'X3', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 6.0, true, true, 'BMW-1142', 104),
('BMW', 'X5', 2019, 2024, 'SUV', 'gas', '3.0L Turbo I6 / 4.4L V8', 7.0, true, true, 'BMW-1142', 105),
('BMW', 'X5', 2019, 2024, 'SUV', 'diesel', '3.0L Turbo Diesel I6', 7.0, true, true, 'BMW-1142', 106),
('Mercedes-Benz', 'C-Class', 2019, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 6.0, true, false, 'MB-A271', 107),
('Mercedes-Benz', 'E-Class', 2018, 2024, 'Sedan', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 6.0, true, false, 'MB-A271', 108),
('Mercedes-Benz', 'GLE', 2020, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo I6', 7.0, true, true, 'MB-A271', 109),
('Mercedes-Benz', 'GLS', 2020, 2024, 'SUV', 'gas', '3.0L Turbo I6 / 4.0L V8', 8.0, true, true, 'MB-A271', 110),
('Mercedes-Benz', 'Sprinter', 2019, 2024, 'Truck', 'diesel', '2.0L Turbo I4 / 3.0L Turbo V6', 9.0, true, true, 'MB-A271', 111),
('Audi', 'A4', 2020, 2024, 'Sedan', 'gas', '2.0L Turbo I4', 5.0, true, false, 'AUD-06L', 112),
('Audi', 'Q5', 2018, 2024, 'SUV', 'gas', '2.0L Turbo I4 / 3.0L Turbo V6', 6.0, true, true, 'AUD-06L', 113),
('Audi', 'Q7', 2020, 2024, 'SUV', 'gas', '3.0L Turbo V6', 7.0, true, true, 'AUD-06L', 114),
('Audi', 'Q8', 2019, 2024, 'SUV', 'gas', '3.0L Turbo V6 / 4.0L V8', 7.0, true, true, 'AUD-06L', 115),
('Tesla', 'Model 3', 2018, 2024, 'Sedan', 'electric', 'Electric Motor', 0.0, false, false, 'N/A', 116),
('Tesla', 'Model Y', 2020, 2024, 'SUV', 'electric', 'Electric Motor', 0.0, false, false, 'N/A', 117)
ON CONFLICT DO NOTHING;
