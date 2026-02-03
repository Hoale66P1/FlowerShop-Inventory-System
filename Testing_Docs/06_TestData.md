# Test Data - Flower Shop Inventory System
**Module:** Inventory Management  
**Mục đích:** Tập dữ liệu test chuẩn để thực thi test cases

---

## 1. Test Data Cho Login (FR_01)

### 1.1 Valid User Accounts (Tài Khoản Hợp Lệ)

| UserID | Username | Password | Role | Status | Failed Login Count |
|--------|----------|----------|------|--------|-------------------|
| 1 | admin | admin123 | Admin | Active | 0 |
| 2 | user01 | user123 | Employee | Active | 0 |
| 3 | testuser | test123 | Employee | Active | 0 |
| 4 | manager | manager123 | Manager | Active | 0 |

### 1.2 Invalid/Test User Accounts

| UserID | Username | Password | Role | Status | Failed Login Count | Ghi Chú |
|--------|----------|----------|------|--------|-------------------|---------|
| 5 | lockeduser | locked123 | Employee | Locked | 3 | Dùng để test TC_LOGIN_006 |
| 6 | inactiveuser | inactive123 | Employee | Inactive | 0 | User bị vô hiệu hóa |

### 1.3 Invalid Login Attempts (Dữ Liệu Đăng Nhập Sai)

| Test Case | Username | Password | Expected Result |
|-----------|----------|----------|----------------|
| TC_LOGIN_002 | wronguser | anypassword | Login Failed - User not found |
| TC_LOGIN_003 | admin | wrongpassword | Login Failed - Wrong password |
| TC_LOGIN_004 | _(empty)_ | _(empty)_ | Validation Error |
| TC_LOGIN_007 | admin | admin123 (case) | Login Failed - Case sensitive |
| TC_LOGIN_008 | ' OR '1'='1 | ' OR '1'='1 | Login Failed - SQL Injection blocked |

---

## 2. Test Data Cho Add Product (FR_02)

### 2.1 Valid Products (Sản Phẩm Hợp Lệ)

Dùng cho **TC_ADDPROD_001** và các positive test cases:

| Tên Hoa | Loại Hoa | Giá Nhập (VND) | Giá Bán (VND) | Số Lượng | Ghi Chú |
|---------|----------|----------------|---------------|----------|---------|
| Hồng Đỏ | Hoa Hồng | 50,000 | 80,000 | 100 | Standard product |
| Cúc Vàng | Hoa Cúc | 30,000 | 50,000 | 150 | Standard product |
| Lan Hồ Điệp | Hoa Lan | 200,000 | 350,000 | 20 | High-value product |
| Hướng Dương | Hoa Hướng Dương | 40,000 | 65,000 | 80 | Standard product |
| Tulip Trắng | Hoa Tulip | 60,000 | 90,000 | 0 | Quantity = 0 (boundary) |

### 2.2 Invalid Products - Business Rule Violations

#### BR_01 Violation: Giá Bán ≤ Giá Nhập

| Test Case | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng | Lý Do Invalid |
|-----------|---------|----------|----------|---------|----------|--------------|
| TC_ADDPROD_002 | Cúc Vàng | Hoa Cúc | 100,000 | 80,000 | 50 | Giá bán < Giá nhập |
| TC_ADDPROD_003 | Lan Hồ Điệp | Hoa Lan | 200,000 | 200,000 | 20 | Giá bán = Giá nhập |

#### BR_02 Violation: Số Lượng Âm

| Test Case | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng | Lý Do Invalid |
|-----------|---------|----------|----------|---------|----------|--------------|
| TC_ADDPROD_004 | Hướng Dương | Hoa Hướng Dương | 30,000 | 50,000 | -10 | Số lượng âm |

#### BR_03 Violation: Trường Bắt Buộc Rỗng

| Test Case | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng | Lý Do Invalid |
|-----------|---------|----------|----------|---------|----------|--------------|
| TC_ADDPROD_006 | _(empty)_ | Hoa Cẩm Chướng | 40,000 | 70,000 | 30 | Tên hoa rỗng |
| TC_ADDPROD_007 | Đồng Tiền | Hoa Đồng Tiền | 25,000 | _(empty)_ | 40 | Giá bán rỗng |

### 2.3 Boundary Test Data

| Test Case | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng | Mục Đích |
|-----------|---------|----------|----------|---------|----------|----------|
| TC_ADDPROD_005 | Tulip Trắng | Hoa Tulip | 60,000 | 90,000 | 0 | Zero quantity |
| TC_ADDPROD_012 | Hoa Đặc Biệt | Đặc Biệt | 9,999,999 | 99,999,999 | 999,999 | Large values |

### 2.4 Invalid Data Types

| Test Case | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng | Lý Do Invalid |
|-----------|---------|----------|----------|---------|----------|--------------|
| TC_ADDPROD_009 | Hoa Test | Test | abc123 | xyz456 | 10 | Giá không phải số |
| TC_ADDPROD_010 | Hoa Linh Lan | Linh Lan | 45,000 | 75,000 | 10.5 | Số lượng là số thập phân |
| TC_ADDPROD_013 | Hoa @#$% & * | Test | 30,000 | 50,000 | 20 | Special characters |

---

## 3. Test Data Cho Search (FR_03)

