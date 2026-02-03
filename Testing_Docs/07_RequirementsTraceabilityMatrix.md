# Requirements Traceability Matrix (RTM)
**Project:** Flower Shop Inventory System  
**Module:** Inventory Management  
**Mục đích:** Ánh xạ giữa Requirements và Test Cases để đảm bảo 100% coverage

---

## 1. Functional Requirements Coverage

### FR_01: Login Functionality

**Requirement:** Nhân viên phải đăng nhập được bằng Username/Password hợp lệ. Hệ thống phải chặn đăng nhập nếu sai thông tin quá 3 lần.

| Test Case ID | Test Case Name | Priority | Status |
|--------------|----------------|----------|--------|
| TC_LOGIN_001 | Đăng Nhập Thành Công Với Thông Tin Hợp Lệ | High | ⬜ Not Tested |
| TC_LOGIN_002 | Đăng Nhập Thất Bại - Username Sai | High | ⬜ Not Tested |
| TC_LOGIN_003 | Đăng Nhập Thất Bại - Password Sai | High | ⬜ Not Tested |
| TC_LOGIN_004 | Đăng Nhập Thất Bại - Username và Password Rỗng | Medium | ⬜ Not Tested |
| TC_LOGIN_005 | Khóa Tài Khoản Sau 3 Lần Đăng Nhập Sai | Critical | ⬜ Not Tested |
| TC_LOGIN_006 | Không Thể Đăng Nhập Với Tài Khoản Đã Bị Khóa | High | ⬜ Not Tested |
| TC_LOGIN_007 | Password Case Sensitive | Medium | ⬜ Not Tested |
| TC_LOGIN_008 | SQL Injection Prevention | Critical | ⬜ Not Tested |

**Coverage:** 8 Test Cases  
**Status:** ⬜ 0% Tested | ⬜ 0% Passed

---

### FR_02: Add Product Functionality

**Requirement:** Cho phép thêm hoa mới với các trường: Tên hoa, Loại hoa, Giá nhập, Giá bán, Số lượng tồn kho.

| Test Case ID | Test Case Name | Priority | Status |
|--------------|----------------|----------|--------|
| TC_ADDPROD_001 | Thêm Sản Phẩm Thành Công Với Dữ Liệu Hợp Lệ | Critical | ⬜ Not Tested |
| TC_ADDPROD_002 | Validation BR_01 - Giá Bán Phải Lớn Hơn Giá Nhập | Critical | ⬜ Not Tested |
| TC_ADDPROD_003 | Validation BR_01 - Giá Bán Bằng Giá Nhập (Boundary) | High | ⬜ Not Tested |
| TC_ADDPROD_004 | Validation BR_02 - Số Lượng Tồn Kho Không Âm | High | ⬜ Not Tested |
| TC_ADDPROD_005 | Boundary Test - Số Lượng Tồn Kho = 0 | Medium | ⬜ Not Tested |
| TC_ADDPROD_006 | Validation BR_03 - Trường Bắt Buộc: Tên Hoa | High | ⬜ Not Tested |
| TC_ADDPROD_007 | Validation BR_03 - Trường Bắt Buộc: Giá Bán | High | ⬜ Not Tested |
| TC_ADDPROD_008 | Thêm Sản Phẩm Với Loại Hoa Rỗng (Optional Field) | Medium | ⬜ Not Tested |
| TC_ADDPROD_009 | Validation - Giá Nhập và Giá Bán Phải Là Số | Medium | ⬜ Not Tested |
| TC_ADDPROD_010 | Validation - Số Lượng Phải Là Số Nguyên | Medium | ⬜ Not Tested |
| TC_ADDPROD_011 | Thêm Sản Phẩm Với Tên Trùng Lặp | Medium | ⬜ Not Tested |
| TC_ADDPROD_012 | Boundary Test - Giá Trị Lớn | Low | ⬜ Not Tested |
| TC_ADDPROD_013 | Special Characters Trong Tên Hoa | Low | ⬜ Not Tested |

