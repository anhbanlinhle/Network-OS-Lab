<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

  - [Commands](#commands)
    - [Command 1](#command-1)
    - [Command 2](#command-2)
    - [Command 3](#command-3)

  - [Results](#results)
    - [Result of Command 1](#result-1)
    - [Result of Command 2](#result-2)
    - [Result of Command 3](#result-3)

<a name="requirements"/>

# Requirements

- Tạo một nhóm có tên là `sales` với câu lệnh `groupadd`.

- Thêm người dùng `tux` vào nhóm này bằng câu lệnh `gpasswd`.

- Đăng nhập với `tux` và tham gia vào nhóm `sales` với `newgrp`.

<a name="solutions"/>

# Solution

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Create new group **sales**

```sh
sudo groupadd sales
```

Check if group **sales** created successfully

```sh
grep sales /etc/group
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Add user **tux** to group **sales**

```sh
sudo gpasswd -a tux sales
```

Check if user **tux** was added to group **sales**

```sh
groups tux
```

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

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

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ grep sales /etc/group
sales:x:1003:tux
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
lynn@lynn-server:~$ sudo gpasswd -a tux sales
Adding user tux to group sales
```

```sh
lynn@lynn-server:~$ groups tux
tux : test_group wheel sales
```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

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