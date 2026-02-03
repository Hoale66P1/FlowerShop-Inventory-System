# Test Execution Report
**Project:** Flower Shop Inventory System  
**Module:** Inventory Management  
**Test Cycle:** [Cycle Name/Number]  
**Test Date:** [Start Date] - [End Date]  
**Tester:** [Tên người test]  
**Build Version:** [e.g., v1.0.0]

---

## 1. Executive Summary

### 1.1 Overall Test Results

| Metric | Value |
|--------|-------|
| **Total Test Cases** | ___ |
| **Executed** | ___ |
| **Passed** | ___ |
| **Failed** | ___ |
| **Blocked** | ___ |
| **Not Run** | ___ |
| **Pass Rate** | ___% |

### 1.2 Test Execution Status

```
Passed:   [====    ] ___% (___/___) ✅
Failed:   [===     ] ___% (___/___) ❌
Blocked:  [=       ] ___% (___/___) ⛔
Not Run:  [==      ] ___% (___/___) ⬜
```

### 1.3 Recommendation
> **[PASS / FAIL / CONDITIONAL PASS]**
> 
> _[Tóm tắt kết luận: Hệ thống đã sẵn sàng release hay chưa? Có vấn đề gì critical không?]_

---

## 2. Test Execution Details By Module

### 2.1 Login Module (FR_01)

| Test Case ID | Test Case Name | Status | Bugs Found | Notes |
|--------------|----------------|--------|------------|-------|
| TC_LOGIN_001 | Đăng Nhập Thành Công | ⬜ | - | |
| TC_LOGIN_002 | Username Sai | ⬜ | - | |
| TC_LOGIN_003 | Password Sai | ⬜ | - | |
| TC_LOGIN_004 | Trường Rỗng | ⬜ | - | |
| TC_LOGIN_005 | Khóa Sau 3 Lần Sai | ⬜ | - | |
| TC_LOGIN_006 | Login Tài Khoản Bị Khóa | ⬜ | - | |
| TC_LOGIN_007 | Password Case Sensitive | ⬜ | - | |
| TC_LOGIN_008 | SQL Injection Prevention | ⬜ | - | |

**Summary:** ___/8 Passed | ___/8 Failed | ___/8 Blocked

---

### 2.2 Add Product Module (FR_02)

| Test Case ID | Test Case Name | Status | Bugs Found | Notes |
|--------------|----------------|--------|------------|-------|
| TC_ADDPROD_001 | Thêm Sản Phẩm Hợp Lệ | ⬜ | - | |
| TC_ADDPROD_002 | BR_01: Giá Bán < Giá Nhập | ⬜ | - | |
| TC_ADDPROD_003 | BR_01: Giá Bán = Giá Nhập | ⬜ | - | |
| TC_ADDPROD_004 | BR_02: Số Lượng Âm | ⬜ | - | |
| TC_ADDPROD_005 | Boundary: Số Lượng = 0 | ⬜ | - | |
| TC_ADDPROD_006 | BR_03: Tên Hoa Rỗng | ⬜ | - | |
| TC_ADDPROD_007 | BR_03: Giá Bán Rỗng | ⬜ | - | |
| TC_ADDPROD_008 | Loại Hoa Rỗng | ⬜ | - | |
| TC_ADDPROD_009 | Giá Không Phải Số | ⬜ | - | |
| TC_ADDPROD_010 | Số Lượng Là Số Thập Phân | ⬜ | - | |
| TC_ADDPROD_011 | Tên Trùng Lặp | ⬜ | - | |
| TC_ADDPROD_012 | Boundary: Giá Trị Lớn | ⬜ | - | |
| TC_ADDPROD_013 | Special Characters | ⬜ | - | |

**Summary:** ___/13 Passed | ___/13 Failed | ___/13 Blocked

---

### 2.3 Search Module (FR_03)

| Test Case ID | Test Case Name | Status | Bugs Found | Notes |
|--------------|----------------|--------|------------|-------|
| TC_SEARCH_001 | Tìm Theo Tên - Exact | ⬜ | - | |
| TC_SEARCH_002 | Tìm Theo Tên - Partial | ⬜ | - | |
| TC_SEARCH_003 | Tìm Theo ID | ⬜ | - | |
| TC_SEARCH_004 | ID Không Tồn Tại | ⬜ | - | |
| TC_SEARCH_005 | Tên Không Tồn Tại | ⬜ | - | |
| TC_SEARCH_006 | Search Box Rỗng | ⬜ | - | |
| TC_SEARCH_007 | Case Insensitive | ⬜ | - | |
| TC_SEARCH_008 | Khoảng Trắng Đầu/Cuối | ⬜ | - | |
| TC_SEARCH_009 | Ký Tự Đặc Biệt | ⬜ | - | |
| TC_SEARCH_010 | SQL Injection | ⬜ | - | |
| TC_SEARCH_011 | Nhiều Kết Quả | ⬜ | - | |
| TC_SEARCH_012 | Tìm Số | ⬜ | - | |
| TC_SEARCH_013 | Performance | ⬜ | - | |

