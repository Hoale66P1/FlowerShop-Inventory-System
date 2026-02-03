# Software Requirement Specifications (SRS)
**Project:** Flower Shop Inventory System
**Module:** Inventory Management

## 1. Functional Requirements (Yêu cầu chức năng)
- **FR_01 (Login):** Nhân viên phải đăng nhập được bằng Username/Password hợp lệ. Hệ thống phải chặn đăng nhập nếu sai thông tin quá 3 lần.
- **FR_02 (Add Product):** Cho phép thêm hoa mới với các trường: Tên hoa, Loại hoa, Giá nhập, Giá bán, Số lượng tồn kho.
- **FR_03 (Search):** Tìm kiếm hoa theo Tên hoặc ID.

## 2. Business Rules (Quy tắc nghiệp vụ)
- **BR_01:** Giá bán (Selling Price) phải lớn hơn Giá nhập (Import Price).
- **BR_02:** Số lượng tồn kho (Stock Quantity) không được là số âm.
- **BR_03:** Các trường bắt buộc nhập: Tên hoa, Giá bán.