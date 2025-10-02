import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  console.error('Supabase environment variables are missing. Please enable Lovable Cloud.');
  console.error('Expected variables: VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY');
  throw new Error(
    'Lovable Cloud is not enabled. Please enable it from the Cloud tab to use authentication and database features.'
  );
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export type Property = {
  id: string;
  property_id: string;
  title: string;
  type: 'Apartment' | 'Villa' | 'Plot';
  location: string;
  area: number;
  price: number;
  bedrooms?: number;
  amenities?: string[];
  owner_contact: string;
  description?: string;
  images?: string[];
  agent_id: string;
  created_at: string;
  updated_at: string;
};

export type Profile = {
  id: string;
  full_name?: string;
  email?: string;
  phone?: string;
  created_at: string;
  updated_at: string;
};
