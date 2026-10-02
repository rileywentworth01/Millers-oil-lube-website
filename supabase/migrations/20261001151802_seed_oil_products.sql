/*
# Seed oil product pricing data

1. Data
- Seeds oil_products table with the shop owner's provided price list.
- Products: Mobil 1 ($9-$11), Serv Pro ($8), Valvoline ($3-$5), Rotella ($5.50-$8), Mobil Delvac ($5.50-$8).
- Categories: synthetic, blend, conventional, diesel.

2. Security
- No schema changes — data only.
*/

INSERT INTO oil_products (brand, product_line, viscosity, price, category, sort_order) VALUES
('Mobil 1', 'Advanced Full Synthetic', '0W-8', 10.00, 'synthetic', 1),
('Mobil 1', 'Advanced Full Synthetic', '0W-16', 10.00, 'synthetic', 2),
('Mobil 1', 'Advanced Full Synthetic', '0W-40 Euro', 10.00, 'synthetic', 3),
('Mobil 1', 'Advanced Full Synthetic', '10W-30', 10.00, 'synthetic', 4),
('Mobil 1', 'Advanced Full Synthetic', '5W-30 ESP', 10.00, 'synthetic', 5),
('Mobil 1', 'Advanced Full Synthetic', '0W-20 Dexos', 10.00, 'synthetic', 6),
('Mobil 1', 'Super Car', '0W-40', 11.00, 'synthetic', 7),
('Mobil 1', 'Extended Performance', '0W-20', 9.00, 'synthetic', 8),
('Mobil 1', 'Extended Performance', '5W-20', 9.00, 'synthetic', 9),
('Mobil 1', 'Extended Performance', '5W-30', 9.00, 'synthetic', 10),
('Serv Pro', 'Synthetic Blend', '5W-40', 8.00, 'blend', 11),
('Valvoline', 'Max Life High Mileage', 'Various', 5.00, 'blend', 12),
('Valvoline', 'Conventional', 'Various', 3.00, 'conventional', 13),
('Rotella', 'T-6 Full Synthetic', '5W-40', 8.00, 'diesel', 14),
('Rotella', 'T-4 Synthetic Blend', '15W-40', 5.50, 'diesel', 15),
('Mobil', 'Delvac', '15W-40', 5.50, 'diesel', 16),
('Mobil', 'Delvac Extreme', '5W-40', 8.00, 'diesel', 17)
ON CONFLICT DO NOTHING;
