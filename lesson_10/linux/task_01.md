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
lynn@lynn-server:~$ cat /etc/passwd | grep 'user1\|user2'
user1:x:1004:1004:user1,,,:/home/user1:/bin/bash
user2:x:1005:1005:user2,,,:/home/user2:/bin/bash
```

```sh
lynn@lynn-server:~$ sudo smbpasswd -a user1
New SMB password: 
Retype new SMB password: 
Added user user1
```

```sh
lynn@lynn-server:~$ sudo smbpasswd -a user2
New SMB password: 
Retype new SMB password: 
Added user user2
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
lynn@lynn-server:~$ sudo systemctl status smbd.service 
● smbd.service - Samba SMB Daemon
     Loaded: loaded (/lib/systemd/system/smbd.service; enabled; preset: enabled)
     Active: active (running) since Thu 2023-12-28 22:12:17 +07; 7s ago
       Docs: man:smbd(8)
             man:samba(7)
             man:smb.conf(5)
    Process: 4635 ExecCondition=/usr/share/samba/is-configured smb (code=exited, status=0/SUCCESS)
    Process: 4638 ExecStartPre=/usr/share/samba/update-apparmor-samba-profile (code=exited, status=0/SUCCESS)
   Main PID: 4643 (smbd)
     Status: "smbd: ready to serve connections..."
      Tasks: 3 (limit: 12292)
     Memory: 5.3M
        CPU: 99ms
     CGroup: /system.slice/smbd.service
             ├─4643 /usr/sbin/smbd --foreground --no-process-group
             ├─4645 /usr/sbin/smbd --foreground --no-process-group
             └─4646 /usr/sbin/smbd --foreground --no-process-group

Dec 28 22:12:17 lynn-server systemd[1]: Starting smbd.service - Samba SMB Daemon...
Dec 28 22:12:17 lynn-server systemd[1]: Started smbd.service - Samba SMB Daemon.
```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

```sh
lynn@lynn-server:~$ smbclient //localhost/myshare -U user1
Password for [WORKGROUP\user1]:
Try "help" to get a list of possible commands.
smb: \> 
```

```sh
lynn@lynn-server:~$ smbclient //localhost/myshare -U user2
Password for [WORKGROUP\user2]:
Try "help" to get a list of possible commands.
smb: \> 
```
<a name="result-4"/>

### Result of Command 4 [↑](#command-4)

```sh
lynn@lynn-server:~$ smbclient //localhost/myshare -U user1
Password for [WORKGROUP\user1]:
Try "help" to get a list of possible commands.
smb: \> l
  .                                   D        0  Sun Dec 17 16:15:43 2023
  ..                                  D        0  Thu Dec 28 21:48:14 2023
  file1.txt                           N        0  Sun Dec 17 16:51:41 2023
  file2.txt                           N        0  Sun Dec 17 15:55:28 2023
  folder0                             D        0  Sun Dec 17 15:57:07 2023

		50254368 blocks of size 1024. 34516012 blocks available
smb: \> get file1.txt
getting file \file1.txt of size 0 as file1.txt (0.0 KiloBytes/sec) (average 0.0 KiloBytes/sec)
smb: \> exit
lynn@lynn-server:~$ 
```

```sh
lynn@lynn-server:~$ smbclient //localhost/myshare -U user2
Password for [WORKGROUP\user2]:
Try "help" to get a list of possible commands.
smb: \> l
  .                                   D        0  Sun Dec 17 16:15:43 2023
  ..                                  D        0  Thu Dec 28 22:15:03 2023
  file1.txt                           N        0  Sun Dec 17 16:51:41 2023
  file2.txt                           N        0  Sun Dec 17 15:55:28 2023
  folder0                             D        0  Sun Dec 17 15:57:07 2023

		50254368 blocks of size 1024. 34515892 blocks available
smb: \> put file3.txt
putting file file3.txt as \file3.txt (0.0 kb/s) (average 0.0 kb/s)
smb: \> l
  .                                   D        0  Sun Dec 17 16:15:43 2023
  ..                                  D        0  Thu Dec 28 22:15:03 2023
  file1.txt                           N        0  Sun Dec 17 16:51:41 2023
  file2.txt                           N        0  Sun Dec 17 15:55:28 2023
  file3.txt                           A        0  Thu Dec 28 22:16:04 2023
  folder0                             D        0  Sun Dec 17 15:57:07 2023

		50254368 blocks of size 1024. 34515892 blocks available
smb: \> exit
lynn@lynn-server:~$ 
```