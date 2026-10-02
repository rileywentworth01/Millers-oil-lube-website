/*
# Update vehicles table with new service columns and add wiper_blades + oil_price_alerts tables

1. Modified Tables
- `vehicles`: Added columns:
  - `engine_liters` (numeric) — engine displacement in liters (e.g. 3.5, 6.7)
  - `front_diff_service` (boolean) — whether front differential service is available
  - `transfer_case_service` (boolean) — whether transfer case service is available
  - `transaxle_service` (boolean) — whether transaxle service is available
  - `serviceable` (boolean, default true) — whether the shop can service this vehicle (false for Mini Cooper)

2. New Tables
- `wiper_blades`: Stores wiper blade brand, size range, and price.
  - Bosch Connect (lower end): 18-22" $14, 24" $17, 26" $19, 28" $21
  - Bosch Icon (higher end): 16-20" $28, 22" $30, 24-28" $32
- `oil_price_alerts`: Stores oil price change alerts (direction, percentage, message, active flag).
  Manually updated by the shop owner when prices change.

3. Security
- New tables get RLS with anon+authenticated SELECT policies (public read, no auth app).
- No write policies needed — managed by shop owner via migrations.

4. Important Notes
- Serv Pro oil product removed from oil_products table.
- Mini Cooper vehicles added with serviceable=false.
- Existing vehicles updated with engine_liters, front_diff, transfer_case, transaxle data.
*/

-- Add new columns to vehicles
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS engine_liters numeric(3,1);
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS front_diff_service boolean NOT NULL DEFAULT false;
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS transfer_case_service boolean NOT NULL DEFAULT false;
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS transaxle_service boolean NOT NULL DEFAULT false;
ALTER TABLE vehicles ADD COLUMN IF NOT EXISTS serviceable boolean NOT NULL DEFAULT true;

-- Update existing vehicles with engine liters and drivetrain service flags
-- Ford
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'F-150' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'F-150' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 6.2, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'F-250 Super Duty' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 6.7, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'F-250 Super Duty' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 2.3, transaxle_service = true WHERE make = 'Ford' AND model = 'Explorer' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Ford' AND model = 'Escape' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Ford' AND model = 'Edge' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.3, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'Ranger' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'Expedition' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.3 WHERE make = 'Ford' AND model = 'Mustang' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5 WHERE make = 'Ford' AND model = 'Fusion' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.3, front_diff_service = true, transfer_case_service = true WHERE make = 'Ford' AND model = 'Bronco' AND engine_type = 'gas';

-- Chevrolet
UPDATE vehicles SET engine_liters = 2.7, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Silverado 1500' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Silverado 1500' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 6.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Silverado 2500HD' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 6.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Silverado 2500HD' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Chevrolet' AND model = 'Equinox' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 5.3, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Tahoe' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 5.3, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Suburban' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Chevrolet' AND model = 'Traverse' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Chevrolet' AND model = 'Malibu' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'Chevrolet' AND model = 'Camaro' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Colorado' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.8, front_diff_service = true, transfer_case_service = true WHERE make = 'Chevrolet' AND model = 'Colorado' AND engine_type = 'diesel';

-- RAM/Dodge/Jeep
UPDATE vehicles SET engine_liters = 3.6, front_diff_service = true, transfer_case_service = true WHERE make = 'RAM' AND model = '1500' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'RAM' AND model = '1500' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 6.4, front_diff_service = true, transfer_case_service = true WHERE make = 'RAM' AND model = '2500' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 6.7, front_diff_service = true, transfer_case_service = true WHERE make = 'RAM' AND model = '2500' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 3.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Dodge' AND model = 'Durango' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.6 WHERE make = 'Dodge' AND model = 'Charger' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.6 WHERE make = 'Dodge' AND model = 'Challenger' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Jeep' AND model = 'Grand Cherokee' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Jeep' AND model = 'Wrangler' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Jeep' AND model = 'Wrangler' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Jeep' AND model = 'Cherokee' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.4, transaxle_service = true WHERE make = 'Jeep' AND model = 'Compass' AND engine_type = 'gas';

