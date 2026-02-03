
-- Thêm người dùng test
INSERT INTO users (username, password, role, is_locked, failed_login_count) VALUES
('admin', 'admin123', 'Admin', false, 0),
('user01', 'user123', 'Employee', false, 0),
('testuser', 'test123', 'Employee', false, 0),
('manager', 'manager123', 'Manager', false, 0),
('lockeduser', 'locked123', 'Employee', true, 3),
('inactiveuser', 'inactive123', 'Employee', false, 0);

-- Thêm sản phẩm test
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


-- Kiểm tra user tồn tại
SELECT * FROM users WHERE username = 'admin';

-- Xác thực đăng nhập người dùng
SELECT * FROM users 
WHERE username = 'admin' AND password = 'admin123';

-- Kiểm tra số lần đăng nhập sai
SELECT username, failed_login_count, is_locked 
FROM users 
WHERE username = 'testuser';

-- Kiểm tra tài khoản bị khóa
SELECT username, is_locked, failed_login_count 
FROM users 
WHERE username = 'lockeduser';

-- Liệt kê tất cả tài khoản bị khóa
SELECT username, role, failed_login_count, is_locked 
FROM users 
WHERE is_locked = true;

-- Reset số lần đăng nhập sai
UPDATE users 
SET failed_login_count = 0, is_locked = false 
WHERE username = 'testuser';


-- Kiểm tra BR_01: Giá bán > Giá nhập
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

-- Tìm sản phẩm vi phạm BR_01
SELECT 
    id, 
    name, 
    import_price, 
    selling_price 
FROM products 
WHERE selling_price <= import_price;

-- Kiểm tra BR_02: Số lượng >= 0
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

-- Tìm sản phẩm có số lượng âm
SELECT 
    id, 
    name, 
    stock_quantity 
FROM products 
WHERE stock_quantity < 0;

-- Kiểm tra BR_03: Trường bắt buộc không NULL
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

-- Tìm sản phẩm có trường bắt buộc NULL
SELECT 
    id, 
    name, 
    selling_price 
FROM products 
WHERE name IS NULL 
   OR name = '' 
   OR selling_price IS NULL;

-- Xác minh sản phẩm đã được thêm
SELECT * FROM products 
WHERE name = 'Hồng Đỏ';

-- Kiểm tra tên sản phẩm trùng lặp
SELECT 
    name, 
    COUNT(*) as count 
FROM products 
GROUP BY name 
HAVING COUNT(*) > 1;

-- Thống kê giá sản phẩm
SELECT 
    MIN(import_price) AS min_import_price,
    MAX(import_price) AS max_import_price,
    AVG(import_price) AS avg_import_price,
    MIN(selling_price) AS min_selling_price,
    MAX(selling_price) AS max_selling_price,
    AVG(selling_price) AS avg_selling_price,
    AVG(selling_price - import_price) AS avg_profit
FROM products;

-- Liệt kê sản phẩm hết hàng
SELECT 
    id, 
    name, 
    type, 
    stock_quantity 
FROM products 
WHERE stock_quantity = 0;


-- Tìm kiếm theo tên chính xác
SELECT * FROM products 
WHERE name = 'Hồng Đỏ';

-- Tìm kiếm theo tên một phần
SELECT * FROM products 
WHERE name LIKE '%Hồng%';

-- Tìm kiếm theo ID
SELECT * FROM products 
WHERE id = 5;

-- Tìm kiếm ID không tồn tại
SELECT * FROM products 
WHERE id = 9999;

-- Tìm kiếm tên không tồn tại
SELECT * FROM products 
WHERE name LIKE '%XYZ123ABC%';

-- Tìm kiếm không phân biệt chữ hoa/thường
SELECT * FROM products 
WHERE LOWER(name) LIKE LOWER('%hồng đỏ%');

-- Tìm kiếm với khoảng trắng đầu/cuối
SELECT * FROM products 
WHERE TRIM(name) = TRIM('  Cúc Vàng  ');

-- Đếm tổng số sản phẩm
SELECT COUNT(*) AS total_products FROM products;

-- Lấy sản phẩm với phân trang
SELECT * FROM products 
ORDER BY id 
LIMIT 10 OFFSET 0;

-- Tìm kiếm theo loại hoa
SELECT * FROM products 
WHERE type = 'Hoa Hồng';


-- Kiểm tra giá trị NULL trong bảng
SELECT 
    'products' AS table_name,
    COUNT(*) AS total_records,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS null_type,
    SUM(CASE WHEN import_price IS NULL THEN 1 ELSE 0 END) AS null_import_price,
    SUM(CASE WHEN selling_price IS NULL THEN 1 ELSE 0 END) AS null_selling_price,
    SUM(CASE WHEN stock_quantity IS NULL THEN 1 ELSE 0 END) AS null_stock
FROM products;

-- Báo cáo vi phạm Business Rules
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

-- Báo cáo chất lượng dữ liệu tổng hợp
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


-- Kiểm tra hiệu năng tìm kiếm
SELECT * FROM products 
WHERE name LIKE '%Hoa%';

-- Kiểm tra index của bảng
SHOW INDEX FROM products;

-- Phân tích kế hoạch thực thi query
EXPLAIN SELECT * FROM products WHERE name LIKE '%Hồng%';


-- Kiểm tra bảo mật mật khẩu
SELECT 
    username,
    CASE 
        WHEN password = 'admin123' THEN 'INSECURE (Plain Text)'
        WHEN LENGTH(password) < 60 THEN 'POSSIBLY INSECURE (Not Hashed)'
        ELSE 'SECURE (Hashed)'
    END AS password_security
FROM users;



-- Báo cáo tổng hợp test
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

-- Báo cáo kho hàng theo loại
SELECT 
    type,
    COUNT(*) AS product_count,
    SUM(stock_quantity) AS total_stock,
    AVG(selling_price) AS avg_price
FROM products
GROUP BY type
ORDER BY product_count DESC;



-- TC_LOGIN_005: Xác minh tài khoản bị khóa sau 3 lần sai
SELECT username, failed_login_count, is_locked FROM users WHERE username = 'testuser';

-- Mô phỏng đăng nhập sai
UPDATE users SET failed_login_count = failed_login_count + 1 WHERE username = 'testuser';

-- Khóa tài khoản sau 3 lần sai
UPDATE users SET is_locked = true WHERE username = 'testuser' AND failed_login_count >= 3;

-- TC_ADDPROD_001: Xác minh sản phẩm đã được thêm
SELECT * FROM products 
WHERE name = 'Hồng Đỏ' 
  AND type = 'Hoa Hồng'
  AND import_price = 50000
  AND selling_price = 80000
  AND stock_quantity = 100;

-- TC_SEARCH_002: Xác minh tìm kiếm một phần
SELECT name FROM products WHERE name LIKE '%Hồng%';

-- Đếm số kết quả tìm kiếm
SELECT COUNT(*) AS matching_products FROM products WHERE name LIKE '%Hồng%';

