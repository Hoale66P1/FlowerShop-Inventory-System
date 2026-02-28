# Test Cases - Regression Testing
**Module:** Inventory Management, Authentication  
**Feature:** Regression Verification  
**Objective:** Dam bao cac chuc nang da hoat dong khong bi anh huong sau khi co thay doi code, fix bug, hoac them tinh nang moi.

---

## TC_REG_001: Them San Pham Van Hoat Dong Sau Khi Cap Nhat Logic Tim Kiem

**Muc dich:** Verify chuc nang Add Product khong bi anh huong sau khi sua doi code cua module Search

**Preconditions:**
- User da dang nhap thanh cong
- Module Search vua duoc cap nhat (code change/fix bug)
- Database ket noi binh thuong
- Man hinh "Add Product" co the truy cap

**Priority:** High  
**Type:** Regression Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Mo man hinh "Add Product" | |
| 2 | Nhap Ten hoa | `Hoa Ly Vang` |
| 3 | Nhap Loai hoa | `Hoa Ly` |
| 4 | Nhap Gia nhap | `45000` |
| 5 | Nhap Gia ban | `75000` |
| 6 | Nhap So luong ton kho | `30` |
| 7 | Click nut "Save" | |
| 8 | Mo man hinh "Product List" de xac nhan | |
| 9 | Tim kiem san pham vua them | `Hoa Ly Vang` |

**Expected Result:**
- San pham duoc luu thanh cong vao database
- Hien thi thong bao "Them san pham thanh cong"
- San pham xuat hien trong danh sach Inventory voi du lieu chinh xac
- Tim kiem san pham vua them tra ve ket qua dung
- Validation rules (Gia ban > Gia nhap, So luong >= 0) van hoat dong binh thuong

**Actual Result:** _(Dien khi thuc thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## TC_REG_002: Khoa Tai Khoan Sau 3 Lan Login Sai Van Hoat Dong Sau Khi Them Quyen Moi

**Muc dich:** Verify co che bao mat khoa tai khoan khong bi mat sau khi cap nhat he thong phan quyen

**Preconditions:**
- He thong phan quyen vua duoc cap nhat (them role moi hoac sua logic authorization)
- Tai khoan `regtest_user` ton tai trong database (password: `regtest123`)
- Tai khoan chua bi khoa, so lan login that bai = 0

**Priority:** Critical  
**Type:** Regression Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Mo ung dung, hien thi man hinh Login | |
| 2 | Nhap Username | `regtest_user` |
| 3 | Nhap Password sai (lan 1) | `wrong_pass_1` |
| 4 | Click "Login" | |
| 5 | Verify thong bao loi "Username hoac Password khong dung" | |
| 6 | Nhap Password sai (lan 2) | `wrong_pass_2` |
| 7 | Click "Login" | |
| 8 | Verify thong bao loi lan 2 | |
| 9 | Nhap Password sai (lan 3) | `wrong_pass_3` |
| 10 | Click "Login" | |
| 11 | Verify tai khoan bi khoa | |
| 12 | Nhap Password dung | `regtest123` |
| 13 | Click "Login" | |

**Expected Result:**
- Sau lan that bai thu 3: Hien thi "Tai khoan da bi khoa do dang nhap sai qua 3 lan"
- Tai khoan bi danh dau isLocked = true trong database
- Login voi password dung o buoc 12 van bi reject vi tai khoan da khoa
- Hien thi thong bao "Tai khoan da bi khoa. Vui long lien he quan tri vien"
- Co che khoa khong bi anh huong boi cac thay doi ve phan quyen

**Actual Result:** _(Dien khi thuc thi test)_  
**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tieu Chi | Gia Tri |
|----------|---------|
| Tong so Test Cases | 2 |
| Critical Priority | 1 |
| High Priority | 1 |
| Regression Tests | 2 |
| Trigger chay Regression | Sau moi code change, bug fix, hoac them tinh nang moi |
| Dieu kien PASS | Tat ca 2/2 cases phai PASS |