-- Toyota
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Toyota' AND model = 'Camry' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.8, transaxle_service = true WHERE make = 'Toyota' AND model = 'Corolla' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Toyota' AND model = 'RAV4' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Toyota' AND model = 'RAV4' AND engine_type = 'hybrid';
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Toyota' AND model = 'Highlander' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 4.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Toyota' AND model = '4Runner' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.7, front_diff_service = true, transfer_case_service = true WHERE make = 'Toyota' AND model = 'Tacoma' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 5.7, front_diff_service = true, transfer_case_service = true WHERE make = 'Toyota' AND model = 'Tundra' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Toyota' AND model = 'Tundra' AND engine_type = 'hybrid';
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Toyota' AND model = 'Avalon' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 5.7, front_diff_service = true, transfer_case_service = true WHERE make = 'Toyota' AND model = 'Sequoia' AND engine_type = 'gas';

-- Honda
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Honda' AND model = 'Civic' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Honda' AND model = 'Accord' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Honda' AND model = 'CR-V' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Honda' AND model = 'Pilot' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.8, transaxle_service = true WHERE make = 'Honda' AND model = 'HR-V' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Honda' AND model = 'Passport' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Honda' AND model = 'Ridgeline' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Honda' AND model = 'Odyssey' AND engine_type = 'gas';

-- Nissan
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Nissan' AND model = 'Altima' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Nissan' AND model = 'Sentra' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'Nissan' AND model = 'Rogue' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, front_diff_service = true, transfer_case_service = true WHERE make = 'Nissan' AND model = 'Pathfinder' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.8, front_diff_service = true, transfer_case_service = true WHERE make = 'Nissan' AND model = 'Frontier' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 5.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Nissan' AND model = 'Titan' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Nissan' AND model = 'Murano' AND engine_type = 'gas';

-- GMC
UPDATE vehicles SET engine_liters = 2.7, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Sierra 1500' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Sierra 1500' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 6.6, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Sierra 2500HD' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 6.6, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Sierra 2500HD' AND engine_type = 'diesel';
UPDATE vehicles SET engine_liters = 5.3, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Yukon' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.5, transaxle_service = true WHERE make = 'GMC' AND model = 'Terrain' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, front_diff_service = true, transfer_case_service = true WHERE make = 'GMC' AND model = 'Canyon' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'GMC' AND model = 'Acadia' AND engine_type = 'gas';

-- Subaru (AWD — front diff on all)
UPDATE vehicles SET engine_liters = 2.5, front_diff_service = true WHERE make = 'Subaru' AND model = 'Outback' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, front_diff_service = true WHERE make = 'Subaru' AND model = 'Forester' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true WHERE make = 'Subaru' AND model = 'Crosstrek' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, front_diff_service = true WHERE make = 'Subaru' AND model = 'Legacy' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true WHERE make = 'Subaru' AND model = 'Impreza' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.4, front_diff_service = true WHERE make = 'Subaru' AND model = 'Ascent' AND engine_type = 'gas';

-- Hyundai
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Hyundai' AND model = 'Elantra' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Hyundai' AND model = 'Sonata' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Hyundai' AND model = 'Tucson' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.4, transaxle_service = true WHERE make = 'Hyundai' AND model = 'Santa Fe' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.8, transaxle_service = true WHERE make = 'Hyundai' AND model = 'Palisade' AND engine_type = 'gas';

-- Kia
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Kia' AND model = 'Forte' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Kia' AND model = 'K5' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 1.6, transaxle_service = true WHERE make = 'Kia' AND model = 'Sportage' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Kia' AND model = 'Sorento' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.8, transaxle_service = true WHERE make = 'Kia' AND model = 'Telluride' AND engine_type = 'gas';

-- Volkswagen
UPDATE vehicles SET engine_liters = 1.4, transaxle_service = true WHERE make = 'Volkswagen' AND model = 'Jetta' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Volkswagen' AND model = 'Passat' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Volkswagen' AND model = 'Tiguan' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Volkswagen' AND model = 'Atlas' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'Volkswagen' AND model = 'Golf GTI' AND engine_type = 'gas';

-- Lexus
UPDATE vehicles SET engine_liters = 3.5, transaxle_service = true WHERE make = 'Lexus' AND model = 'ES 350' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Lexus' AND model = 'IS 300' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.4, transaxle_service = true WHERE make = 'Lexus' AND model = 'RX 350' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 4.6, front_diff_service = true, transfer_case_service = true WHERE make = 'Lexus' AND model = 'GX 460' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Lexus' AND model = 'NX 300' AND engine_type = 'gas';

