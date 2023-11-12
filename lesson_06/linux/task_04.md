# Requirements

- Thay đổi tham số ngày hết hạn của tài khoản người dùng
`tux` bằng cách sử dụng câu lệnh `usermod`.

- Khoá tài khoản người dùng (Sử dụng các công cụ
hoặc soạn thảo file `/etc/shadow`, ...)

- Bảo vệ người dùng từ đăng nhập bằng cách thay đổi shell
mặc định của người dùng thành `/bin/false`.

- Thay đổi tham số `PASS_MAX_DAYS` của người dùng `tux`
thành 1 trong file `/etc/shadow`.