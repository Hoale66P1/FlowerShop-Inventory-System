-- ============================================================
-- SQL VALIDATION QUERIES - FLOWER SHOP INVENTORY SYSTEM
-- ============================================================
-- Module: Database Testing
-- Purpose: Validate data integrity, business rules, and support test execution
-- Date: 03/02/2026
-- ============================================================

-- ============================================================
-- SECTION 1: SETUP TEST DATA
-- ============================================================
-- Run these queries to populate test database before testing

-- 1.1 Insert Test Users for Login Testing (FR_01)
-- ============================================================
INSERT INTO users (username, password, role, is_locked, failed_login_count) VALUES
('admin', 'admin123', 'Admin', false, 0),
('user01', 'user123', 'Employee', false, 0),
('testuser', 'test123', 'Employee', false, 0),
('manager', 'manager123', 'Manager', false, 0),
('lockeduser', 'locked123', 'Employee', true, 3),
('inactiveuser', 'inactive123', 'Employee', false, 0);

-- 1.2 Insert Test Products for Add Product & Search Testing (FR_02, FR_03)
-- ============================================================
INSERT INTO products (name, type, import_price, selling_price, stock_quantity) VALUES
('Hồng Đỏ', 'Hoa Hồng', 50000, 80000, 100),
('Hồng Trắng', 'Hoa Hồng', 55000, 85000, 80),
('Hồng Vàng', 'Hoa Hồng', 60000, 90000, 60),
('Cúc Trắng', 'Hoa Cúc', 25000, 45000, 120),
('Lan Hồ Điệp', 'Hoa Lan', 200000, 350000, 20),
('Hướng Dương', 'Hoa Hướng Dương', 40000, 65000, 90),
('Tulip Đỏ', 'Hoa Tulip', 70000, 100000, 50),
('Cẩm Chướng Hồng', 'Hoa Cẩm Chướng', 35000, 55000, 110),
('Đồng Tiền Vàng', 'Hoa Đồng Tiền', 20000, 40000, 150),
('Hoa 10', 'Hoa Số', 30000, 50000, 70);


-- ============================================================
-- SECTION 2: LOGIN VALIDATION QUERIES (FR_01)
-- ============================================================

-- 2.1 Check if user exists (TC_LOGIN_001, TC_LOGIN_002)
-- ============================================================
-- Usage: Verify user account for login testing
SELECT * FROM users WHERE username = 'admin';

-- Expected: Should return 1 row with username='admin'
-- If no rows: User does not exist (TC_LOGIN_002 scenario)


-- 2.2 Validate password for user (TC_LOGIN_003)
-- ============================================================
-- Usage: Check password match (in real app, password should be hashed)
SELECT * FROM users 
WHERE username = 'admin' AND password = 'admin123';

-- Expected: Should return 1 row if credentials correct
-- If no rows: Wrong password (TC_LOGIN_003 scenario)


-- 2.3 Check failed login count (TC_LOGIN_005)
-- ============================================================
-- Usage: Verify failed_login_count increments after failed attempts
SELECT username, failed_login_count, is_locked 
FROM users 
WHERE username = 'testuser';

-- Expected after TC_LOGIN_005:
-- failed_login_count should be >= 3
-- is_locked should be true


-- 2.4 Check if account is locked (TC_LOGIN_006)
-- ============================================================
-- Usage: Verify locked account cannot login
SELECT username, is_locked, failed_login_count 
FROM users 
WHERE username = 'lockeduser';

-- Expected: is_locked = true, failed_login_count >= 3


-- 2.5 List all locked accounts
-- ============================================================
-- Usage: Security audit - find all locked accounts
SELECT username, role, failed_login_count, is_locked 
FROM users 
WHERE is_locked = true;

-- Expected: Should list all locked users


-- 2.6 Reset failed login count (for retesting)
-- ============================================================
-- Usage: Reset user for retesting login scenarios
UPDATE users 
SET failed_login_count = 0, is_locked = false 
WHERE username = 'testuser';