-- Mazda
UPDATE vehicles SET engine_liters = 2.0, transaxle_service = true WHERE make = 'Mazda' AND model = 'Mazda3' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Mazda' AND model = 'Mazda6' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Mazda' AND model = 'CX-5' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Mazda' AND model = 'CX-9' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.5, transaxle_service = true WHERE make = 'Mazda' AND model = 'CX-30' AND engine_type = 'gas';

-- BMW
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'BMW' AND model = '3 Series' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'BMW' AND model = '5 Series' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true, transfer_case_service = true WHERE make = 'BMW' AND model = 'X3' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'BMW' AND model = 'X5' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'BMW' AND model = 'X5' AND engine_type = 'diesel';

-- Mercedes-Benz
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'Mercedes-Benz' AND model = 'C-Class' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'Mercedes-Benz' AND model = 'E-Class' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Mercedes-Benz' AND model = 'GLE' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Mercedes-Benz' AND model = 'GLS' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Mercedes-Benz' AND model = 'Sprinter' AND engine_type = 'diesel';

-- Audi
UPDATE vehicles SET engine_liters = 2.0 WHERE make = 'Audi' AND model = 'A4' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 2.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Audi' AND model = 'Q5' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Audi' AND model = 'Q7' AND engine_type = 'gas';
UPDATE vehicles SET engine_liters = 3.0, front_diff_service = true, transfer_case_service = true WHERE make = 'Audi' AND model = 'Q8' AND engine_type = 'gas';

-- Tesla
UPDATE vehicles SET engine_liters = 0.0 WHERE make = 'Tesla';

-- Remove Serv Pro from oil_products
DELETE FROM oil_products WHERE brand = 'Serv Pro';

-- Add Mini Cooper with serviceable = false
INSERT INTO vehicles (make, model, year_start, year_end, body_type, engine_type, engine_specs, oil_capacity_quarts, synthetic_recommended, rear_diff_service, oil_filter, sort_order, serviceable, engine_liters) VALUES
('MINI', 'Cooper', 2014, 2024, 'Sedan', 'gas', '1.5L Turbo I3 / 2.0L Turbo I4', 4.5, true, false, 'N/A', 200, false, 1.5),
('MINI', 'Cooper S', 2014, 2024, 'Sedan', 'gas', '2.0L Turbo I4', 5.0, true, false, 'N/A', 201, false, 2.0),
('MINI', 'Countryman', 2017, 2024, 'SUV', 'gas', '1.5L Turbo I3 / 2.0L Turbo I4', 5.0, true, false, 'N/A', 202, false, 2.0)
ON CONFLICT DO NOTHING;

-- Create wiper_blades table
CREATE TABLE IF NOT EXISTS wiper_blades (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  brand text NOT NULL,
  tier text NOT NULL,
  size_range text NOT NULL,
  size_inches_min integer NOT NULL,
  size_inches_max integer NOT NULL,
  price numeric(10,2) NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE wiper_blades ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_read_wiper_blades" ON wiper_blades;
CREATE POLICY "anon_read_wiper_blades" ON wiper_blades FOR SELECT
  TO anon, authenticated USING (true);

INSERT INTO wiper_blades (brand, tier, size_range, size_inches_min, size_inches_max, price, sort_order) VALUES
('Bosch Connect', 'Economy', '18" - 22"', 18, 22, 14.00, 1),
('Bosch Connect', 'Economy', '24"', 24, 24, 17.00, 2),
('Bosch Connect', 'Economy', '26"', 26, 26, 19.00, 3),
('Bosch Connect', 'Economy', '28"', 28, 28, 21.00, 4),
('Bosch Icon', 'Premium', '16" - 20"', 16, 20, 28.00, 5),
('Bosch Icon', 'Premium', '22"', 22, 22, 30.00, 6),
('Bosch Icon', 'Premium', '24" - 28"', 24, 28, 32.00, 7)
ON CONFLICT DO NOTHING;

-- Create oil_price_alerts table
CREATE TABLE IF NOT EXISTS oil_price_alerts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  direction text NOT NULL,
  percentage numeric(5,2) NOT NULL,
  message text NOT NULL,
  active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE oil_price_alerts ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_read_oil_price_alerts" ON oil_price_alerts;
CREATE POLICY "anon_read_oil_price_alerts" ON oil_price_alerts FOR SELECT
  TO anon, authenticated USING (true);

INSERT INTO oil_price_alerts (direction, percentage, message, active) VALUES
('up', 8.50, 'Oil prices are rising due to global supply impacts. Current prices may change.', true)
ON CONFLICT DO NOTHING;
