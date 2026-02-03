# Bug Report Template
**Project:** Flower Shop Inventory System

---

## Bug Report #[BUG-XXX]

### 1. Bug Information

| Field | Details |
|-------|---------|
| **Bug ID** | BUG-___ |
| **Bug Title** | _[Tiêu đề ngắn gọn mô tả bug]_ |
| **Reported By** | _[Tên người phát hiện]_ |
| **Reported Date** | _[DD/MM/YYYY]_ |
| **Module** | ☐ Login ☐ Add Product ☐ Search ☐ Other: ___ |
| **Build Version** | _[e.g., v1.0.0]_ |
| **Test Case ID** | _[TC_XXX_XXX]_ |

---

### 2. Bug Classification

| Field | Value |
|-------|-------|
| **Severity** | ☐ Critical ☐ High ☐ Medium ☐ Low |
| **Priority** | ☐ P0 (Urgent) ☐ P1 (High) ☐ P2 (Medium) ☐ P3 (Low) |
| **Bug Type** | ☐ Functional ☐ UI/UX ☐ Performance ☐ Security ☐ Data ☐ Other |
| **Status** | ☐ Open ☐ In Progress ☐ Fixed ☐ Retest ☐ Closed ☐ Rejected |
| **Assigned To** | _[Tên developer]_ |

**Severity Definitions:**
- **Critical:** Hệ thống crash, mất data, security breach, blocking toàn bộ chức năng
- **High:** Chức năng chính không hoạt động, không có workaround
- **Medium:** Chức năng bị lỗi nhưng có workaround
- **Low:** Lỗi minor, cosmetic, không ảnh hưởng chức năng

---

### 3. Test Environment

| Component | Details |
|-----------|---------|
| **Operating System** | _[e.g., Windows 11 Pro]_ |
| **Java Version** | _[e.g., JDK 17]_ |
| **Database** | _[e.g., MySQL 8.0.35]_ |
| **Browser** (nếu có) | _[e.g., Chrome 120]_ |
| **Screen Resolution** | _[e.g., 1920x1080]_ |

---

### 4. Bug Description

**Summary:**
_[Mô tả ngắn gọn bug là gì]_

**Detailed Description:**
_[Mô tả chi tiết vấn đề, bao gồm context, khi nào xảy ra, ảnh hưởng như thế nào]_

**Example:**
> Khi user nhập password sai 3 lần liên tiếp, hệ thống không khóa tài khoản như yêu cầu trong FR_01. User vẫn có thể tiếp tục thử đăng nhập lần thứ 4, 5, ... Điều này vi phạm security requirement và có thể bị brute force attack.

---

### 5. Steps to Reproduce

**Preconditions:**
_[Điều kiện cần trước khi reproduce bug]_

**Steps:**

1. _[Bước 1]_
2. _[Bước 2]_
3. _[Bước 3]_
4. _[...]_

**Example:**
> **Preconditions:** Tài khoản 'testuser' tồn tại với password 'test123' và chưa bị lock
> 
> **Steps:**
> 1. Mở application và vào màn hình Login
> 2. Nhập username: `testuser`
> 3. Nhập password SAI: `wrongpass1`
> 4. Click "Login" → Thấy message "Sai thông tin"
> 5. Nhập username: `testuser`
> 6. Nhập password SAI: `wrongpass2`
> 7. Click "Login" → Thấy message "Sai thông tin"
> 8. Nhập username: `testuser`
> 9. Nhập password SAI: `wrongpass3`
> 10. Click "Login" → **BUG: Chỉ thấy "Sai thông tin", không thấy account bị lock**
> 11. Thử đăng nhập lần 4 với password đúng → **BUG: Vẫn đăng nhập được!**

---

### 6. Expected vs Actual Result

**Expected Result:**
_[Kết quả đúng theo requirements/specifications]_

**Example:**
> - Sau lần login sai thứ 3, hệ thống hiển thị: "Tài khoản đã bị khóa do nhập sai mật khẩu quá 3 lần"
> - Tài khoản `testuser` bị set `isLocked = true` trong database
> - Không thể đăng nhập với tài khoản này cho đến khi admin unlock

**Actual Result:**
_[Kết quả thực tế khi test]_

**Example:**
> - Sau lần login sai thứ 3, chỉ thấy message "Username hoặc Password không đúng" (giống các lần trước)
> - Field `isLocked` vẫn là `false` trong database
> - Có thể tiếp tục thử login lần 4, 5, 6,... không bị chặn
> - Nếu nhập đúng password vẫn login được bình thường

---

### 7. Test Data Used

| Field | Value |
|-------|-------|
| Username | _[e.g., testuser]_ |
| Password (Correct) | _[e.g., test123]_ |
| Password (Wrong) | _[e.g., wrongpass1, wrongpass2, wrongpass3]_ |
| Product ID | _[nếu test Add Product/Search]_ |
| Other Data | _[Any other relevant data]_ |

---

### 8. Attachments

**Screenshots:**
- 📷 _[Screenshot 1: Màn hình login lần 3 failed]_
- 📷 _[Screenshot 2: Database showing isLocked still false]_
- 📷 _[Screenshot 3: Vẫn login được sau lần 4]_

