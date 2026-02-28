# Test Cases - Performance Testing
**Module:** Database Layer, UI Rendering  
**Feature:** Response Time and UI Responsiveness  
**Objective:** Do luong thoi gian phan hoi cua Database va UI tren Desktop app (Java Swing), dam bao trai nghiem nguoi dung khong bi gian doan.

**Environment:**
- Application: Java Swing Desktop App
- Database: MySQL (local hoac remote)
- OS: Windows 10/11
- RAM: >= 4 GB
- Tool do thoi gian: Stopwatch thu cong hoac `System.currentTimeMillis()` trong code

---

## TC_PERF_001: Thoi Gian Tai Danh Sach San Pham Tu Database

**Muc dich:** Do thoi gian query va hien thi danh sach san pham len JTable khi co luong du lieu lon

**Preconditions:**
- User da dang nhap thanh cong
- Database co tu 500 den 1000 ban ghi san pham
- Ket noi database on dinh (local MySQL)
- Khong co process nang khac dang chay tren may

**Priority:** High  
**Type:** Performance Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Bat dau do thoi gian (Stopwatch hoac log timestamp) | |
| 2 | Click vao menu "Inventory" hoac "Product List" | |
| 3 | Cho danh sach san pham hien thi hoan tat tren JTable | |
| 4 | Dung do thoi gian | |
| 5 | Ghi nhan thoi gian phan hoi | |

**Tieu Chi Chap Nhan (Acceptance Criteria):**

| Metric | Muc Tieu | Muc Toi Da Chap Nhan |
|--------|----------|----------------------|
| Thoi gian query DB (500 records) | < 1 giay | < 2 giay |
| Thoi gian render JTable | < 1 giay | < 2 giay |
| Tong thoi gian end-to-end | < 2 giay | < 3 giay |
| UI freeze | Khong | Khong |

**Expected Result:**
- Danh sach san pham tai va hien thi hoan tat trong < 3 giay (end-to-end)
- UI khong bi freeze hoac "Not Responding" trong qua trinh tai du lieu
- Thanh cuon JTable hoat dong muot ma
- Neu thoi gian > 2 giay: co hien thi loading indicator (progress bar hoac cursor wait)

**Actual Result:** _(Dien khi thuc thi test)_

| Metric | Ket Qua Do Duoc | Dat/Khong Dat |
|--------|-----------------|---------------|
| Thoi gian query DB | _(ms)_ | _(Dat/Khong Dat)_ |
| Thoi gian render JTable | _(ms)_ | _(Dat/Khong Dat)_ |
| Tong thoi gian end-to-end | _(ms)_ | _(Dat/Khong Dat)_ |
| UI freeze | _(Co/Khong)_ | _(Dat/Khong Dat)_ |

**Status:** _(Pass/Fail/Blocked)_

---

## TC_PERF_002: Thoi Gian Phan Hoi Cua Chuc Nang Tim Kiem

**Muc dich:** Do thoi gian tu khi user click "Search" den khi ket qua hien thi tren UI

**Preconditions:**
- User da dang nhap thanh cong
- Database co tu 500 den 1000 ban ghi san pham
- Man hinh Search dang mo
- Tu khoa tim kiem se tra ve nhieu ket qua (khoang 50+ records)

**Priority:** High  
**Type:** Performance Test

**Test Steps:**

| Buoc | Hanh Dong | Du Lieu Dau Vao |
|------|-----------|-----------------|
| 1 | Nhap tu khoa tim kiem pho bien | `Hoa` |
| 2 | Bat dau do thoi gian | |
| 3 | Click nut "Search" hoac nhan Enter | |
| 4 | Cho ket qua hien thi hoan tat tren UI | |
| 5 | Dung do thoi gian | |
| 6 | Ghi nhan so luong ket qua va thoi gian | |

**Tieu Chi Chap Nhan (Acceptance Criteria):**

| Metric | Muc Tieu | Muc Toi Da Chap Nhan |
|--------|----------|----------------------|
| Thoi gian query DB (Search) | < 500ms | < 1 giay |
| Thoi gian hien thi ket qua len UI | < 500ms | < 1 giay |
| Tong thoi gian end-to-end | < 1 giay | < 2 giay |
| UI freeze | Khong | Khong |

**Expected Result:**
- Ket qua tim kiem hien thi trong < 2 giay
- UI van responsive trong qua trinh search (co the click/interact voi cac thanh phan khac)
- So luong ket qua hien thi chinh xac
- Khong co hien tuong "Not Responding" tren title bar cua window

**Actual Result:** _(Dien khi thuc thi test)_

| Metric | Ket Qua Do Duoc | Dat/Khong Dat |
|--------|-----------------|---------------|
| Thoi gian query DB | _(ms)_ | _(Dat/Khong Dat)_ |
| Thoi gian hien thi ket qua | _(ms)_ | _(Dat/Khong Dat)_ |
| Tong thoi gian end-to-end | _(ms)_ | _(Dat/Khong Dat)_ |
| UI freeze | _(Co/Khong)_ | _(Dat/Khong Dat)_ |

**Status:** _(Pass/Fail/Blocked)_

---

## Test Summary

| Tieu Chi | Gia Tri |
|----------|---------|
| Tong so Test Cases | 2 |
| High Priority | 2 |
| Performance Tests | 2 |
| Database size yeu cau | 500-1000 records |
| Tool do luong | Stopwatch / System.currentTimeMillis() |
| Tieu chi PASS tong the | Tat ca metric dat muc "Muc Toi Da Chap Nhan" |
