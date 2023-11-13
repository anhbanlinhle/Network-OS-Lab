# Requirements

- Sử dụng `useradd –D` để thay đổi các thiết lập mặc định
của hệ thống và do đó tất cả người dùng mới sẽ được gán
trong `/bin/sh` thay vì `/bin/bash` (chú ý: điều này sẽ làm
thay đổi file trong `/etc/defaults/`)

- Soạn thảo `/etc/login.defs` và thay đổi tham số mặc định
`PASS_MAX_DAYS` và do đó người dùng mới sẽ phải thay
đổi mật khẩu của mình theo định kỳ 5 ngày