**Videos:**
- 🎥 _[Link to screen recording if available]_

**Logs:**
```
[Copy/paste relevant log entries here]
```

**Database State:**
```sql
SELECT * FROM users WHERE username = 'testuser';
-- Result: isLocked = false, failedLoginCount = 3 (hoặc không được update)
```

---

### 9. Impact Analysis

**User Impact:**
_[Ảnh hưởng đến end users như thế nào?]_

**Example:**
> - **Security Risk:** Cho phép attacker thực hiện brute force attack vô thời hạn
> - **Compliance Issue:** Vi phạm requirement FR_01
> - **User Data Risk:** Tài khoản có thể bị hack dễ dàng

**Business Impact:**
_[Ảnh hưởng đến business/doanh nghiệp]_

**Example:**
> - Mất lòng tin của khách hàng về tính bảo mật
> - Rủi ro mất dữ liệu nhạy cảm
> - Có thể bị exploit bởi hackers

**Workaround:**
_[Có cách giải quyết tạm thời không?]_

**Example:**
> - ❌ Không có workaround
> - Hoặc: ✅ Admin có thể manually lock account từ database (không ideal)

---

### 10. Root Cause (Điền bởi Developer)

_[Developer điền phần này sau khi investigate]_

**Cause:**
_[Nguyên nhân gốc rễ của bug]_

**Example:**
> Method `validateLogin()` không increment `failedLoginCount` khi password sai. Missing implementation cho account locking logic.

**Code Location:**
_[File và line number có bug]_

**Example:**
> `src/main/java/com/flowershop/service/AuthService.java:45-67`

---

### 11. Fix Details (Điền bởi Developer)

| Field | Value |
|-------|-------|
| **Fixed By** | _[Tên developer]_ |
| **Fixed Date** | _[DD/MM/YYYY]_ |
| **Fix Version** | _[e.g., v1.0.1]_ |
| **Commit ID** | _[Git commit hash]_ |

**Fix Description:**
_[Mô tả cách fix]_

**Example:**
> - Added logic to increment `failedLoginCount` in database mỗi khi login fail
> - Check if `failedLoginCount >= 3`, then set `isLocked = true`
> - Display appropriate error message when account is locked
> - Prevent login attempts for locked accounts

**Code Changes:**
```java
// Example pseudocode
if (passwordIncorrect) {
    user.incrementFailedLoginCount();
    if (user.getFailedLoginCount() >= 3) {
        user.setLocked(true);
        throw new AccountLockedException("Account locked due to 3 failed attempts");
    }
}
```

---

### 12. Retest Results

| Field | Value |
|-------|-------|
| **Retested By** | _[Tên tester]_ |
| **Retest Date** | _[DD/MM/YYYY]_ |
| **Retest Build** | _[Build version sau khi fix]_ |
| **Retest Result** | ☐ Pass ☐ Fail |

**Retest Notes:**
_[Kết quả sau khi retest]_

**Example:**
> ✅ Bug đã được fix thành công. Sau 3 lần login sai, account bị lock và hiển thị đúng error message. Không thể login sau khi bị lock.

---

### 13. Related Information

**Related Requirements:**
- FR_01: Login functionality

**Related Test Cases:**
- TC_LOGIN_005: Khóa Tài Khoản Sau 3 Lần Đăng Nhập Sai
- TC_LOGIN_006: Không Thể Đăng Nhập Với Tài Khoản Đã Bị Khóa

**Related Bugs:**
- _[Link to related bugs if any]_

**References:**
- _[Links to specifications, design docs, etc.]_

---

### 14. Comments / Discussion

**Comment 1 - [Name] - [Date]:**
_[Any additional comments, questions, or discussions]_

**Comment 2 - [Name] - [Date]:**
_[Response or additional info]_

---

## Quick Bug Report Examples

### Example 1: Critical Bug

```
BUG-001: SQL Injection Vulnerability in Login
Severity: Critical | Priority: P0
Module: Login
Description: Login form vulnerable to SQL injection attack. Input ' OR '1'='1 
bypasses authentication and grants access without valid credentials.
Impact: Complete security breach, unauthorized access possible
Status: Open
```

### Example 2: High Bug

```
BUG-002: Add Product Allows Negative Selling Price
Severity: High | Priority: P1
Module: Add Product
Description: Validation không chặn giá bán âm. User có thể nhập selling price = -1000
Impact: Vi phạm BR_01, dữ liệu không hợp lệ trong database
Status: Fixed
```

### Example 3: Medium Bug

```
BUG-003: Search Returns Incorrect Results for Partial Match
Severity: Medium | Priority: P2
Module: Search
Description: Search "Hồng" trả về kết quả bao gồm cả "Cúc" (không liên quan)
Impact: User experience kém, tìm kiếm không chính xác
Workaround: User có thể search bằng exact name hoặc ID
Status: In Progress
```

### Example 4: Low Bug

```
BUG-004: Error Message Has Typo
Severity: Low | Priority: P3
Module: Add Product
Description: Error message hiển thị "Gia ban phai lon hon gia nhap" (thiếu dấu)
Impact: Không ảnh hưởng chức năng, chỉ là cosmetic issue
Status: Closed
```

---

**Last Updated:** _[Date]_