-- Verify reset:
SELECT username, failed_login_count, is_locked 
FROM users 
WHERE username = 'testuser';


-- ============================================================
-- SECTION 3: ADD PRODUCT VALIDATION QUERIES (FR_02)
-- ============================================================

-- 3.1 Validate BR_01: Selling Price > Import Price (TC_ADDPROD_002, TC_ADDPROD_003)
-- ============================================================
-- Usage: Find products violating BR_01
SELECT 
    id,
    name,
    import_price,
    selling_price,
    (selling_price - import_price) AS profit,
    CASE 
        WHEN selling_price > import_price THEN 'VALID'
        WHEN selling_price = import_price THEN 'INVALID (Equal)'
        ELSE 'INVALID (Less Than)'
    END AS br01_status
FROM products;

-- Expected: All products should have br01_status = 'VALID'
-- Any 'INVALID' indicates BR_01 violation


-- 3.2 Find products violating BR_01 specifically
-- ============================================================
SELECT 
    id, 
    name, 
    import_price, 
    selling_price 
FROM products 
WHERE selling_price <= import_price;

-- Expected: Should return 0 rows
-- If rows returned: Data integrity violation


-- 3.3 Validate BR_02: Stock Quantity >= 0 (TC_ADDPROD_004, TC_ADDPROD_005)
-- ============================================================
-- Usage: Find products with negative stock
SELECT 
    id,
    name,
    stock_quantity,
    CASE 
        WHEN stock_quantity < 0 THEN 'INVALID (Negative)'
        WHEN stock_quantity = 0 THEN 'WARNING (Out of Stock)'
        ELSE 'VALID'
    END AS br02_status
FROM products;

-- Expected: No products with br02_status = 'INVALID (Negative)'


-- 3.4 Find products with negative stock (Violation of BR_02)
-- ============================================================
SELECT 
    id, 
    name, 
    stock_quantity 
FROM products 
WHERE stock_quantity < 0;

-- Expected: Should return 0 rows
-- If rows returned: Critical data integrity violation


-- 3.5 Validate BR_03: Required Fields Not Null (TC_ADDPROD_006, TC_ADDPROD_007)
-- ============================================================
-- Usage: Check for NULL in required fields (name, selling_price)
SELECT 
    id,
    name,
    selling_price,
    CASE 
        WHEN name IS NULL THEN 'INVALID (Name is NULL)'
        WHEN selling_price IS NULL THEN 'INVALID (Selling Price is NULL)'
        WHEN name = '' THEN 'INVALID (Name is Empty)'
        ELSE 'VALID'
    END AS br03_status
FROM products;

-- Expected: All products should have br03_status = 'VALID'


-- 3.6 Find products with NULL or empty required fields
-- ============================================================
SELECT 
    id, 
    name, 
    selling_price 
FROM products 
WHERE name IS NULL 
   OR name = '' 
   OR selling_price IS NULL;

-- Expected: Should return 0 rows


-- 3.7 Verify product was added successfully (after TC_ADDPROD_001)
-- ============================================================
-- Usage: Check if newly added product exists in database
SELECT * FROM products 
WHERE name = 'Hồng Đỏ';

-- Expected: Should return the product with correct details
-- Verify: import_price, selling_price, stock_quantity match input


-- 3.8 Check for duplicate product names (TC_ADDPROD_011)
-- ============================================================
-- Usage: Find products with duplicate names
SELECT 
    name, 
    COUNT(*) as count 
FROM products 
GROUP BY name 
HAVING COUNT(*) > 1;

-- Expected: Depends on business rule
-- If duplicates allowed: May return rows
-- If duplicates not allowed: Should return 0 rows


