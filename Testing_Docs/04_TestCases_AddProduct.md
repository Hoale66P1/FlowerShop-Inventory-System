# Test Cases - Add Product (FR_02)
**Module:** Inventory Management  
**Feature:** Add New Product  
**Requirement:** FR_02 - Cho phép thêm hoa mới với các trường: Tên hoa, Loại hoa, Giá nhập, Giá bán, Số lượng tồn kho.

**Business Rules:**
- BR_01: Giá bán (Selling Price) phải lớn hơn Giá nhập (Import Price)
- BR_02: Số lượng tồn kho (Stock Quantity) không được là số âm
- BR_03: Các trường bắt buộc nhập: Tên hoa, Giá bán

---

## TC_ADDPROD_001: Thêm Sản Phẩm Thành Công Với Dữ Liệu Hợp Lệ

**Mục đích:** Verify có thể thêm sản phẩm mới với tất cả thông tin hợp lệ

**Preconditions:**
- User đã đăng nhập thành công
- Màn hình "Add Product" đang mở
- Database kết nối bình thường

**Priority:** Critical  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hồng Đỏ` |
| 2 | Nhập Loại hoa | `Hoa Hồng` |
| 3 | Nhập Giá nhập | `50000` |
| 4 | Nhập Giá bán | `80000` |
| 5 | Nhập Số lượng tồn kho | `100` |
| 6 | Click nút "Save" hoặc "Add" | |

**Expected Result:**
- ✅ Sản phẩm được lưu thành công vào database
- ✅ Hiển thị thông báo: "Thêm sản phẩm thành công"
- ✅ Sản phẩm xuất hiện trong danh sách inventory
- ✅ Form được reset hoặc quay về danh sách sản phẩm
- ✅ Tất cả thông tin trong database khớp với dữ liệu nhập

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_002: Validation BR_01 - Giá Bán Phải Lớn Hơn Giá Nhập

**Mục đích:** Verify hệ thống validate giá bán > giá nhập

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Critical  
**Type:** Business Rule Validation

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Cúc Vàng` |
| 2 | Nhập Loại hoa | `Hoa Cúc` |
| 3 | Nhập Giá nhập | `100000` |
| 4 | Nhập Giá bán (nhỏ hơn giá nhập) | `80000` |
| 5 | Nhập Số lượng tồn kho | `50` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo lỗi: "Giá bán phải lớn hơn giá nhập"
- ✅ Sản phẩm KHÔNG được lưu vào database
- ✅ Focus vào trường Giá bán để sửa
- ✅ Các trường khác giữ nguyên dữ liệu đã nhập

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_003: Validation BR_01 - Giá Bán Bằng Giá Nhập (Boundary)

**Mục đích:** Verify hệ thống reject khi giá bán = giá nhập

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** High  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Lan Hồ Điệp` |
| 2 | Nhập Loại hoa | `Hoa Lan` |
| 3 | Nhập Giá nhập | `200000` |
| 4 | Nhập Giá bán (bằng giá nhập) | `200000` |
| 5 | Nhập Số lượng tồn kho | `20` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo lỗi: "Giá bán phải lớn hơn giá nhập"
- ✅ Sản phẩm KHÔNG được lưu vào database

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_004: Validation BR_02 - Số Lượng Tồn Kho Không Âm

**Mục đích:** Verify hệ thống reject số lượng tồn kho âm

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** High  
**Type:** Business Rule Validation

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hướng Dương` |
| 2 | Nhập Loại hoa | `Hoa Hướng Dương` |
| 3 | Nhập Giá nhập | `30000` |
| 4 | Nhập Giá bán | `50000` |
| 5 | Nhập Số lượng tồn kho (số âm) | `-10` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo lỗi: "Số lượng tồn kho không được là số âm"
- ✅ Sản phẩm KHÔNG được lưu
- ✅ Focus vào trường Số lượng tồn kho

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_005: Boundary Test - Số Lượng Tồn Kho = 0

**Mục đích:** Verify có thể thêm sản phẩm với số lượng = 0

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Medium  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Tulip Trắng` |
| 2 | Nhập Loại hoa | `Hoa Tulip` |
| 3 | Nhập Giá nhập | `60000` |
| 4 | Nhập Giá bán | `90000` |
| 5 | Nhập Số lượng tồn kho | `0` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Sản phẩm được lưu thành công (0 không phải số âm)
- ✅ Hiển thị thông báo: "Thêm sản phẩm thành công"
- ✅ Số lượng trong database = 0

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_006: Validation BR_03 - Trường Bắt Buộc: Tên Hoa

**Mục đích:** Verify không thể thêm sản phẩm nếu để trống Tên hoa

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Để trống Tên hoa | _(empty)_ |
| 2 | Nhập Loại hoa | `Hoa Cẩm Chướng` |
| 3 | Nhập Giá nhập | `40000` |
| 4 | Nhập Giá bán | `70000` |
| 5 | Nhập Số lượng tồn kho | `30` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị lỗi: "Tên hoa là trường bắt buộc"
- ✅ Sản phẩm KHÔNG được lưu
- ✅ Focus vào trường Tên hoa

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_007: Validation BR_03 - Trường Bắt Buộc: Giá Bán

**Mục đích:** Verify không thể thêm sản phẩm nếu để trống Giá bán

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Đồng Tiền` |
| 2 | Nhập Loại hoa | `Hoa Đồng Tiền` |
| 3 | Nhập Giá nhập | `25000` |
| 4 | Để trống Giá bán | _(empty)_ |
| 5 | Nhập Số lượng tồn kho | `40` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị lỗi: "Giá bán là trường bắt buộc"
- ✅ Sản phẩm KHÔNG được lưu
- ✅ Focus vào trường Giá bán

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_008: Thêm Sản Phẩm Với Loại Hoa Rỗng (Optional Field)

