# Requirements

- Sử dụng `useradd –D` để thay đổi các thiết lập mặc định
của hệ thống và do đó tất cả người dùng mới sẽ được gán
trong `/bin/sh` thay vì `/bin/bash` (chú ý: điều này sẽ làm
thay đổi file trong `/etc/defaults/`)

- Soạn thảo `/etc/login.defs` và thay đổi tham số mặc định
`PASS_MAX_DAYS` và do đó người dùng mới sẽ phải thay
đổi mật khẩu của mình theo định kỳ 5 ngày

# Solution

## Commands

### Command 1

Check previous default shell for all users 

```sh
sudo grep SHELL= /etc/default/useradd
```

Change default shell to **/bin/sh** for all users

```sh
sudo useradd -D -s /bin/sh
```

Check current default shell for all users 

```sh
sudo grep SHELL= /etc/default/useradd
```

### Command 2

Check previous default **PASS_MAX_DAYS** for all user

```sh
sudo grep PASS_MAX_DAYS /etc/login.defs
```

Edit **PASS_MAX_DAYS** in **/etc/login.defs**

```sh
sudo vi /etc/login.defs
```

File content

```sh
PASS_MAX_DAYS    5
```

Check current default **PASS_MAX_DAYS** for all user

```sh
sudo grep PASS_MAX_DAYS /etc/login.defs
```

## Results

### Command 1

```sh
lynn@lynn-server:~$ sudo grep SHELL= /etc/default/useradd
SHELL=/bin/bash
```

```sh
lynn@lynn-server:~$ sudo grep SHELL= /etc/default/useradd
SHELL=/bin/sh
```

### Command 2

```sh
lynn@lynn-server:~$ sudo grep PASS_MAX_DAYS /etc/login.defs
#	PASS_MAX_DAYS	Maximum number of days a password may be used.
PASS_MAX_DAYS	99999
```

```sh
lynn@lynn-server:~$ sudo grep PASS_MAX_DAYS /etc/login.defs
#	PASS_MAX_DAYS	Maximum number of days a password may be used.
PASS_MAX_DAYS	5
```