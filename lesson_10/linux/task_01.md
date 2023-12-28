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

- Cài đặt `samba`, thêm người dùng `user1`, `user2` có quyền đăng nhập vào `samba` với quyền như sau: `user1` có quyền `read`, `user2` có quyền `write`

- Đăng nhập vào `samba` với tài khoản `user1` để tải 1 file về máy cục bộ, với tài khoản `user2` để upload 1 file lên server

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Prerequisites

Install Samba

```sh
sudo apt install samba
```

### Command 1 [↑](#bookmarks) [↓](#result-1)


Confirm that `user1`, `user2` existed on system

```sh
cat /etc/passwd | grep 'user1\|user2'
```

Create Samba account for users: `user1`, `user2`

```sh
sudo smbpasswd -a user1
sudo smbpasswd -a user2
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Config `smb` file

```sh
sudo vi /etc/samba/smb.conf
```

File content

```sh
[global]
   security = user
   workgroup = WORKGROUP

...

[myshare]
   comment = Ubuntu File Server Share
   path = /home/lynn/share
   browsable = yes
   guest ok = yes
   read only = no
   create mask = 0777
   valid users=user1,user2
   read list = user1
   write list = user2
```

Restart service after configuration

```sh
sudo systemctl restart smbd.service 
```

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

Login as users: `user1`, `user2`

```sh
smbclient //localhost/myshare -U user1
smbclient //localhost/myshare -U user2
```

<a name="command-4"/>

### Command 4 [↑](#bookmarks) [↓](#result-4)

Download file for `user1`

```sh
get file1.txt
```

Upload file for `user2`

```sh
put file3.txt
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

