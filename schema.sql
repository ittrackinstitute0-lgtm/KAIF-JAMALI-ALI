-- =========================================================================
-- KAIF JAMALI SPORTS - SUPABASE DATABASE SCHEMA
-- Project Ref: jrhbmalutelykmzceywi
-- Run this in your Supabase Dashboard: SQL Editor -> New query -> Run
-- =========================================================================

-- 1. Create Products Table
CREATE TABLE IF NOT EXISTS public.products (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC NOT NULL,
    original_price NUMERIC,
    image_url TEXT,
    description TEXT,
    stock INTEGER DEFAULT 10,
    rating NUMERIC DEFAULT 4.8,
    reviews_count INTEGER DEFAULT 20,
    badge TEXT DEFAULT 'NEW',
    is_featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Create Orders Table
CREATE TABLE IF NOT EXISTS public.orders (
    id TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    customer_phone TEXT,
    shipping_address TEXT NOT NULL,
    city TEXT,
    postal_code TEXT,
    items JSONB NOT NULL,
    subtotal NUMERIC NOT NULL,
    shipping NUMERIC DEFAULT 0,
    total NUMERIC NOT NULL,
    payment_method TEXT DEFAULT 'Cash on Delivery',
    status TEXT DEFAULT 'Pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Create Contact Messages Table
CREATE TABLE IF NOT EXISTS public.messages (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    subject TEXT,
    message TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- =========================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- Enabling public read and write access for anon key usage
-- =========================================================================

-- Enable RLS
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any
DROP POLICY IF EXISTS "Public can view products" ON public.products;
DROP POLICY IF EXISTS "Public can insert products" ON public.products;
DROP POLICY IF EXISTS "Public can update products" ON public.products;
DROP POLICY IF EXISTS "Public can delete products" ON public.products;

DROP POLICY IF EXISTS "Public can view orders" ON public.orders;
DROP POLICY IF EXISTS "Public can insert orders" ON public.orders;
DROP POLICY IF EXISTS "Public can update orders" ON public.orders;

DROP POLICY IF EXISTS "Public can view messages" ON public.messages;
DROP POLICY IF EXISTS "Public can insert messages" ON public.messages;

-- Products Policies
CREATE POLICY "Public can view products" ON public.products FOR SELECT USING (true);
CREATE POLICY "Public can insert products" ON public.products FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update products" ON public.products FOR UPDATE USING (true);
CREATE POLICY "Public can delete products" ON public.products FOR DELETE USING (true);

-- Orders Policies
CREATE POLICY "Public can view orders" ON public.orders FOR SELECT USING (true);
CREATE POLICY "Public can insert orders" ON public.orders FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update orders" ON public.orders FOR UPDATE USING (true);

-- Messages Policies
CREATE POLICY "Public can view messages" ON public.messages FOR SELECT USING (true);
CREATE POLICY "Public can insert messages" ON public.messages FOR INSERT WITH CHECK (true);

-- =========================================================================
-- INITIAL SEED DATA (SPORTS PRODUCTS)
-- =========================================================================

INSERT INTO public.products (id, name, category, price, original_price, image_url, description, stock, rating, reviews_count, badge, is_featured)
VALUES
('kj-101', 'Pro Edition English Willow Cricket Bat', 'Cricket', 249.99, 329.99, 'https://images.unsplash.com/photo-1531415074868-036b1c5dd535?auto=format&fit=crop&w=800&q=80', 'Handcrafted from grade 1 English Willow, featuring massive edges, exceptional balance, and supreme pickup for aggressive power hitting.', 12, 4.9, 84, 'BESTSELLER', true),

('kj-102', 'Elite Match Size-5 Thermo Soccer Ball', 'Football', 49.99, 69.99, 'https://images.unsplash.com/photo-1614632537423-1e6c2e7e0aab?auto=format&fit=crop&w=800&q=80', 'FIFA Quality Pro certified match ball. Seamless thermally-bonded surface for predictable trajectory, optimal touch, and water resistance.', 25, 4.8, 62, 'HOT', true),

('kj-103', 'Pro Grip Composite Leather Basketball', 'Basketball', 39.99, 54.99, 'https://images.unsplash.com/photo-1519861531473-9200262188bf?auto=format&fit=crop&w=800&q=80', 'Microfiber composite cover with deep pebble channels for superior control indoors and out. Official size 7 regulation ball.', 18, 4.9, 45, 'NEW', true),

('kj-104', 'Carbon Fiber Aero Badminton Racket Set', 'Badminton', 79.99, 99.99, 'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?auto=format&fit=crop&w=800&q=80', 'High-modulus carbon graphite frame, ultra-lightweight 4U (82g), pre-strung with high-tension nanotech strings. Includes 2 rackets and thermal bag.', 15, 4.7, 38, 'POPULAR', true),

('kj-105', 'Adjustable Quick-Select Dumbbell Set 40kg', 'Fitness', 189.99, 249.99, 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=800&q=80', 'Rapid dial weight adjustment from 5kg to 40kg per dumbbell. Heavy-duty cast iron plates with knurled ergonomic steel grip handles.', 8, 5.0, 96, 'TOP RATED', true),

('kj-106', 'Pro Leather Sparring Boxing Gloves 14oz', 'Boxing', 59.99, 79.99, 'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?auto=format&fit=crop&w=800&q=80', 'Genuine cowhide leather with multi-layered high-density shock absorbing gel foam. Extended wrist support strap for maximum safety.', 14, 4.9, 53, 'SALE 25% OFF', true),

('kj-107', 'Tournament Pro Tennis Racket (300g)', 'Tennis', 139.99, 179.99, 'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0?auto=format&fit=crop&w=800&q=80', 'Spin-optimized 100 sq inch head with graphite-kinetic dampening system. Designed for intermediate to tournament level players.', 9, 4.8, 29, 'TRENDING', false),

('kj-108', 'Performance Speed & Cushion Running Shoes', 'Athletics', 119.99, 149.99, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80', 'Engineered breathable mesh upper with responsive carbon-plate energy return midsole. Durable rubber traction outsole.', 20, 4.9, 112, 'BESTSELLER', true),

('kj-109', 'Heavy-Duty 5-Band Resistance Workout Set', 'Fitness', 29.99, 39.99, 'https://images.unsplash.com/photo-1598289431512-b97b0917affc?auto=format&fit=crop&w=800&q=80', '100% natural latex stackable bands up to 150 lbs resistance. Includes cushioned handles, ankle straps, door anchor, and carry pouch.', 35, 4.6, 74, 'VALUE PACK', false),

('kj-110', 'Club Pro 4-Piece Leather Cricket Balls (Pack of 6)', 'Cricket', 44.99, 59.99, 'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?auto=format&fit=crop&w=800&q=80', 'Hand-stitched premium alum-tanned leather with cork core. Built for 50-over match durability and sharp seam bowling performance.', 22, 4.8, 31, 'POPULAR', false),

('kj-111', 'Pro Goalkeeper Gloves with Finger Spines', 'Football', 45.99, 59.99, 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?auto=format&fit=crop&w=800&q=80', '4mm German contact latex palm for all-weather grip. Removable ergonomic finger spines to prevent hyperextension.', 16, 4.7, 41, 'NEW', false),

('kj-112', 'Heavy Duty Steel Basketball Rim & Chain Net', 'Basketball', 34.99, 49.99, 'https://images.unsplash.com/photo-1546519638-68e109498ffc?auto=format&fit=crop&w=800&q=80', 'Solid 5/8-inch solid steel breakaway rim with dual spring flex action and rust-proof zinc galvanized zinc chain net.', 11, 4.7, 28, 'HOT', false)
ON CONFLICT (id) DO NOTHING;