-- 3.9 Statistics: Price range validation
-- ============================================================
-- Usage: Check if prices are within reasonable ranges
SELECT 
    MIN(import_price) AS min_import_price,
    MAX(import_price) AS max_import_price,
    AVG(import_price) AS avg_import_price,
    MIN(selling_price) AS min_selling_price,
    MAX(selling_price) AS max_selling_price,
    AVG(selling_price) AS avg_selling_price,
    AVG(selling_price - import_price) AS avg_profit
FROM products;


-- 3.10 Products with zero stock (Low inventory alert)
-- ============================================================
SELECT 
    id, 
    name, 
    type, 
    stock_quantity 
FROM products 
WHERE stock_quantity = 0;

-- Expected: List of out-of-stock products


-- ============================================================
-- SECTION 4: SEARCH VALIDATION QUERIES (FR_03)
-- ============================================================

-- 4.1 Search by exact name (TC_SEARCH_001)
-- ============================================================
-- Usage: Test exact match search
SELECT * FROM products 
WHERE name = 'Hồng Đỏ';

-- Expected: Should return 1 row with exact name match


-- 4.2 Search by partial name (TC_SEARCH_002)
-- ============================================================
-- Usage: Test partial/wildcard search
SELECT * FROM products 
WHERE name LIKE '%Hồng%';

-- Expected: Should return all products containing 'Hồng'
-- (Hồng Đỏ, Hồng Trắng, Hồng Vàng, Cẩm Chướng Hồng)


-- 4.3 Search by ID (TC_SEARCH_003)
-- ============================================================
-- Usage: Test search by product ID
SELECT * FROM products 
WHERE id = 5;

-- Expected: Should return exactly 1 product (Lan Hồ Điệp if using test data)


-- 4.4 Search with non-existent ID (TC_SEARCH_004)
-- ============================================================
SELECT * FROM products 
WHERE id = 9999;

-- Expected: No rows returned


-- 4.5 Search with non-existent name (TC_SEARCH_005)
-- ============================================================
SELECT * FROM products 
WHERE name LIKE '%XYZ123ABC%';

-- Expected: No rows returned


-- 4.6 Case-insensitive search (TC_SEARCH_007)
-- ============================================================
-- Usage: Test if search is case-insensitive
SELECT * FROM products 
WHERE LOWER(name) LIKE LOWER('%hồng đỏ%');

-- Expected: Should return products regardless of case


-- 4.7 Search with leading/trailing spaces (TC_SEARCH_008)
-- ============================================================
-- Usage: Test if system trims whitespace
SELECT * FROM products 
WHERE TRIM(name) = TRIM('  Cúc Vàng  ');

-- Expected: Should return 'Cúc Vàng' product


-- 4.8 Count total products (for pagination testing - TC_SEARCH_011)
-- ============================================================
SELECT COUNT(*) AS total_products FROM products;

-- Expected: Should return total count for pagination calculation


-- 4.9 Get products with pagination
-- ============================================================
-- Usage: Test pagination (e.g., 10 products per page)
SELECT * FROM products 
ORDER BY id 
LIMIT 10 OFFSET 0;

-- LIMIT: number of records per page
-- OFFSET: (page_number - 1) * records_per_page


-- 4.10 Search by type (additional search functionality)
-- ============================================================
SELECT * FROM products 
WHERE type = 'Hoa Hồng';

-- Expected: Should return all roses (Hồng Đỏ, Hồng Trắng, Hồng Vàng)


-- ============================================================
-- SECTION 5: DATA INTEGRITY CHECKS
-- ============================================================

-- 5.1 Check for NULL values in any column
-- ============================================================
SELECT 
    'products' AS table_name,
    COUNT(*) AS total_records,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS null_type,
    SUM(CASE WHEN import_price IS NULL THEN 1 ELSE 0 END) AS null_import_price,
    SUM(CASE WHEN selling_price IS NULL THEN 1 ELSE 0 END) AS null_selling_price,
    SUM(CASE WHEN stock_quantity IS NULL THEN 1 ELSE 0 END) AS null_stock
FROM products;

-- Expected: All null_* counts should be 0 for required fields


