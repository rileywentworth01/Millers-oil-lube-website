import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export interface OilProduct {
  id: string;
  brand: string;
  product_line: string;
  viscosity: string;
  price: number;
  category: string;
  sort_order: number;
}

export interface Vehicle {
  id: string;
  make: string;
  model: string;
  year_start: number | null;
  year_end: number | null;
  body_type: string;
  engine_type: string;
  engine_specs: string | null;
  engine_liters: number | null;
  oil_capacity_quarts: number;
  synthetic_recommended: boolean;
  rear_diff_service: boolean;
  front_diff_service: boolean;
  transfer_case_service: boolean;
  transaxle_service: boolean;
  serviceable: boolean;
  oil_filter: string | null;
  sort_order: number;
}

export interface WiperBlade {
  id: string;
  brand: string;
  tier: string;
  size_range: string;
  size_inches_min: number;
  size_inches_max: number;
  price: number;
  sort_order: number;
}

export interface OilPriceAlert {
  id: string;
  direction: string;
  percentage: number;
  message: string;
  active: boolean;
  created_at: string;
}