**Coverage:** 13 Test Cases  
**Status:** ⬜ 0% Tested | ⬜ 0% Passed

---

### FR_03: Search Functionality

**Requirement:** Tìm kiếm hoa theo Tên hoặc ID.

| Test Case ID | Test Case Name | Priority | Status |
|--------------|----------------|----------|--------|
| TC_SEARCH_001 | Tìm Kiếm Theo Tên - Exact Match | High | ⬜ Not Tested |
| TC_SEARCH_002 | Tìm Kiếm Theo Tên - Partial Match | High | ⬜ Not Tested |
| TC_SEARCH_003 | Tìm Kiếm Theo ID - Exact Match | High | ⬜ Not Tested |
| TC_SEARCH_004 | Tìm Kiếm Với ID Không Tồn Tại | High | ⬜ Not Tested |
| TC_SEARCH_005 | Tìm Kiếm Với Tên Không Tồn Tại | Medium | ⬜ Not Tested |
| TC_SEARCH_006 | Tìm Kiếm Với Search Box Rỗng | Medium | ⬜ Not Tested |
| TC_SEARCH_007 | Tìm Kiếm Case Insensitive | Medium | ⬜ Not Tested |
| TC_SEARCH_008 | Tìm Kiếm Với Khoảng Trắng Đầu/Cuối | Low | ⬜ Not Tested |
| TC_SEARCH_009 | Tìm Kiếm Với Ký Tự Đặc Biệt | Low | ⬜ Not Tested |
| TC_SEARCH_010 | Tìm Kiếm SQL Injection Prevention | Critical | ⬜ Not Tested |
| TC_SEARCH_011 | Tìm Kiếm Với Nhiều Kết Quả - Pagination | Medium | ⬜ Not Tested |
| TC_SEARCH_012 | Tìm Kiếm Kết Hợp ID và Tên | Low | ⬜ Not Tested |
| TC_SEARCH_013 | Performance Test - Tìm Kiếm Nhanh | Low | ⬜ Not Tested |

**Coverage:** 13 Test Cases  
**Status:** ⬜ 0% Tested | ⬜ 0% Passed

---

## 2. Business Rules Coverage

### BR_01: Giá bán (Selling Price) phải lớn hơn Giá nhập (Import Price)

| Test Case ID | Validates BR_01 | Test Scenario |
|--------------|-----------------|---------------|
| TC_ADDPROD_001 | ✅ Yes | Valid: Selling Price > Import Price |
| TC_ADDPROD_002 | ✅ Yes | Invalid: Selling Price < Import Price |
| TC_ADDPROD_003 | ✅ Yes | Invalid: Selling Price = Import Price (boundary) |

**Coverage:** 3 Test Cases covering valid, invalid, and boundary scenarios  
**Status:** ⬜ Not Tested

---

### BR_02: Số lượng tồn kho (Stock Quantity) không được là số âm

| Test Case ID | Validates BR_02 | Test Scenario |
|--------------|-----------------|---------------|
| TC_ADDPROD_001 | ✅ Yes | Valid: Positive quantity |
| TC_ADDPROD_004 | ✅ Yes | Invalid: Negative quantity |
| TC_ADDPROD_005 | ✅ Yes | Boundary: Quantity = 0 |

**Coverage:** 3 Test Cases covering valid, invalid, and boundary scenarios  
**Status:** ⬜ Not Tested

---

### BR_03: Các trường bắt buộc nhập: Tên hoa, Giá bán

| Test Case ID | Validates BR_03 | Test Scenario |
|--------------|-----------------|---------------|
| TC_ADDPROD_001 | ✅ Yes | Valid: All required fields filled |
| TC_ADDPROD_006 | ✅ Yes | Invalid: Tên hoa empty |
| TC_ADDPROD_007 | ✅ Yes | Invalid: Giá bán empty |
| TC_ADDPROD_008 | ✅ Yes | Valid/Invalid: Loại hoa empty (test if optional) |

