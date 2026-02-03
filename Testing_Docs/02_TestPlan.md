# Test Plan - Flower Shop Inventory System
**Module:** Inventory Management  
**Người lập:** QA Team  
**Ngày tạo:** 03/02/2026  
**Phiên bản:** 1.0

---

## 1. Tổng Quan Dự Án

### 1.1 Giới Thiệu
Hệ thống Flower Shop Inventory System là một ứng dụng quản lý kho hàng cho cửa hàng bán hoa. Module Inventory Management cho phép nhân viên quản lý danh sách hoa, thêm sản phẩm mới, tìm kiếm và cập nhật thông tin hoa.

### 1.2 Phạm Vi Kiểm Thử
Kế hoạch kiểm thử này tập trung vào các chức năng chính:
- **FR_01 (Login):** Xác thực đăng nhập người dùng
- **FR_02 (Add Product):** Thêm sản phẩm hoa mới
- **FR_03 (Search):** Tìm kiếm sản phẩm

Và các quy tắc nghiệp vụ:
- **BR_01:** Validation giá bán > giá nhập
- **BR_02:** Validation số lượng tồn kho không âm
- **BR_03:** Validation các trường bắt buộc

---

## 2. Chiến Lược Kiểm Thử (Test Strategy)

### 2.1 Loại Kiểm Thử
- **Functional Testing:** Kiểm tra chức năng theo SRS
- **Business Rule Validation:** Kiểm tra các quy tắc nghiệp vụ
- **Negative Testing:** Kiểm tra các trường hợp ngoại lệ
- **Boundary Testing:** Kiểm tra các giá trị biên

### 2.2 Phương Pháp Kiểm Thử
- **Black Box Testing:** Kiểm tra dựa trên requirements, không cần biết code
- **Manual Testing:** Thực hiện test cases thủ công qua giao diện

### 2.3 Test Levels
- **System Testing:** Kiểm tra toàn bộ hệ thống tích hợp
- **User Acceptance Testing (UAT):** Kiểm tra bởi người dùng cuối

---

## 3. Test Deliverables (Sản Phẩm Kiểm Thử)

### 3.1 Tài Liệu Trước Khi Test
- ✅ Test Plan (tài liệu này)
- ✅ Test Cases (Login, Add Product, Search)
- ✅ Test Data
- ✅ Requirements Traceability Matrix

### 3.2 Tài Liệu Trong/Sau Khi Test
- Test Execution Report
- Bug Reports
- Test Summary Report

---

## 4. Lịch Trình Kiểm Thử

| Giai Đoạn | Hoạt Động | Thời Gian |
|-----------|-----------|-----------|
| 1 | Lập kế hoạch và thiết kế test cases | 2 ngày |
| 2 | Chuẩn bị test data | 1 ngày |
| 3 | Setup test environment | 1 ngày |
| 4 | Thực thi test cases | 3 ngày |
| 5 | Bug reporting và retesting | 2 ngày |
| 6 | Test summary và sign-off | 1 ngày |

**Tổng thời gian dự kiến:** 10 ngày làm việc

---

## 5. Test Environment (Môi Trường Kiểm Thử)

### 5.1 Yêu Cầu Phần Cứng
- Máy tính có cấu hình tối thiểu: 4GB RAM, Intel Core i3 trở lên

### 5.2 Yêu Cầu Phần Mềm
- **Hệ điều hành:** Windows 10/11
- **JDK:** Java 17 trở lên
- **Database:** MySQL 8.0
- **IDE:** IntelliJ IDEA / Eclipse (để debug nếu cần)

### 5.3 Test Data
- Database test với dữ liệu mẫu (xem file `07_TestData.md`)

---

## 6. Roles và Responsibilities (Vai Trò và Trách Nhiệm)

| Vai Trò | Trách Nhiệm | Người Đảm Nhận |
|---------|-------------|----------------|
| Test Lead | Lập kế hoạch, điều phối kiểm thử | TBD |
| Tester | Thực thi test cases, báo cáo bugs | TBD |
| Developer | Fix bugs, hỗ trợ technical | Dev Team |
| BA/PM | Review requirements, UAT | Business Team |

---

## 7. Entry và Exit Criteria

### 7.1 Entry Criteria (Điều Kiện Bắt Đầu Test)
- ✅ SRS đã được approved
- ✅ Test cases đã được review và approved
- ✅ Test environment đã sẵn sàng
- ✅ Test data đã được chuẩn bị
- ✅ Build version đã stable

### 7.2 Exit Criteria (Điều Kiện Kết Thúc Test)
- ✅ 100% test cases đã được thực thi
- ✅ Không còn Critical/High bugs
- ✅ Test coverage ≥ 95% cho tất cả requirements
- ✅ Test Execution Report đã được approved
- ✅ User Acceptance Testing passed

---

## 8. Risk Management (Quản Lý Rủi Ro)

| Rủi Ro | Mức Độ | Biện Pháp Giảm Thiểu |
|--------|---------|----------------------|
| Thiếu test data | Medium | Chuẩn bị test data sớm, có backup data |
| Test environment không stable | High | Setup môi trường test riêng, không dùng chung với dev |
| Requirements thay đổi | Medium | Maintain traceability matrix, update test cases kịp thời |
| Thiếu thời gian test | High | Ưu tiên test critical features trước |

---

## 9. Test Metrics (Chỉ Số Kiểm Thử)

Các metrics sẽ được theo dõi:
- **Test Coverage:** % requirements được cover
- **Test Execution Rate:** Số test cases executed / Total test cases
- **Pass Rate:** % test cases passed
- **Defect Density:** Số bugs / Test cases
- **Defect Status:** Open, In Progress, Fixed, Closed

---

## 10. Assumptions và Dependencies

### 10.1 Assumptions (Giả Định)
- Application build sẽ stable và sẵn sàng đúng lịch
- Tất cả requirements trong SRS là chính xác và đầy đủ
- Test environment sẽ không có downtime trong giai đoạn test

### 10.2 Dependencies (Phụ Thuộc)
- Development team cung cấp build version đúng hạn
- Database team setup test database
- BA/PM available để clarify requirements

---

## 11. Approvals (Phê Duyệt)

| Vai Trò | Họ Tên | Chữ Ký | Ngày |
|---------|--------|---------|------|
| Test Lead | | | |
| Project Manager | | | |
| Development Lead | | | |
