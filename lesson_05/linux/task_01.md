<h1>Requirements</h1>

Giả sử, quản trị mạng **A** được giao nhiệm vụ quản trị các máy server **R01**, **R02**. Tuy nhiên, **A** không thể vào phòng server để sử dụng bàn phím/chuột trực tiếp. **A** quyết định sử dụng `SSH` để quản trị các máy tính này từ xa. Để đảm bảo an toàn, tránh các phần mềm KeyLog có thể vô tình bị nhiễm, **A** quyết định sử dụng cơ chế xác thực thông qua bộ khóa công khai của người dùng theo cơ chế `RSA`.

-   Trên server `R01`, tạo tài khoản `user01` và cấu hình server này sao cho từ các máy tính khác có thể đăng nhập từ xa chỉ bằng tài khoản của `user01` thông qua dịch vụ `SSH`.

# Prerequisites

Install OpenSSH on both `client` and `server`

## Server - Linux

```sh
sudo apt install openssh-server
```

## Client - MacOS

```sh
brew install openssh
```

# Solution

## Commands

### Command 1 - Server 

Get server's IP address

```sh
ifconfig -a
```

### Command 2 - Client

Test connection from client to server

```sh
ping 192.168.1.5
```

### Command 3 - Server

Add **user01** to server system

```sh
sudo adduser user01
```

### Command 4 - Server 

Modify SSH configuration file

```sh
sudo vi /etc/ssh/sshd_config
```

File Content

```sh
...

AllowUsers user01

PasswordAuthentication yes

...
```

Restart service after file changes

```sh
sudo systemctl restart ssh
```

### Command 5 - Client

SSH to server from client

```sh
ssh 'user01@192.168.1.5'
```


## Results

### Command 1 - Server

```sh
lynn@lynn-server:~$ ifconfig -a
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.5  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::a00:27ff:fe13:f19  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:13:0f:19  txqueuelen 1000  (Ethernet)
        RX packets 38  bytes 8031 (8.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 66  bytes 8308 (8.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

...
```

### Command 2 - Client

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ping 192.168.1.5
PING 192.168.1.5 (192.168.1.5): 56 data bytes
64 bytes from 192.168.1.5: icmp_seq=0 ttl=64 time=1.116 ms
64 bytes from 192.168.1.5: icmp_seq=1 ttl=64 time=1.667 ms
64 bytes from 192.168.1.5: icmp_seq=2 ttl=64 time=1.482 ms
```

### Command 3 - Server

```sh
lynn@lynn-server:~$ sudo adduser user01
Adding user `user01' ...
Adding new group `user01' (1001) ...
Adding new user `user01' (1001) with group `user01 (1001)' ...
Creating home directory `/home/user01' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for user01
Enter the new value, or press ENTER for the default
	Full Name []: user01
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
Adding new user `user01' to supplemental / extra groups `users' ...
Adding user `user01' to group `users' ...
```

### Command 4 - Server 

```sh
Include /etc/ssh/sshd_config.d/*.conf

AllowUsers user01

PasswordAuthentication yes

PermitEmptyPasswords yes
KbdInteractiveAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
~                                                                               
~                                                                               
"/etc/ssh/sshd_config" 15L, 345B                              1,1           All
```

### Command 5 - Client

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ssh 'user01@192.168.1.5'
user01@192.168.1.5's password: 
Welcome to Ubuntu 23.04 (GNU/Linux 6.2.0-36-generic x86_64)

Last login: Sat Nov  4 22:18:21 2023 from 192.168.1.7
user01@lynn-server:~$ 
```

