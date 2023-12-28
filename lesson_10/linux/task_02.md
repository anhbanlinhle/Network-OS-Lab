<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

	- [Commands](#commands)
		- [Command 1](#command-1)
		- [Command 2](#command-2)
		- [Command 3](#command-3)
		- [Command 4](#command-4)
		- [Command 5](#command-5)
		- [Command 6](#command-6)

	- [Results](#results)
		- [Result of Command 1](#result-1)
		- [Result of Command 2](#result-2)
		- [Result of Command 3](#result-3)
		- [Result of Command 4](#result-4)
		- [Result of Command 5](#result-5)
		- [Result of Command 6](#result-6)

<a name="requirements"/>

# Requirements

- Đăng nhập vào ftp server với tài khoản `ftp` và tài khoản người dùng thông thường, thực hiện các thao tác `upload`/`download` dữ liệu (với người dùng thông thường có thêm tuỳ chọn `YES` và `NO` với `chroot_local_user`)

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

### Prerequisites

Install FTP daemon

```sh
sudo apt install vsftpd
```

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Config FTP

```sh
sudo vi /etc/vsftpd.conf
```

File content

```sh
anonymous_enable=YES
anon_upload_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
```

Restart service after configuration

```sh
sudo service vsftpd restart
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Config file to allow anonymous

```sh
anonymous_enable=YES
```

Login as anonymous

```sh
ftp localhost
```

Download file from server

```sh
get anon.txt
```

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

Login as user

```sh
ftp localhost
```

Download file from server

```sh
get server_data.txt
```

<a name="command-4"/>

### Command 4 [↑](#bookmarks) [↓](#result-4)

Login as server

```sh
ftp localhost
```

Upload file to server

```sh
put client_data.txt
```

<a name="command-5"/>

### Command 5 [↑](#bookmarks) [↓](#result-5)

Config file to allow change directory

```sh
chroot_local_user=NO
```

Attempt to change directory

```sh
cd /home/user1
```

<a name="command-6"/>

### Command 6 [↑](#bookmarks) [↓](#result-6)

Config file to forbid change directory

```sh
chroot_local_user=YES
```

Attempt to change directory

```sh
cd /home/user1
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh

```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh

```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

```sh

```

<a name="result-4"/>

### Result of Command 4 [↑](#command-4)

```sh

```

<a name="result-5"/>

### Result of Command 5 [↑](#command-5)

```sh

```

<a name="result-6"/>

### Result of Command 6 [↑](#command-6)

```sh

```