**Mục đích:** Verify có thể thêm sản phẩm nếu Loại hoa để trống (nếu không bắt buộc)

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Medium  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hoa Không Loại` |
| 2 | Để trống Loại hoa | _(empty)_ |
| 3 | Nhập Giá nhập | `35000` |
| 4 | Nhập Giá bán | `55000` |
| 5 | Nhập Số lượng tồn kho | `25` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Sản phẩm được lưu thành công (nếu Loại hoa không required)
- ✅ Hoặc hiển thị lỗi nếu Loại hoa là required

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_009: Validation - Giá Nhập và Giá Bán Phải Là Số

**Mục đích:** Verify hệ thống validate data type cho giá

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hoa Test` |
| 2 | Nhập Loại hoa | `Test` |
| 3 | Nhập Giá nhập (text) | `abc123` |
| 4 | Nhập Giá bán (text) | `xyz456` |
| 5 | Nhập Số lượng tồn kho | `10` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị lỗi: "Giá nhập và Giá bán phải là số"
- ✅ Hoặc không cho phép nhập ký tự không phải số vào trường
- ✅ Sản phẩm KHÔNG được lưu

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_010: Validation - Số Lượng Phải Là Số Nguyên

**Mục đích:** Verify số lượng tồn kho phải là số nguyên

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hoa Linh Lan` |
| 2 | Nhập Loại hoa | `Linh Lan` |
| 3 | Nhập Giá nhập | `45000` |
| 4 | Nhập Giá bán | `75000` |
| 5 | Nhập Số lượng tồn kho (số thập phân) | `10.5` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống hiển thị lỗi: "Số lượng tồn kho phải là số nguyên"
- ✅ Hoặc tự động làm tròn số
- ✅ Hoặc không cho phép nhập số thập phân

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_011: Thêm Sản Phẩm Với Tên Trùng Lặp

**Mục đích:** Verify hành vi khi thêm sản phẩm có tên trùng

**Preconditions:**
- User đã đăng nhập
- Database đã có sản phẩm tên "Hồng Đỏ"

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa (trùng với sản phẩm đã có) | `Hồng Đỏ` |
| 2 | Nhập Loại hoa | `Hoa Hồng` |
| 3 | Nhập Giá nhập | `55000` |
| 4 | Nhập Giá bán | `85000` |
| 5 | Nhập Số lượng tồn kho | `60` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống cho phép thêm (nếu không có unique constraint)
- ✅ Hoặc hiển thị cảnh báo: "Sản phẩm với tên này đã tồn tại. Bạn có muốn tiếp tục?"
- ✅ Hoặc reject và báo lỗi duplicate

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_012: Boundary Test - Giá Trị Lớn

**Mục đích:** Verify hệ thống xử lý giá trị số lớn

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Low  
**Type:** Boundary Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa | `Hoa Đặc Biệt` |
| 2 | Nhập Loại hoa | `Đặc Biệt` |
| 3 | Nhập Giá nhập | `9999999` |
| 4 | Nhập Giá bán | `99999999` |
| 5 | Nhập Số lượng tồn kho | `999999` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Sản phẩm được lưu thành công (nếu trong giới hạn data type)
- ✅ Hoặc hiển thị lỗi nếu vượt quá giới hạn

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_ADDPROD_013: Special Characters Trong Tên Hoa

**Mục đích:** Verify hệ thống xử lý ký tự đặc biệt

**Preconditions:**
- User đã đăng nhập
- Màn hình "Add Product" đang mở

**Priority:** Low  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Tên hoa (có ký tự đặc biệt) | `Hoa @#$% & *` |
| 2 | Nhập Loại hoa | `Test` |
| 3 | Nhập Giá nhập | `30000` |
| 4 | Nhập Giá bán | `50000` |
| 5 | Nhập Số lượng tồn kho | `20` |
| 6 | Click nút "Save" | |

**Expected Result:**
- ✅ Hệ thống cho phép lưu (nếu accept special chars)
- ✅ Hoặc hiển thị lỗi: "Tên hoa không được chứa ký tự đặc biệt"

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tổng số Test Cases | 13 |
|-------------------|---|
| Critical Priority | 2 |
| High Priority | 5 |
| Medium Priority | 5 |
| Low Priority | 1 |
| Positive Tests | 3 |
| Negative Tests | 7 |
| Business Rule Tests | 3 |
| Boundary Tests | 3 |
