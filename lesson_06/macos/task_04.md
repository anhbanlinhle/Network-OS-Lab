<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

  - [Commands](#commands)
    - [Command 1](#command-1)
    - [Command 2](#command-2)
    - [Command 3](#command-3)
    - [Command 4](#command-4)

  - [Results](#results)
    - [Result of Command 1](#result-1)
    - [Result of Command 2](#result-2)
    - [Result of Command 3](#result-3)
    - [Result of Command 4](#result-4)

<a name="requirements"/>

# Requirements

- Thay đổi tham số ngày hết hạn của tài khoản người dùng
`tux` bằng cách sử dụng câu lệnh `usermod`.

- Khoá tài khoản người dùng (Sử dụng các công cụ
hoặc soạn thảo file `/etc/shadow`, ...)

- Bảo vệ người dùng từ đăng nhập bằng cách thay đổi shell
mặc định của người dùng thành `/bin/false`.

- Thay đổi tham số `PASS_MAX_DAYS` của người dùng `tux`
thành 1 trong file `/etc/shadow`.