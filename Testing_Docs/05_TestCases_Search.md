# Test Cases - Search Product (FR_03)
**Module:** Inventory Management  
**Feature:** Search Product  
**Requirement:** FR_03 - Tìm kiếm hoa theo Tên hoặc ID

---

## TC_SEARCH_001: Tìm Kiếm Theo Tên - Exact Match

**Mục đích:** Verify tìm kiếm chính xác theo tên sản phẩm

**Preconditions:**
- User đã đăng nhập
- Database có sản phẩm "Hồng Đỏ" (ID: 1)
- Màn hình Search đang mở

**Priority:** High  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập tên sản phẩm vào search box | `Hồng Đỏ` |
| 2 | Click nút "Search" hoặc nhấn Enter | |

**Expected Result:**
- ✅ Hệ thống trả về sản phẩm "Hồng Đỏ"
- ✅ Hiển thị đầy đủ thông tin: ID, Tên, Loại, Giá nhập, Giá bán, Số lượng
- ✅ Kết quả tìm kiếm chỉ chứa sản phẩm khớp với tên

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_002: Tìm Kiếm Theo Tên - Partial Match

**Mục đích:** Verify tìm kiếm với từ khóa một phần

**Preconditions:**
- User đã đăng nhập
- Database có các sản phẩm: "Hồng Đỏ", "Hồng Trắng", "Hồng Vàng"

**Priority:** High  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập từ khóa một phần | `Hồng` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống trả về TẤT CẢ sản phẩm có chứa từ "Hồng"
- ✅ Kết quả bao gồm: "Hồng Đỏ", "Hồng Trắng", "Hồng Vàng"
- ✅ Hiển thị số lượng kết quả tìm được (ví dụ: "Tìm thấy 3 sản phẩm")

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_003: Tìm Kiếm Theo ID - Exact Match

**Mục đích:** Verify tìm kiếm theo ID sản phẩm

**Preconditions:**
- User đã đăng nhập
- Database có sản phẩm với ID = 5 (Tên: "Lan Hồ Điệp")

**Priority:** High  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập ID sản phẩm | `5` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống trả về đúng sản phẩm có ID = 5
- ✅ Hiển thị thông tin: "Lan Hồ Điệp" và các thông tin khác
- ✅ Chỉ có 1 kết quả (vì ID là unique)

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_004: Tìm Kiếm Với ID Không Tồn Tại

**Mục đích:** Verify hành vi khi tìm kiếm ID không tồn tại

**Preconditions:**
- User đã đăng nhập
- Database KHÔNG có sản phẩm với ID = 9999

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập ID không tồn tại | `9999` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống hiển thị: "Không tìm thấy sản phẩm"
- ✅ Danh sách kết quả rỗng
- ✅ Không có lỗi hệ thống

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_005: Tìm Kiếm Với Tên Không Tồn Tại

**Mục đích:** Verify hành vi khi tìm kiếm tên không khớp

**Preconditions:**
- User đã đăng nhập
- Database không có sản phẩm nào tên "XYZ123ABC"

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập tên không tồn tại | `XYZ123ABC` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống hiển thị: "Không tìm thấy sản phẩm"
- ✅ Danh sách kết quả rỗng
- ✅ Không có lỗi

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_006: Tìm Kiếm Với Search Box Rỗng

**Mục đích:** Verify hành vi khi tìm kiếm với từ khóa rỗng

**Preconditions:**
- User đã đăng nhập
- Database có nhiều sản phẩm

**Priority:** Medium  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Để trống search box | _(empty)_ |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống hiển thị TẤT CẢ sản phẩm trong database
- ✅ Hoặc hiển thị thông báo: "Vui lòng nhập từ khóa tìm kiếm"
- ✅ Không bị crash

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_007: Tìm Kiếm Case Insensitive

**Mục đích:** Verify tìm kiếm không phân biệt chữ hoa/thường

**Preconditions:**
- User đã đăng nhập
- Database có sản phẩm "Hồng Đỏ"