-- 5.2 Comprehensive Business Rules Validation Report
-- ============================================================
SELECT 
    'BR_01 Violations (Selling <= Import)' AS rule,
    COUNT(*) AS violation_count
FROM products 
WHERE selling_price <= import_price

UNION ALL

SELECT 
    'BR_02 Violations (Negative Stock)' AS rule,
    COUNT(*) AS violation_count
FROM products 
WHERE stock_quantity < 0

UNION ALL

SELECT 
    'BR_03 Violations (NULL Required Fields)' AS rule,
    COUNT(*) AS violation_count
FROM products 
WHERE name IS NULL OR name = '' OR selling_price IS NULL;

-- Expected: All violation_count should be 0


-- 5.3 Full Data Quality Report
-- ============================================================
SELECT 
    COUNT(*) AS total_products,
    COUNT(DISTINCT name) AS unique_names,
    COUNT(DISTINCT type) AS unique_types,
    SUM(CASE WHEN selling_price > import_price THEN 1 ELSE 0 END) AS valid_pricing,
    SUM(CASE WHEN stock_quantity >= 0 THEN 1 ELSE 0 END) AS valid_stock,
    SUM(CASE WHEN stock_quantity = 0 THEN 1 ELSE 0 END) AS out_of_stock,
    SUM(CASE WHEN stock_quantity > 0 AND stock_quantity < 20 THEN 1 ELSE 0 END) AS low_stock,
    MIN(selling_price) AS lowest_price,
    MAX(selling_price) AS highest_price,
    SUM(stock_quantity) AS total_inventory
FROM products;


-- ============================================================
-- SECTION 6: TEST CLEANUP & RESET
-- ============================================================

-- 6.1 Delete all test products (use with caution!)
-- ============================================================
-- DELETE FROM products WHERE id > 0;

-- 6.2 Delete all test users (use with caution!)
-- ============================================================
-- DELETE FROM users WHERE username IN ('admin', 'user01', 'testuser', 'lockeduser');

-- 6.3 Reset auto-increment for products (MySQL)
-- ============================================================
-- ALTER TABLE products AUTO_INCREMENT = 1;

-- 6.4 Reset auto-increment for users (MySQL)
-- ============================================================
-- ALTER TABLE users AUTO_INCREMENT = 1;

-- 6.5 Backup database before testing
-- ============================================================
-- mysqldump -u username -p database_name > backup_before_testing.sql

-- 6.6 Restore database after testing
-- ============================================================
-- mysql -u username -p database_name < backup_before_testing.sql


-- ============================================================
-- SECTION 7: PERFORMANCE TESTING QUERIES
-- ============================================================

-- 7.1 Search performance test (TC_SEARCH_013)
-- ============================================================
-- Usage: Measure query execution time for search
SELECT * FROM products 
WHERE name LIKE '%Hoa%';

-- Measure execution time. Expected: < 2 seconds even with 1000+ products


-- 7.2 Check if indexes exist (for performance)
-- ============================================================
SHOW INDEX FROM products;

-- Expected: Should have indexes on frequently searched columns (name, id)


-- 7.3 Query execution plan
-- ============================================================
EXPLAIN SELECT * FROM products WHERE name LIKE '%Hồng%';

-- Usage: Check if query is using indexes efficiently


-- ============================================================
-- SECTION 8: SECURITY VALIDATION
-- ============================================================

-- 8.1 Test SQL Injection Prevention (TC_LOGIN_008, TC_SEARCH_010)
-- ============================================================
-- These queries should NOT work if application properly uses prepared statements
-- DO NOT RUN THESE DIRECTLY - They are for testing app security

-- Example malicious inputs that should be blocked:
-- Username: ' OR '1'='1
-- Password: ' OR '1'='1' --
-- Search: '; DROP TABLE products; --

-- The application should treat these as literal strings, not SQL code


