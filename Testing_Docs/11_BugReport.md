# Bug Report - Cac Loi Mau Thuong Gap
**Project:** FlowerShop Inventory System  
**Reporter:** QA Team  
**Environment:** Windows 10/11, Java 17, MySQL 8.0, Java Swing UI

---

## BUG_001: Gia Ban Hien Thi Sai Dinh Dang Khi Gia Tri Lon

**Bug ID:** BUG_001  
**Severity:** Medium  
**Priority:** High  
**Status:** Open

**Thong Tin Bug:**

| Truong | Noi Dung |
|--------|----------|
| Module | Inventory Management - Product List |
| Phien ban | v1.0 |
| Ngay phat hien | 2026-02-28 |
| Nguoi phat hien | QA Tester |
| Tai khoan test | admin / admin123 |

**Mo Ta:**
Khi san pham co gia ban >= 1,000,000 VND, gia tri hien thi trong JTable bi cat ngang hoac khong hien thi day du cac chu so. Cot "Gia ban" khong tu dong mo rong de hien thi het gia tri.

**Cac Buoc Tai Hien (Steps to Reproduce):**

| Buoc | Hanh Dong | Du Lieu |
|------|-----------|---------|
| 1 | Dang nhap voi tai khoan admin | admin / admin123 |
| 2 | Them san pham moi voi gia ban lon | Gia ban: `15000000` |
| 3 | Mo man hinh "Product List" | |
| 4 | Quan sat cot "Gia ban" cua san pham vua them | |

**Ket Qua Thuc Te (Actual Result):**
- Cot "Gia ban" hien thi `1500000...` (bi cat) hoac `1.5E7` (dinh dang khoa hoc)
- User khong doc duoc gia tri day du

**Ket Qua Mong Doi (Expected Result):**
- Gia ban hien thi day du: `15,000,000` hoac `15.000.000 VND`
- Cot tu dong mo rong hoac hien tooltip khi hover

**Ghi Chu Bo Sung:**
- Loi xay ra voi tat ca san pham co gia >= 7 chu so
- Cot khac (Gia nhap) cung bi anh huong tuong tu
- Workaround: Double-click cell de xem gia tri day du (neu co)

---

## BUG_002: Ung Dung Bi Freeze Khi Mat Ket Noi Database Giua Phien

**Bug ID:** BUG_002  
**Severity:** High  
**Priority:** Critical  
**Status:** Open

**Thong Tin Bug:**

| Truong | Noi Dung |
|--------|----------|
| Module | Database Connection / All Modules |
| Phien ban | v1.0 |
| Ngay phat hien | 2026-02-28 |
| Nguoi phat hien | QA Tester |
| Tai khoan test | admin / admin123 |

**Mo Ta:**
Khi ket noi MySQL bi mat dot ngot trong luc user dang su dung ung dung (vi du: MySQL service bi stop, mat mang), ung dung bi freeze hoan toan (Not Responding) thay vi hien thi thong bao loi va cho phep user thu lai.

**Cac Buoc Tai Hien (Steps to Reproduce):**

| Buoc | Hanh Dong | Du Lieu |
|------|-----------|---------|
| 1 | Dang nhap thanh cong | admin / admin123 |
| 2 | Mo man hinh "Product List" - xac nhan hoat dong binh thuong | |
| 3 | Dung MySQL Service (chay `net stop MySQL80` trong cmd) | |
| 4 | Quay lai ung dung, click "Search" hoac "Refresh" | |
| 5 | Quan sat trang thai ung dung | |

**Ket Qua Thuc Te (Actual Result):**
- Ung dung bi freeze 30-60 giay (hien "Not Responding" tren title bar)
- Sau do hien exception dialog: `com.mysql.cj.jdbc.exceptions.CommunicationsException`
- User khong the thao tac gi trong thoi gian freeze
- Trong mot so truong hop, ung dung khong hoi phuc va phai Force Close

**Ket Qua Mong Doi (Expected Result):**
- Hien thi thong bao loi than thien: "Mat ket noi database. Vui long kiem tra ket noi va thu lai"
- Nut "Thu lai" (Retry) de user ket noi lai
- UI khong bi freeze (su dung background thread cho DB operations)
- Connection timeout dat hop ly (5-10 giay)

**Ghi Chu Bo Sung:**
- Root cause: Database query dang chay tren EDT (Event Dispatch Thread) cua Swing
- Fix de xuat: Su dung SwingWorker hoac ExecutorService cho cac database operations
- Loi nay anh huong den tat ca cac module co tuong tac voi database

---

## BUG_003: Tim Kiem Tieng Viet Co Dau Khong Tra Ve Ket Qua Dung

**Bug ID:** BUG_003  
**Severity:** Medium  
**Priority:** Medium  
**Status:** Open

**Thong Tin Bug:**

| Truong | Noi Dung |
|--------|----------|
| Module | Inventory Management - Search |
| Phien ban | v1.0 |
| Ngay phat hien | 2026-02-28 |
| Nguoi phat hien | QA Tester |
| Tai khoan test | admin / admin123 |

**Mo Ta:**
Chuc nang Search khong tra ve ket qua dung khi tim kiem voi tu khoa tieng Viet co dau (Unicode). Vi du: tim "Hong Do" (khong dau) co the tra ve ket qua, nhung tim "Hong Do" (co dau dang khac encoding) lai khong tim thay.

**Cac Buoc Tai Hien (Steps to Reproduce):**

| Buoc | Hanh Dong | Du Lieu |
|------|-----------|---------|
| 1 | Dang nhap thanh cong | admin / admin123 |
| 2 | Them san pham ten "Hong Do" (nhap truc tiep tren form) | |
| 3 | Mo chuc nang Search | |
| 4 | Copy-paste tu khoa "Hong Do" tu mot nguon khac (Notepad, Word) | `Hong Do` |
| 5 | Click "Search" | |

**Ket Qua Thuc Te (Actual Result):**
- Ket qua tra ve rong: "Khong tim thay san pham"
- Mac du san pham "Hong Do" da ton tai trong database
- Tim kiem bang cach go truc tiep tren search box thi tim duoc
- Van de lien quan den Unicode encoding: cung mot chu "o" nhung khac encoding (precomposed vs decomposed)

**Ket Qua Mong Doi (Expected Result):**
- Tim kiem tra ve ket qua dung bat ke nguon nhap (go truc tiep, copy-paste, IME)
- He thong normalize Unicode truoc khi thuc hien tim kiem (dung `java.text.Normalizer`)
- Ket qua nhat quan cho moi cach nhap tieng Viet

**Ghi Chu Bo Sung:**
- Root cause: MySQL collation hoac Java String comparison khong xu ly Unicode normalization
- Anh huong: Chi xay ra voi tieng Viet co dau va mot so ngon ngu khac dung dau (Phap, Duc...)
- Fix de xuat: 
  - Database: Su dung collation `utf8mb4_unicode_ci`
  - Java: Normalize input voi `Normalizer.normalize(input, Normalizer.Form.NFC)` truoc khi query
- Tan suat xay ra: Thuong xuyen khi user copy-paste tu ung dung khac

---

## Bug Summary

| Tieu Chi | Gia Tri |
|----------|---------|
| Tong so Bug Reports | 3 |
| Critical Priority | 1 |
| High Priority | 1 |
| Medium Priority | 1 |
| High Severity | 1 |
| Medium Severity | 2 |
| Status | Tat ca dang Open |
| Module bi anh huong | Inventory (2), Database/All (1) |
