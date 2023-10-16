<h1>Requirements</h1>

- Sử dụng lệnh  `adduser test`  để tạo người dùng test, hãy kết hợp hai lệnh `echo` và `passwd` để thay đổi mật khẩu của người dùng này chỉ cần 1 lần nhấn <kbd>Enter</kbd>
- Biết `A` là biến chứa một số nguyên dương. Hãy kết hợp giữa hai lệnh `head` và `tail` để hiển thị dòng thứ A trong file `/var/log/messages` (không cần kiểm tra `A` có lớn hơn số dòng trong file không)
- Hãy hiển thị tất cả các dòng không có từ `nologin` trong `/etc/passwd`

<h1>Solution</h1>

<h2>Disclaimer</h2>

The first requirement is impossible to be completed in `macos` due to privacy. Password must be **manually** typed and confirmed.

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
> task_04.sh
```

<h3>Command 2</h3>

```sh
./task_04.sh
```

<h3>Command 3</h3>

```sh
grep -v "nologin" /etc/passwd
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ > task_04.sh
echo "Nhap so dong can doc: "; read A
head -n "$A" /tmp/diem.txt | tail -n 1
```

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ ./task_04.sh
Nhap so dong can doc: 
7
minh nam 89 93 182
```

<h3>Command 3</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ grep -v "nologin" /etc/passwd
##
# User Database
# 
# Note that this file is consulted directly only when the system is running
# in single-user mode.  At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
...
```