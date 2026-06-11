# =========================================================
# 📊 ZOMATO RESTAURANT DATA ANALYSIS - SQL QUERIES
# =========================================================


# =========================================================
# 📌 1. TABLE CREATION
# =========================================================

CREATE TABLE zomato_final (
    restaurant_name TEXT,
    dining_rating DOUBLE,
    delivery_rating DOUBLE,
    dining_votes INT,
    delivery_votes INT,
    cuisine TEXT,
    place TEXT,
    city TEXT,
    item_name TEXT,
    best_seller TEXT,
    votes INT,
    price DOUBLE,
    avg_rating DOUBLE,
    total_votes INT,
    price_per_vote DOUBLE,
    Log_Price DOUBLE,
    is_bestseller INT,
    restaurant_popularity INT,
    avg_rating_restaurant DOUBLE,
    avg_price_restaurant DOUBLE,
    avg_rating_cuisine DOUBLE,
    avg_price_cuisine DOUBLE,
    avg_rating_city DOUBLE,
    avg_price_city DOUBLE,
    is_highly_rated INT,
    is_expensive INT,
    segment TEXT
);

# =========================================================
# 📊 ZOMATO RESTAURANT DATA ANALYSIS - SQL QUERIES
# =========================================================


# =========================================================
# 📌 1. TABLE CREATION
# =========================================================




# =========================================================
# 📌 2. BASIC DATA EXPLORATION
# =========================================================

# View full dataset
SELECT * FROM zomato_final;

# Count total rows
SELECT COUNT(*) FROM zomato_final;

# Sample data (first 5 rows)
SELECT * 
FROM zomato_final
LIMIT 5;


# =========================================================
# 📊 3. KEY PERFORMANCE INDICATORS (KPIs)
# =========================================================

# Total unique restaurants
SELECT COUNT(DISTINCT restaurant_name) AS total_restaurants
FROM zomato_final;


# Average restaurant rating
SELECT ROUND(AVG(avg_rating_restaurant), 2) AS average_restaurant_rating
FROM zomato_final;


# Average customer votes
SELECT ROUND(AVG(total_votes), 2) AS avg_votes
FROM zomato_final;


# Average votes per restaurant
SELECT 
    ROUND(SUM(total_votes) / COUNT(DISTINCT restaurant_name), 2) AS avg_votes_per_restaurant
FROM zomato_final;


# Top rated restaurants
SELECT 
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS avg_restaurant_rating
FROM zomato_final
GROUP BY restaurant_name
ORDER BY avg_restaurant_rating DESC
LIMIT 10;


# Average restaurant price
SELECT 
    ROUND(AVG(price), 2) AS average_price
FROM zomato_final;


# =========================================================
# 📊 4. BUSINESS ANALYSIS QUERIES
# =========================================================

# Top 10 restaurants by votes
SELECT 
    restaurant_name,
    SUM(total_votes) AS total_votes
FROM zomato_final
GROUP BY restaurant_name
ORDER BY total_votes DESC
LIMIT 10;


# High rating + high engagement restaurants
SELECT 
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS rating,
    SUM(total_votes) AS votes
FROM zomato_final
GROUP BY restaurant_name
HAVING SUM(total_votes) > 10000
ORDER BY rating DESC, votes DESC
LIMIT 10;


# Top expensive restaurants
SELECT 
    restaurant_name,
    ROUND(AVG(price), 2) AS avg_price
FROM zomato_final
GROUP BY restaurant_name
ORDER BY avg_price DESC
LIMIT 10;


# Most affordable restaurants
SELECT 
    restaurant_name,
    ROUND(AVG(price), 2) AS avg_price
FROM zomato_final
GROUP BY restaurant_name
ORDER BY avg_price ASC
LIMIT 10;