### 3.1 Products In Database (Sản Phẩm Có Sẵn)

Giả định database có các sản phẩm sau:

| ProductID | Tên Hoa | Loại Hoa | Giá Nhập | Giá Bán | Số Lượng |
|-----------|---------|----------|----------|---------|----------|
| 1 | Hồng Đỏ | Hoa Hồng | 50,000 | 80,000 | 100 |
| 2 | Hồng Trắng | Hoa Hồng | 55,000 | 85,000 | 80 |
| 3 | Hồng Vàng | Hoa Hồng | 60,000 | 90,000 | 60 |
| 4 | Cúc Trắng | Hoa Cúc | 25,000 | 45,000 | 120 |
| 5 | Lan Hồ Điệp | Hoa Lan | 200,000 | 350,000 | 20 |
| 6 | Hướng Dương | Hoa Hướng Dương | 40,000 | 65,000 | 90 |
| 7 | Tulip Đỏ | Hoa Tulip | 70,000 | 100,000 | 50 |
| 8 | Cẩm Chướng Hồng | Hoa Cẩm Chướng | 35,000 | 55,000 | 110 |
| 9 | Đồng Tiền Vàng | Hoa Đồng Tiền | 20,000 | 40,000 | 150 |
| 10 | Hoa 10 | Hoa Số | 30,000 | 50,000 | 70 |

### 3.2 Search Test Scenarios

| Test Case | Search Input | Search Type | Expected Results | Note |
|-----------|--------------|-------------|------------------|------|
| TC_SEARCH_001 | Hồng Đỏ | Exact Name | ID: 1 (Hồng Đỏ) | Exact match |
| TC_SEARCH_002 | Hồng | Partial Name | ID: 1,2,3,8 (All containing "Hồng") | Partial match |
| TC_SEARCH_003 | 5 | ID | ID: 5 (Lan Hồ Điệp) | Search by ID |
| TC_SEARCH_004 | 9999 | ID | No results | Non-existent ID |
| TC_SEARCH_005 | XYZ123ABC | Name | No results | Non-existent name |
| TC_SEARCH_006 | _(empty)_ | Empty | All products or error | Empty search |
| TC_SEARCH_007 | hồng đỏ / HỒNG ĐỎ | Case Insensitive | ID: 1 (Hồng Đỏ) | Case insensitive |
| TC_SEARCH_008 | "  Cúc Vàng  " | With Spaces | ID: 4 (Cúc Trắng) or similar | Trim whitespace |
| TC_SEARCH_009 | %@#$ | Special Chars | No results (safe) | Special characters |
| TC_SEARCH_010 | ' OR '1'='1 | SQL Injection | No results (blocked) | Security test |
| TC_SEARCH_011 | Hoa | Common Word | Multiple results | Many matches |
| TC_SEARCH_012 | 10 | Ambiguous | ID:10 or products with "10" | Number search |

---

## 4. General Test Data Guidelines

### 4.1 Vietnamese Characters
- Đảm bảo test với các ký tự tiếng Việt có dấu: á, à, ả, ã, ạ, ă, ắ, ằ, ẳ, ẵ, ặ, â, ấ, ầ, ẩ, ẫ, ậ
- Test cả chữ hoa có dấu: Á, À, Ả, Ã, Ạ
- Tên hoa thường dùng: Hồng, Cúc, Lan, Đào, Mai, Huệ, Sen, Lily, Tulip

### 4.2 Price Ranges (Realisti Data)
- **Low-end flowers:** 15,000 - 50,000 VND (giá nhập)
- **Mid-range flowers:** 50,000 - 150,000 VND
- **High-end flowers:** 150,000 - 500,000 VND (Lan, Hồng nhập khẩu)

### 4.3 Quantity Ranges
- **Normal stock:** 20 - 200
- **Low stock:** 1 - 19 (để test low inventory warnings)
- **Out of stock:** 0
- **High stock:** 200+

### 4.4 SQL Injection Test Strings
Test với các patterns sau để verify security:
```sql
' OR '1'='1
' OR '1'='1' --
'; DROP TABLE products; --
admin'--
' UNION SELECT NULL--
1' AND '1'='1
```

### 4.5 Special Characters To Test
- Dấu câu: !@#$%^&*()
- Brackets: []{}()
- Quotes: '"/`
- Slashes: /\|
- HTML tags: `<script>alert('test')</script>`

---

## 5. Database Setup Scripts (Tùy Chọn)

### 5.1 Insert Test Users
```sql
INSERT INTO users (username, password, role, is_locked, failed_login_count) VALUES
('admin', 'admin123', 'Admin', false, 0),
('user01', 'user123', 'Employee', false, 0),
('testuser', 'test123', 'Employee', false, 0),
('lockeduser', 'locked123', 'Employee', true, 3);
```

### 5.2 Insert Test Products
```sql
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
```

---

## 6. Test Data Maintenance

### 6.1 Before Testing
- ✅ Backup database hiện tại
- ✅ Load test data vào test database
- ✅ Verify data được insert thành công

### 6.2 During Testing
- ✅ Không modify test data giữa các test runs
- ✅ Record lại data changes nếu có

### 6.3 After Testing
- ✅ Clean up test data
- ✅ Restore original database (nếu cần)
- ✅ Document any data issues encountered