-- 8.2 Check for plain text passwords (Security audit)
-- ============================================================
-- WARNING: In production, passwords should NEVER be stored in plain text!
SELECT 
    username,
    CASE 
        WHEN password = 'admin123' THEN 'INSECURE (Plain Text)'
        WHEN LENGTH(password) < 60 THEN 'POSSIBLY INSECURE (Not Hashed)'
        ELSE 'SECURE (Hashed)'
    END AS password_security
FROM users;

-- Recommendation: Use bcrypt, argon2, or similar hashing algorithms


-- ============================================================
-- SECTION 9: REPORTING QUERIES
-- ============================================================

-- 9.1 Test Execution Summary
-- ============================================================
SELECT 
    'Total Users' AS metric,
    COUNT(*) AS value
FROM users

UNION ALL

SELECT 
    'Total Products' AS metric,
    COUNT(*) AS value
FROM products

UNION ALL

SELECT 
    'Locked Accounts' AS metric,
    COUNT(*) AS value
FROM users WHERE is_locked = true

UNION ALL

SELECT 
    'Out of Stock Products' AS metric,
    COUNT(*) AS value
FROM products WHERE stock_quantity = 0

UNION ALL

SELECT 
    'BR_01 Violations' AS metric,
    COUNT(*) AS value
FROM products WHERE selling_price <= import_price

UNION ALL

SELECT 
    'BR_02 Violations' AS metric,
    COUNT(*) AS value
FROM products WHERE stock_quantity < 0;


-- 9.2 Product Inventory Report
-- ============================================================
SELECT 
    type,
    COUNT(*) AS product_count,
    SUM(stock_quantity) AS total_stock,
    AVG(selling_price) AS avg_price
FROM products
GROUP BY type
ORDER BY product_count DESC;


-- ============================================================
-- SECTION 10: SPECIFIC TEST CASE SUPPORT QUERIES
-- ============================================================

-- 10.1 TC_LOGIN_005: Verify account locked after 3 failed attempts
-- ============================================================
-- Step 1: Check initial state
SELECT username, failed_login_count, is_locked FROM users WHERE username = 'testuser';

-- Step 2: Simulate failed login (normally done by application)
UPDATE users SET failed_login_count = failed_login_count + 1 WHERE username = 'testuser';

-- Step 3: Check after 3 failures
UPDATE users SET is_locked = true WHERE username = 'testuser' AND failed_login_count >= 3;

-- Step 4: Verify final state
SELECT username, failed_login_count, is_locked FROM users WHERE username = 'testuser';


-- 10.2 TC_ADDPROD_001: Verify product added successfully
-- ============================================================
-- After running Add Product test, verify:
SELECT * FROM products 
WHERE name = 'Hồng Đỏ' 
  AND type = 'Hoa Hồng'
  AND import_price = 50000
  AND selling_price = 80000
  AND stock_quantity = 100;

-- Expected: 1 row with exact match


-- 10.3 TC_SEARCH_002: Verify partial match returns multiple results
-- ============================================================
SELECT name FROM products WHERE name LIKE '%Hồng%';

-- Expected result count:
SELECT COUNT(*) AS matching_products FROM products WHERE name LIKE '%Hồng%';
-- Should return 4 (Hồng Đỏ, Hồng Trắng, Hồng Vàng, Cẩm Chướng Hồng)


-- ============================================================
-- END OF SQL VALIDATION QUERIES
-- ============================================================

-- Notes:
-- 1. Run SECTION 1 queries first to populate test data
-- 2. Use SECTION 2-4 queries during test execution to verify results
-- 3. Use SECTION 5 for data integrity validation
-- 4. Use SECTION 6 carefully for cleanup (commented out for safety)
-- 5. Use SECTION 7-9 for performance and reporting
-- 6. Modify table/column names if your schema is different

-- For MySQL: Use these queries as-is
-- For PostgreSQL: Replace LIMIT/OFFSET syntax if needed
-- For SQL Server: Replace LIMIT with TOP

-- Last Updated: 03/02/2026
