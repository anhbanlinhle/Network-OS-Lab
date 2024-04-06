# Requirements

Giả sử, quản trị mạng **A** được giao nhiệm vụ quản trị các máy server **R01**, **R02**. Tuy nhiên, **A** không thể vào phòng server để sử dụng bàn phím/chuột trực tiếp. **A** quyết định sử dụng `SSH` để quản trị các máy tính này từ xa. Để đảm bảo an toàn, tránh các phần mềm KeyLog có thể vô tình bị nhiễm, **A** quyết định sử dụng cơ chế xác thực thông qua bộ khóa công khai của người dùng theo cơ chế `RSA`.

- Hãy thiết lập server `R02` sao cho máy tính PC có khả năng đăng nhập từ xa như `root` thông qua `SSH` vào server trên mà **không cần mật khẩu**.

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

Activate **root** user

```sh
sudo passwd root
```

### Command 4 - Client

Generate keys for client

```sh
ssh-keygen -t rsa
```

### Command 5 - Server

Modify SSH configuration file

```sh
sudo vi /etc/ssh/sshd_config
```

File Content

```sh
...

PubkeyAuthentication yes
PermitRootLogin yes
AuthorizedKeysFile .ssh/authorized_keys
AllowUsers user01 root

...
```

Restart service after file changes

```sh
sudo systemctl restart ssh
```

### Command 6 - Client

Send client's public key to server

```sh
ssh-copy-id -i /Users/admin/.ssh/id_rsa.pub root@192.168.1.5 
```

### Command 7 - Client

SSH to server from client

```sh
ssh 'root@192.168.1.5'
```

## Solution

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
lynn@lynn-server:~$ sudo passwd root
New password: 
Retype new password: 
passwd: password updated successfully
```

### Command 4 - Client

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/admin/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/admin/.ssh/id_rsa
Your public key has been saved in /Users/admin/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:******************************************* admin@Lynn-2.local
The key's randomart image is:
+---[RSA 3072]----+
|     .BXo  ..+o++|
|     ++++ o   Xo+|
|      Bo.+   o *o|
|     + =...   .. |
|      . S..     .|
|       E .. . . .|
|           o   +o|
|            ...o=|
|            ..o+o|
+----[SHA256]-----+
```

### Command 5 - Server

```sh
Include /etc/ssh/sshd_config.d/*.conf

PubkeyAuthentication yes
PermitRootLogin yes
AuthorizedKeysFile .ssh/authorized_keys
AllowUsers user01 root

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
"/etc/ssh/sshd_config" 15L, 319B written                      1,1           All
```

### Command 6 - Client 

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ssh-copy-id -i /Users/admin/.ssh/id_rsa.pub root@192.168.1.5 
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/Users/admin/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@192.168.1.5's password: 

Number of key(s) added:        1

Now try logging into the machine, with:   "ssh 'root@192.168.1.5'"
and check to make sure that only the key(s) you wanted were added.

```

### Command 7 - Client 

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ssh 'root@192.168.1.5'
Welcome to Ubuntu 23.04 (GNU/Linux 6.2.0-36-generic x86_64)

Last login: Sat Nov  4 16:09:45 2023 from 10.90.114.223
root@lynn-server:~# 
```