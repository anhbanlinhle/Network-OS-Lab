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
lynn@lynn-server:~$ sudo service vsftpd status
● vsftpd.service - vsftpd FTP server
     Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; preset: enabled)
     Active: active (running) since Thu 2023-12-28 22:59:03 +07; 5s ago
    Process: 5065 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited, status=0/SUCCESS)
   Main PID: 5067 (vsftpd)
      Tasks: 1 (limit: 12292)
     Memory: 856.0K
        CPU: 9ms
     CGroup: /system.slice/vsftpd.service
             └─5067 /usr/sbin/vsftpd /etc/vsftpd.conf

Dec 28 22:59:03 lynn-server systemd[1]: Starting vsftpd.service - vsftpd FTP server...
Dec 28 22:59:03 lynn-server systemd[1]: Started vsftpd.service - vsftpd FTP server.
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
lynn@lynn-server:~$ ls -l | grep anon.txt
lynn@lynn-server:~$ ftp localhost
Connected to localhost.
220 (vsFTPd 3.0.5)
Name (localhost:lynn): ftp
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||8996|)
150 Here comes the directory listing.
-rw-r--r--    1 0        0               0 Dec 17 17:19 anon.txt
226 Directory send OK.
ftp> get anon.txt
local: anon.txt remote: anon.txt
229 Entering Extended Passive Mode (|||17396|)
150 Opening BINARY mode data connection for anon.txt (0 bytes).
     0        0.00 KiB/s 
226 Transfer complete.
ftp> exit
221 Goodbye.
lynn@lynn-server:~$ ls -l | grep anon.txt
-rw-rw-r--  1 lynn   lynn       0 Dec 18 00:19 anon.txt
```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

```sh
lynn@lynn-server:~$ ls -l | grep server_data.txt
lynn@lynn-server:~$ ftp localhost
Connected to localhost.
220 (vsFTPd 3.0.5)
Name (localhost:lynn): lynn
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> cd server
250 Directory successfully changed.
ftp> get server_data.txt
local: server_data.txt remote: server_data.txt
229 Entering Extended Passive Mode (|||54562|)
150 Opening BINARY mode data connection for server_data.txt (0 bytes).
     0        0.00 KiB/s 
226 Transfer complete.
ftp> exit
221 Goodbye.
lynn@lynn-server:~$ ls -l | grep server_data.txt
-rw-rw-r--  1 lynn   lynn       0 Dec 29  2023 server_data.txt
```

<a name="result-4"/>

### Result of Command 4 [↑](#command-4)

```sh
lynn@lynn-server:~$ ftp localhost
Connected to localhost.
220 (vsFTPd 3.0.5)
Name (localhost:lynn): lynn
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> cd server
250 Directory successfully changed.
ftp> ls
229 Entering Extended Passive Mode (|||53461|)
150 Here comes the directory listing.
-rw-rw-r--    1 1000     1000            0 Dec 28 23:02 server_data.txt
226 Directory send OK.
ftp> put client_data.txt
local: client_data.txt remote: client_data.txt
229 Entering Extended Passive Mode (|||60585|)
150 Ok to send data.
100% |*******************************************************************************************************************************************************|    13       64.44 KiB/s    00:00 ETA
226 Transfer complete.
13 bytes sent in 00:00 (20.21 KiB/s)
ftp> ls
229 Entering Extended Passive Mode (|||32406|)
150 Here comes the directory listing.
-rw-------    1 1000     1000           13 Dec 28 23:03 client_data.txt
-rw-rw-r--    1 1000     1000            0 Dec 28 23:02 server_data.txt
226 Directory send OK.
ftp> exit
221 Goodbye.
lynn@lynn-server:~$ 
```

<a name="result-5"/>

### Result of Command 5 [↑](#command-5)

```sh
lynn@lynn-server:~$ ftp localhost
Connected to localhost.
220 (vsFTPd 3.0.5)
Name (localhost:lynn): lynn
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> pwd
Remote directory: /home/lynn
ftp> cd /home/user1
250 Directory successfully changed.
ftp> pwd
Remote directory: /home/user1
ftp> exit
221 Goodbye.
```

<a name="result-6"/>

### Result of Command 6 [↑](#command-6)

```sh
lynn@lynn-server:~$ ftp localhost
Connected to localhost.
220 (vsFTPd 3.0.5)
Name (localhost:lynn): lynn
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> pwd
Remote directory: /
ftp> cd /home/user1
550 Failed to change directory.
ftp> exit
221 Goodbye.
```

