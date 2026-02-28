# Test Cases - Smoke Testing
**Module:** All Core Modules  
**Feature:** Critical Happy-Path Verification  
**Objective:** Xac nhan cac chuc nang cot loi hoat dong dung sau moi lan build/deploy moi. Neu bat ky Smoke Test nao FAIL, build bi reject ngay.

---

## TC_SMOKE_001: Khoi Dong Ung Dung Thanh Cong

**Muc dich:** Verify ung dung khoi dong khong bi crash va hien thi man hinh Login

**Preconditions:**
- JDK va MySQL Server da duoc cai dat va cau hinh dung
- Database `flowershop` da ton tai voi schema hop le
- File JAR hoac project source code san sang chay

**Priority:** Critical  
**Type:** Smoke Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Chay ung dung (double-click JAR hoac `mvn exec:java`) | |
| 2 | Quan sat man hinh khoi dong | |
| 3 | Cho man hinh Login hien thi hoan chinh | |

**Expected Result:**
- Ung dung khoi dong khong co Exception hoac crash
- Man hinh Login hien thi dung voi cac truong Username, Password va nut Login
- Ket noi Database thanh cong (khong co loi connection trong console)
- Thoi gian khoi dong < 10 giay

**Actual Result:** _(Dien khi thuc thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SMOKE_002: Dang Nhap Va Truy Cap Dashboard

**Muc dich:** Verify quy trinh dang nhap co ban hoat dong dung va user co the vao man hinh chinh

**Preconditions:**
- Ung dung da khoi dong thanh cong (TC_SMOKE_001 PASS)
- Tai khoan `admin` / `admin123` ton tai trong database
- Tai khoan chua bi khoa

**Priority:** Critical  
**Type:** Smoke Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Nhap Username | `admin` |
| 2 | Nhap Password | `admin123` |
| 3 | Click nut "Login" | |
| 4 | Quan sat man hinh Dashboard/Main | |

**Expected Result:**
- Dang nhap thanh cong, chuyen sang man hinh chinh
- Menu dieu huong (sidebar/menubar) hien thi day du cac chuc nang
- Khong co loi hoac exception hien thi
- Ten nguoi dung hien thi tren giao dien

**Actual Result:** _(Dien khi thuc thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_SMOKE_003: Hien Thi Danh Sach San Pham

**Muc dich:** Verify chuc nang doc va hien thi du lieu tu database hoat dong dung

**Preconditions:**
- User da dang nhap thanh cong (TC_SMOKE_002 PASS)
- Database co it nhat 1 san pham da duoc them truoc do
- Man hinh Inventory/Product List co the truy cap

**Priority:** Critical  
**Type:** Smoke Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Click vao menu "Inventory" hoac "Product List" | |
| 2 | Cho danh sach san pham tai hoan tat | |
| 3 | Kiem tra du lieu hien thi trong bang (JTable) | |

**Expected Result:**
- Bang danh sach san pham hien thi dung voi cac cot: ID, Ten hoa, Loai, Gia nhap, Gia ban, So luong
- Du lieu khop voi du lieu trong database
- Khong co dong rong hoac du lieu bi loi (null/NaN)
- Thanh cuon (scrollbar) hoat dong neu co nhieu san pham

**Actual Result:** _(Dien khi thuc thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tieu Chi | Gia Tri |
|----------|---------|
| Tong so Test Cases | 3 |
| Critical Priority | 3 |
| Smoke Tests | 3 |
| Thoi gian thuc thi du kien | 5-10 phut |
| Dieu kien PASS | Tat ca 3/3 cases phai PASS |
| Hanh dong khi FAIL | Reject build, bao dev team fix ngay |
