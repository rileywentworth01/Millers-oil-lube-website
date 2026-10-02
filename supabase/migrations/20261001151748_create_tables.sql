/*
# Create oil_products and vehicles tables for Miller's Oil Lube and Express

1. New Tables
- `oil_products`: Stores oil brand, product line, viscosity grade, price per quart, and category (synthetic/conventional/blend/diesel).
- `vehicles`: Stores vehicle make, model, year range, body type, engine type, oil capacity in quarts, synthetic recommendation, rear differential service availability, and engine specs.

2. Security
- Both tables are single-tenant (no auth) — public read access for the website lookup tool.
- RLS enabled on both tables with anon+authenticated SELECT-only policies.
- No write policies needed — data is managed by the shop owner via migrations.

3. Important Notes
- Oil product pricing is seeded from the shop owner's provided price list.
- Vehicle data includes popular SUVs, sedans, and trucks (gas and diesel) with matching motor specs.
*/

CREATE TABLE IF NOT EXISTS oil_products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  brand text NOT NULL,
  product_line text NOT NULL,
  viscosity text NOT NULL,
  price numeric(10,2) NOT NULL,
  category text NOT NULL DEFAULT 'synthetic',
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE oil_products ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_read_oil_products" ON oil_products;
CREATE POLICY "anon_read_oil_products" ON oil_products FOR SELECT
  TO anon, authenticated USING (true);

CREATE TABLE IF NOT EXISTS vehicles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  make text NOT NULL,
  model text NOT NULL,
  year_start integer,
  year_end integer,
  body_type text NOT NULL,
  engine_type text NOT NULL DEFAULT 'gas',
  engine_specs text,
  oil_capacity_quarts numeric(4,1) NOT NULL,
  synthetic_recommended boolean NOT NULL DEFAULT false,
  rear_diff_service boolean NOT NULL DEFAULT false,
  oil_filter text,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE vehicles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_read_vehicles" ON vehicles;
CREATE POLICY "anon_read_vehicles" ON vehicles FOR SELECT
  TO anon, authenticated USING (true);
