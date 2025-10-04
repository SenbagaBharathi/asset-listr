-- Create properties table
CREATE TABLE public.properties (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  property_id TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('Apartment', 'Villa', 'Plot')),
  location TEXT NOT NULL,
  area NUMERIC NOT NULL,
  price NUMERIC NOT NULL,
  bedrooms INTEGER,
  amenities TEXT[],
  owner_contact TEXT NOT NULL,
  description TEXT,
  images TEXT[],
  agent_id UUID NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE public.properties ENABLE ROW LEVEL SECURITY;

-- Allow agents to view all properties
CREATE POLICY "Agents can view all properties"
ON public.properties
FOR SELECT
USING (true);

-- Allow agents to create their own properties
CREATE POLICY "Agents can create their own properties"
ON public.properties
FOR INSERT
WITH CHECK (auth.uid() = agent_id);

-- Allow agents to update their own properties
CREATE POLICY "Agents can update their own properties"
ON public.properties
FOR UPDATE
USING (auth.uid() = agent_id);

-- Allow agents to delete their own properties
CREATE POLICY "Agents can delete their own properties"
ON public.properties
FOR DELETE
USING (auth.uid() = agent_id);

-- Create updated_at trigger function if it doesn't exist
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for automatic timestamp updates
CREATE TRIGGER update_properties_updated_at
BEFORE UPDATE ON public.properties
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at_column();