**Summary:** ___/13 Passed | ___/13 Failed | ___/13 Blocked

---

## 3. Defects Summary

### 3.1 Defects By Severity

| Severity | Count | Percentage |
|----------|-------|------------|
| Critical | ___ | ___% |
| High | ___ | ___% |
| Medium | ___ | ___% |
| Low | ___ | ___% |
| **Total** | **___** | **100%** |

### 3.2 Defects By Status

| Status | Count |
|--------|-------|
| Open | ___ |
| In Progress | ___ |
| Fixed | ___ |
| Retest | ___ |
| Closed | ___ |
| Rejected | ___ |

### 3.3 Top Critical/High Defects

| Bug ID | Title | Severity | Module | Status |
|--------|-------|----------|--------|--------|
| BUG-001 | [Mô tả bug] | Critical | Login | Open |
| BUG-002 | [Mô tả bug] | High | Add Product | In Progress |
| BUG-003 | [Mô tả bug] | High | Search | Fixed |

---

## 4. Test Environment

| Component | Details |
|-----------|---------|
| **OS** | Windows 11 |
| **JDK** | Java 17 |
| **Database** | MySQL 8.0 |
| **Build Version** | v1.0.0 |
| **Test Data** | [Link to test data file] |

---

## 5. Test Metrics

### 5.1 Requirements Coverage

| Requirement | Test Cases | Coverage |
|-------------|-----------|----------|
| FR_01 (Login) | 8 | 100% |
| FR_02 (Add Product) | 13 | 100% |
| FR_03 (Search) | 13 | 100% |
| BR_01 (Price Rule) | 3 | 100% |
| BR_02 (Stock Rule) | 3 | 100% |
| BR_03 (Required Fields) | 4 | 100% |

### 5.2 Defect Detection Rate

```
Defect Detection Rate = (Total Bugs Found) / (Total Test Cases Executed) x 100
DDR = ___% 
```

### 5.3 Test Execution Progress

**Timeline:**
- Day 1: Setup environment + Execute Login tests
- Day 2: Execute Add Product tests
- Day 3: Execute Search tests
- Day 4: Bug retesting
- Day 5: Final reporting

---

## 6. Risks and Issues

### 6.1 Risks Encountered

| Risk | Impact | Mitigation |
|------|--------|------------|
| _[Ví dụ: Database không stable]_ | High | _[Dùng local database]_ |
| _[Ví dụ: Build delay từ dev team]_ | Medium | _[Extend test timeline]_ |

### 6.2 Issues

- ⚠️ **Issue 1:** _[Mô tả vấn đề gặp phải trong quá trình test]_
- ⚠️ **Issue 2:** _[Ví dụ: Thiếu test data cho một số scenarios]_

---

## 7. Observations and Recommendations

### 7.1 Positive Findings
- ✅ _[Ví dụ: Login security rất tốt, chặn SQL injection hiệu quả]_
- ✅ _[Ví dụ: Validation rules được implement đầy đủ]_

### 7.2 Areas of Concern
- ⚠️ _[Ví dụ: Search performance chậm khi có >1000 records]_
- ⚠️ _[Ví dụ: Error messages chưa user-friendly]_

### 7.3 Recommendations
1. **Fix all Critical bugs** trước khi release
2. **Improve error messages** để user-friendly hơn
3. **Add performance optimization** cho Search function
4. **Consider adding unit tests** cho business logic layer

---

## 8. Conclusion

_[Tóm tắt tổng quan kết quả test, đánh giá chất lượng sản phẩm, và khuyến nghị release hay không]_

**Example:**
> Tổng cộng 34 test cases đã được thực thi, với tỷ lệ pass rate là 85%. Tất cả critical bugs đã được fix và retest successful. Hệ thống đã sẵn sàng cho production release với điều kiện các Medium bugs được monitor trong production.

---

## 9. Sign-Off

| Role | Name | Date | Signature | Decision |
|------|------|------|-----------|----------|
| Tester | | | | |
| Test Lead | | | | |
| QA Manager | | | | ☐ Approve ☐ Reject |
| Project Manager | | | | ☐ Approve ☐ Reject |

---

## 10. Attachments

- 📎 Test Cases Document: `04_TestCases_Login.md`, `05_TestCases_AddProduct.md`, `06_TestCases_Search.md`
- 📎 Test Data: `07_TestData.md`
- 📎 Bug Reports: `10_BugReport_Template.md`
- 📎 Traceability Matrix: `08_RequirementsTraceabilityMatrix.md`
- 📎 Screenshots: _[Folder path to screenshots]_
- 📎 Test Logs: _[Folder path to logs]_

---

## Legend
- ✅ Passed
- ❌ Failed
- ⬜ Not Run
- ⛔ Blocked
- 🔶 In Progress
