-- Schema and basic SQL operations for food-service (food_db)

-- 1. Create foods table
CREATE TABLE IF NOT EXISTS foods (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Insert sample food items
INSERT INTO foods (name, description, price, is_available)
VALUES 
    ('Cheeseburger', 'Juicy beef patty with cheddar cheese, lettuce, and tomato', 9.99, TRUE),
    ('Margherita Pizza', 'Classic pizza with fresh mozzarella, basil, and tomato sauce', 12.50, TRUE),
    ('French Fries', 'Crispy golden fries', 3.99, TRUE);

-- 3. Select all available foods
SELECT * FROM foods WHERE is_available = TRUE;

-- 4. Update food price and timestamp
UPDATE foods 
SET price = 10.99, updated_at = NOW() 
WHERE name = 'Cheeseburger';

-- 5. Delete a food item
DELETE FROM foods 
WHERE name = 'French Fries';
