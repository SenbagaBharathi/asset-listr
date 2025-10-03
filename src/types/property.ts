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
