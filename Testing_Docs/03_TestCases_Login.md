# Test Cases - Login (FR_01)
**Module:** Authentication  
**Feature:** User Login  
**Requirement:** FR_01 - Nhân viên phải đăng nhập được bằng Username/Password hợp lệ. Hệ thống phải chặn đăng nhập nếu sai thông tin quá 3 lần.

---

## TC_LOGIN_001: Đăng Nhập Thành Công Với Thông Tin Hợp Lệ

**Mục đích:** Verify nhân viên có thể đăng nhập thành công với username và password đúng

**Preconditions (Điều kiện tiên quyết):**
- Application đã được khởi động
- User account đã tồn tại trong database (username: `admin`, password: `admin123`)
- Tài khoản chưa bị khóa

**Priority:** High  
**Type:** Positive Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Mở ứng dụng và hiển thị màn hình Login | |
| 2 | Nhập Username | `admin` |
| 3 | Nhập Password | `admin123` |
| 4 | Click nút "Login" | |

**Expected Result (Kết quả mong đợi):**
- ✅ Hệ thống xác thực thành công
- ✅ Chuyển hướng đến màn hình Main Dashboard
- ✅ Hiển thị thông báo "Đăng nhập thành công" hoặc welcome message
- ✅ Username hiển thị trên giao diện chính

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_002: Đăng Nhập Thất Bại - Username Sai

**Mục đích:** Verify hệ thống reject login khi username không tồn tại

**Preconditions:**
- Application đã được khởi động
- Username `wronguser` không tồn tại trong database

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Mở ứng dụng và hiển thị màn hình Login | |
| 2 | Nhập Username không tồn tại | `wronguser` |
| 3 | Nhập Password bất kỳ | `anypassword` |
| 4 | Click nút "Login" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo lỗi: "Username hoặc Password không đúng"
- ✅ Không chuyển hướng đến màn hình chính
- ✅ Các trường Username và Password được giữ nguyên hoặc clear
- ✅ Số lần login thất bại được tăng lên 1

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_003: Đăng Nhập Thất Bại - Password Sai

**Mục đích:** Verify hệ thống reject login khi password sai

**Preconditions:**
- Application đã được khởi động
- User account tồn tại (username: `admin`, password đúng: `admin123`)
- Tài khoản chưa bị khóa

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Mở ứng dụng và hiển thị màn hình Login | |
| 2 | Nhập Username đúng | `admin` |
| 3 | Nhập Password sai | `wrongpassword` |
| 4 | Click nút "Login" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo lỗi: "Username hoặc Password không đúng"
- ✅ Không chuyển hướng đến màn hình chính
- ✅ Số lần login thất bại được tăng lên 1

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_004: Đăng Nhập Thất Bại - Username và Password Rỗng

**Mục đích:** Verify hệ thống validate required fields

**Preconditions:**
- Application đã được khởi động

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Mở ứng dụng và hiển thị màn hình Login | |
| 2 | Để trống Username | _(empty)_ |
| 3 | Để trống Password | _(empty)_ |
| 4 | Click nút "Login" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo: "Vui lòng nhập Username và Password"
- ✅ Không thực hiện xác thực
- ✅ Không chuyển hướng

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_005: Khóa Tài Khoản Sau 3 Lần Đăng Nhập Sai

**Mục đích:** Verify hệ thống khóa tài khoản sau 3 lần đăng nhập sai liên tiếp

**Preconditions:**
- Application đã được khởi động
- User account tồn tại (username: `testuser`, password: `test123`)
- Tài khoản chưa bị khóa
- Số lần login thất bại = 0

**Priority:** Critical  
**Type:** Security Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Username đúng | `testuser` |
| 2 | Nhập Password sai (lần 1) | `wrongpass1` |
| 3 | Click "Login" | |
| 4 | Verify thông báo lỗi hiển thị | |
| 5 | Nhập Username đúng | `testuser` |
| 6 | Nhập Password sai (lần 2) | `wrongpass2` |
| 7 | Click "Login" | |
| 8 | Verify thông báo lỗi hiển thị | |
| 9 | Nhập Username đúng | `testuser` |
| 10 | Nhập Password sai (lần 3) | `wrongpass3` |
| 11 | Click "Login" | |

**Expected Result:**
- ✅ Sau lần thất bại thứ 3: Hệ thống hiển thị "Tài khoản đã bị khóa do đăng nhập sai quá 3 lần"
- ✅ Tài khoản bị khóa trong database
- ✅ Không thể đăng nhập ngay cả với password đúng cho đến khi unlock

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_006: Không Thể Đăng Nhập Với Tài Khoản Đã Bị Khóa

**Mục đích:** Verify không thể login với tài khoản đã bị khóa

**Preconditions:**
- User account `lockeduser` đã bị khóa trong database (isLocked = true)
- Password đúng của account là `locked123`

**Priority:** High  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Username của tài khoản bị khóa | `lockeduser` |
| 2 | Nhập Password đúng | `locked123` |
| 3 | Click "Login" | |

**Expected Result:**
- ✅ Hệ thống hiển thị thông báo: "Tài khoản đã bị khóa. Vui lòng liên hệ quản trị viên"
- ✅ Không chuyển hướng đến màn hình chính
- ✅ Login không thành công

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_007: Password Case Sensitive

**Mục đích:** Verify password phân biệt chữ hoa/thường

**Preconditions:**
- User account tồn tại (username: `admin`, password: `Admin123` - có chữ A hoa)

**Priority:** Medium  
**Type:** Negative Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Username | `admin` |
| 2 | Nhập Password với case khác | `admin123` _(lowercase a)_ |
| 3 | Click "Login" | |

**Expected Result:**
- ✅ Hệ thống hiển thị lỗi "Username hoặc Password không đúng"
- ✅ Login thất bại

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_LOGIN_008: SQL Injection Prevention

**Mục đích:** Verify hệ thống chống SQL injection trong login form

**Preconditions:**
- Application đã được khởi động
- Database có user `admin` với password `admin123`

**Priority:** Critical  
**Type:** Security Test

**Test Steps:**

| Bước | Hành Động | Dữ Liệu Đầu Vào |
|------|-----------|-----------------|
| 1 | Nhập Username với SQL injection | `' OR '1'='1` |
| 2 | Nhập Password với SQL injection | `' OR '1'='1` |
| 3 | Click "Login" | |

**Expected Result:**
- ✅ Hệ thống không bị bypass authentication
- ✅ Hiển thị thông báo lỗi đăng nhập thất bại
- ✅ Không có lỗi database hiển thị
- ✅ Không đăng nhập được

**Actual Result:** _(Điền khi thực thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tổng số Test Cases | 8 |
|-------------------|---|
| Critical Priority | 2 |
| High Priority | 4 |
| Medium Priority | 2 |
| Positive Tests | 1 |
| Negative Tests | 6 |
| Security Tests | 2 |
