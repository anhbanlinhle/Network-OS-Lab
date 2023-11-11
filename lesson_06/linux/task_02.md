# Requirements

- Tạo một nhóm có tên là `sales` với câu lệnh `groupadd`.

- Thêm người dùng `tux` vào nhóm này bằng câu lệnh `gpasswd`.

- Đăng nhập với `tux` và tham gia vào nhóm `sales` với `newgrp`.

# Solution

## Commands

### Command 1

Create new group **sales**

```sh
sudo groupadd sales
```

Check if group **sales** created successfully

```sh
grep sales /etc/group
```

### Command 2

Add user **tux** to group **sales**

```sh
sudo gpasswd -a tux sales
```

Check if user **tux** was added to group **sales**

```sh
groups tux
```

### Command 3

Activate **tux** to setup password

```sh
sudo passwd tux
```

Login as **tux** in shell

```sh
su - tux
```

Check **tux**'s old groups order

```sh
groups
```

Change **tux**'s effective group to **sales**

```sh
newgrp sales
```

Check **tux**'s new groups order

```sh
groups
```

## Results

### Command 1

Create new group **sales**

```sh
lynn@lynn-server:~$ grep sales /etc/group
sales:x:1003:tux
```

### Command 2

```sh
lynn@lynn-server:~$ sudo gpasswd -a tux sales
Adding user tux to group sales
```

```sh
lynn@lynn-server:~$ groups tux
tux : test_group wheel sales
```

### Command 3

```sh
lynn@lynn-server:~$ su - tux
Password: 
$
```

```sh
$ groups
test_group wheel sales
```

```sh
$ groups
sales test_group wheel
```