**Coverage:** 4 Test Cases covering required field validation  
**Status:** ⬜ Not Tested

---

## 3. Overall Traceability Summary

### 3.1 Requirements Coverage Table

| Requirement Type | ID | Description | Test Cases | Status |
|------------------|-----|-------------|-----------|---------|
| Functional | FR_01 | Login | 8 | ⬜ Not Tested |
| Functional | FR_02 | Add Product | 13 | ⬜ Not Tested |
| Functional | FR_03 | Search | 13 | ⬜ Not Tested |
| Business Rule | BR_01 | Selling > Import Price | 3 | ⬜ Not Tested |
| Business Rule | BR_02 | Stock Quantity ≥ 0 | 3 | ⬜ Not Tested |
| Business Rule | BR_03 | Required Fields | 4 | ⬜ Not Tested |

**Total Requirements:** 6  
**Total Test Cases:** 34  
**Requirements Coverage:** 100%

---

### 3.2 Test Case Distribution By Priority

| Priority | Count | Percentage |
|----------|-------|------------|
| Critical | 5 | 14.7% |
| High | 13 | 38.2% |
| Medium | 13 | 38.2% |
| Low | 3 | 8.8% |
| **Total** | **34** | **100%** |

---

### 3.3 Test Case Distribution By Type

| Test Type | Count | Percentage |
|-----------|-------|------------|
| Positive Tests | 9 | 26.5% |
| Negative Tests | 17 | 50.0% |
| Boundary Tests | 5 | 14.7% |
| Security Tests | 3 | 8.8% |
| **Total** | **34** | **100%** |

---

## 4. Gap Analysis

### 4.1 Requirements Without Test Cases
✅ **NONE** - All functional requirements and business rules have corresponding test cases.

### 4.2 Orphan Test Cases (Test Cases Without Requirements)
✅ **NONE** - All 34 test cases are mapped to requirements.

### 4.3 Recommendations
- ✅ Coverage is complete for current SRS
- 🔶 Consider adding performance test cases nếu có requirements về response time
- 🔶 Consider adding usability test cases cho UI/UX
- 🔶 Consider adding accessibility test cases nếu cần thiết

---

## 5. Test Execution Tracking

### 5.1 Current Status (Updated: ________)

| Module | Total TCs | Executed | Passed | Failed | Blocked | Pass Rate |
|--------|-----------|----------|--------|--------|---------|-----------|
| Login (FR_01) | 8 | 0 | 0 | 0 | 0 | 0% |
| Add Product (FR_02) | 13 | 0 | 0 | 0 | 0 | 0% |
| Search (FR_03) | 13 | 0 | 0 | 0 | 0 | 0% |
| **TOTAL** | **34** | **0** | **0** | **0** | **0** | **0%** |

### 5.2 Defects By Requirement

| Requirement | Critical Bugs | High Bugs | Medium Bugs | Low Bugs | Total |
|-------------|---------------|-----------|-------------|----------|-------|
| FR_01 (Login) | 0 | 0 | 0 | 0 | 0 |
| FR_02 (Add Product) | 0 | 0 | 0 | 0 | 0 |
| FR_03 (Search) | 0 | 0 | 0 | 0 | 0 |
| Business Rules | 0 | 0 | 0 | 0 | 0 |
| **TOTAL** | **0** | **0** | **0** | **0** | **0** |

---

## 6. Sign-Off

| Role | Name | Date | Signature |
|------|------|------|-----------|
| Test Lead | | | |
| QA Manager | | | |
| Project Manager | | | |

---

## Ghi Chú
- ✅ = Completed/Passed
- ⬜ = Not Started/Not Tested
- 🔶 = In Progress
- ❌ = Failed
- ⛔ = Blocked
