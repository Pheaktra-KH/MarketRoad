-- Enable UUID extension if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create shops table
CREATE TABLE IF NOT EXISTS shops (
    shop_id SERIAL PRIMARY KEY,
    shop_code VARCHAR(50) UNIQUE NOT NULL,
    shop_name VARCHAR(255) NOT NULL,
    shop_slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    tagline VARCHAR(255),
    shop_type VARCHAR(50) NOT NULL,
    owner_name VARCHAR(100),
    business_name VARCHAR(255),
    contact_email VARCHAR(255),
    contact_phone VARCHAR(50),
    address_line1 VARCHAR(500),
    village_group VARCHAR(100),
    commune VARCHAR(100),
    district VARCHAR(100),
    city_province VARCHAR(100),
    country VARCHAR(100) DEFAULT 'Cambodia',
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6),
    shop_logo VARCHAR(500),
    theme_color VARCHAR(7) DEFAULT '#000000',
    rating_average DECIMAL(3, 2) DEFAULT 0.00,
    review_count INTEGER DEFAULT 0,
    status VARCHAR(20) DEFAULT 'pending',
    verified BOOLEAN DEFAULT FALSE,
    payment_methods JSONB,
    delivery_methods JSONB,
    view_count INTEGER DEFAULT 0,
    meta_title VARCHAR(255),
    membership_level VARCHAR(20) DEFAULT 'basic',
    badges JSONB,
    bot VARCHAR(100),
    channel VARCHAR(100),
    shop_group VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    parent_id INTEGER REFERENCES categories(category_id),
    category_name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    type VARCHAR(20) DEFAULT 'product',
    icon VARCHAR(50),
    image_url VARCHAR(500),
    sort_order INTEGER DEFAULT 0,
    level INTEGER DEFAULT 1,
    is_featured BOOLEAN DEFAULT FALSE,
    status VARCHAR(20) DEFAULT 'active',
    meta_title VARCHAR(255),
    meta_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    shop_id INTEGER NOT NULL REFERENCES shops(shop_id) ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES categories(category_id),
    product_code VARCHAR(100) UNIQUE NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    short_description VARCHAR(500),
    brand VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    discount_price DECIMAL(10, 2),
    currency VARCHAR(3) DEFAULT 'USD',
    stock_qty INTEGER DEFAULT 0,
    unit VARCHAR(50),
    weight DECIMAL(8, 3),
    status VARCHAR(20) DEFAULT 'draft',
    label VARCHAR(100),
    tags JSONB,
    search_keywords TEXT,
    rating_avg DECIMAL(3, 2) DEFAULT 0.00,
    rating_count INTEGER DEFAULT 0,
    views INTEGER DEFAULT 0,
    favorites INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create product_images table
CREATE TABLE IF NOT EXISTS product_images (
    image_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    is_main BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create product_variants table
CREATE TABLE IF NOT EXISTS product_variants (
    variant_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    variant_name VARCHAR(255) NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_qty INTEGER DEFAULT 0,
    attributes JSONB,
    is_default BOOLEAN DEFAULT FALSE,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create product_tags table
CREATE TABLE IF NOT EXISTS product_tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create product_tag_map table
CREATE TABLE IF NOT EXISTS product_tag_map (
    map_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    tag_id INTEGER NOT NULL REFERENCES product_tags(tag_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(product_id, tag_id)
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_shops_status ON shops(status);
CREATE INDEX IF NOT EXISTS idx_shops_verified ON shops(verified);
CREATE INDEX IF NOT EXISTS idx_shops_location ON shops(city_province, district, commune);
CREATE INDEX IF NOT EXISTS idx_products_shop ON products(shop_id);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_status ON products(status);
CREATE INDEX IF NOT EXISTS idx_categories_parent ON categories(parent_id);
CREATE INDEX IF NOT EXISTS idx_categories_level ON categories(level);
CREATE INDEX IF NOT EXISTS idx_product_images_product ON product_images(product_id);
CREATE INDEX IF NOT EXISTS idx_product_variants_product ON product_variants(product_id);
CREATE INDEX IF NOT EXISTS idx_product_tag_map_product ON product_tag_map(product_id);
CREATE INDEX IF NOT EXISTS idx_product_tag_map_tag ON product_tag_map(tag_id);

-- Insert sample categories
INSERT INTO categories (category_name, slug, description, level, sort_order) VALUES
('Food & Beverages', 'food-beverages', 'Food and drink products', 1, 1),
('Electronics', 'electronics', 'Electronic devices and accessories', 1, 2),
('Fashion', 'fashion', 'Clothing and accessories', 1, 3)
ON CONFLICT (slug) DO NOTHING;