**Priority:** Medium  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập tên với lowercase | `hồng đỏ` |
| 2 | Click nút "Search" | |
| 3 | Clear và nhập với UPPERCASE | `HỒNG ĐỎ` |
| 4 | Click nút "Search" | |

**Expected Result:**
- ✅ Cả 2 lần tìm kiếm đều trả về sản phẩm "Hồng Đỏ"
- ✅ Tìm kiếm không phân biệt hoa/thường

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_008: Tìm Kiếm Với Khoảng Trắng Đầu/Cuối

**Mục đích:** Verify hệ thống trim whitespace

**Preconditions:**
- User đã đăng nhập
- Database có sản phẩm "Cúc Vàng"

**Priority:** Low  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập tên với spaces đầu/cuối | `  Cúc Vàng  ` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống tự động trim spaces
- ✅ Trả về sản phẩm "Cúc Vàng"
- ✅ Kết quả giống như search "Cúc Vàng" không có spaces

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_009: Tìm Kiếm Với Ký Tự Đặc Biệt

**Mục đích:** Verify hệ thống xử lý special characters

**Preconditions:**
- User đã đăng nhập
- Database có hoặc không có sản phẩm với special chars

**Priority:** Low  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập từ khóa có ký tự đặc biệt | `%@#$` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống không bị crash hoặc SQL injection
- ✅ Trả về "Không tìm thấy" hoặc kết quả hợp lệ
- ✅ Không có lỗi database

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_010: Tìm Kiếm SQL Injection Prevention

**Mục đích:** Verify bảo mật chống SQL injection

**Preconditions:**
- User đã đăng nhập

**Priority:** Critical  
**Type:** Security Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập SQL injection pattern | `' OR '1'='1` |
| 2 | Click nút "Search" | |
| 3 | Thử pattern khác | `'; DROP TABLE products; --` |
| 4 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống KHÔNG bị bypass
- ✅ Trả về "Không tìm thấy" hoặc treat as normal text
- ✅ Database KHÔNG bị modify/delete
- ✅ Không hiển thị lỗi SQL

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_011: Tìm Kiếm Với Nhiều Kết Quả - Pagination

**Mục đích:** Verify hiển thị khi có nhiều kết quả

**Preconditions:**
- User đã đăng nhập
- Database có > 20 sản phẩm chứa từ "Hoa"

**Priority:** Medium  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập từ khóa phổ biến | `Hoa` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hiển thị tất cả kết quả (nếu không có pagination)
- ✅ Hoặc hiển thị trang đầu với pagination controls (Next, Previous)
- ✅ Hiển thị tổng số kết quả tìm được

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_012: Tìm Kiếm Kết Hợp ID và Tên

**Mục đích:** Verify logic tìm kiếm khi nhập cả số và chữ

**Preconditions:**
- User đã đăng nhập
- Database có sản phẩm ID=10, Tên="Hoa 10"

**Priority:** Low  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập số (có thể là ID hoặc part of name) | `10` |
| 2 | Click nút "Search" | |

**Expected Result:**
- ✅ Hệ thống tìm theo ID = 10 (nếu prioritize ID)
- ✅ Hoặc trả về cả ID=10 VÀ sản phẩm có tên chứa "10"
- ✅ Logic tìm kiếm rõ ràng và consistent

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SEARCH_013: Performance Test - Tìm Kiếm Nhanh

**Mục đích:** Verify thời gian response của search

**Preconditions:**
- User đã đăng nhập
- Database có 1000+ sản phẩm

**Priority:** Low  
**Type:** Performance Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập từ khóa tìm kiếm | `Hồng` |
| 2 | Click "Search" và đo thời gian response | |

**Expected Result:**
- ✅ Kết quả trả về trong < 2 giây
- ✅ UI không bị freeze
- ✅ Có loading indicator nếu search lâu

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tổng số Test Cases | 13 |
|-------------------|---|
| Critical Priority | 1 |
| High Priority | 4 |
| Medium Priority | 5 |
| Low Priority | 3 |
| Positive Tests | 5 |
| Negative Tests | 4 |
| Security Tests | 1 |
| Boundary Tests | 2 |
| Performance Tests | 1 |
