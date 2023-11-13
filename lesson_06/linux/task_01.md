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
    - [Command 7](#command-7)

  - [Results](#results)
    - [Result of Command 1](#result-1)
    - [Result of Command 2](#result-2)
    - [Result of Command 3](#result-3)
    - [Result of Command 4](#result-4)
    - [Result of Command 5](#result-5)
    - [Result of Command 6](#result-6)
    - [Result of Command 7](#result-7)

<a name="requirements"/>

# Requirements

- Sử dụng `useradd` để tạo người dùng có tên là `tux` với ID người dùng là `600` và GID nhóm là `550`.

- Sử dụng `usermod` để thay đổi thư mục gốc của người dùng

- Có cần thiết phải tạo một thư mục mới không?

- Nội dung của `/etc/skel` có được copy sang thư mục mới không?

- Các nội dung trong thư mục gốc cũ vẫn có thể được truy cập bởi người dùng `tux` không?

- Sử dụng `usermod` để thêm `tux` vào nhóm `wheel`.

<a name="solutions"/>

# Solution

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1

Check if any group with **gid = 550** exists

```sh
grep 550 /etc/group
```

If don't, create a new group with **gid = 550**

```sh
sudo groupadd -g 550 test_group
```

<a name="command-2"/>

### Command 2

Create user **tux** with **id = 600** and **gid = 550**

```sh
sudo useradd -m -u 600 -g 550 tux
```

Check if user **tux** created successfully

```sh
grep tux /etc/passwd
```

<a name="command-3"/>

### Command 3

Check user **tux**'s old home directory

```sh
grep tux /etc/passwd
```

Modify user **tux**'s home directory

```sh
sudo usermod -d /home/tux_alt tux
```

Check user **tux**'s new home directory

```sh
grep tux /etc/passwd
```

<a name="command-4"/>

### Command 4

Check if any new home directory is created

```sh
ls /home/
```

We need to create a new directory since `usermod` don't do it by default unless `-m` option was added

<a name="command-5"/>

### Command 5

Check **tux**'s old home directory's content

```sh
sudo ls -a /home/tux/
```

Check **tux**'s new home directory's content

```sh
sudo ls -a /home/tux_alt/
```

`etc/skel`'s contents were not coppied since `usermod` don't do it by default unless `-m` option was added

<a name="command-6"/>

### Command 6

Create new group **wheel**

```sh
sudo groupadd wheel
```

Check if group **wheel** created successfully

```sh
grep wheel /etc/group
```

<a name="command-7"/>

### Command 7

Add user **tux** to group **wheel**

```sh
sudo usermod -aG wheel tux
```

Check if user **tux** was added to group **wheel**

```sh
groups tux
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1

```sh
lynn@lynn-server:~$ grep 550 /etc/group
test_group:x:550:
```

<a name="result-2"/>

### Result of Command 2

```sh
lynn@lynn-server:~$ grep tux /etc/passwd
tux:x:600:550::/home/tux:/bin/bash
```

<a name="result-3"/>

### Result of Command 3

```sh
lynn@lynn-server:~$ grep tux /etc/passwd
tux:x:600:550::/home/tux:/bin/bash
```

```sh
lynn@lynn-server:~$ grep tux /etc/passwd
tux:x:600:550::/home/tux_alt:/bin/bash
```

<a name="result-4"/>

### Result of Command 4

```sh
lynn@lynn-server:~$ ls /home
lynn  tux  user01
```

<a name="result-5"/>

### Result of Command 5

```sh
lynn@lynn-server:~$ sudo ls -a /home/tux
.  ..  .bash_logout  .bashrc  .profile
```

```sh
lynn@lynn-server:~$ sudo ls -a /home/tux_alt
.  ..
```

<a name="result-6"/>

### Result of Command 6

```sh
lynn@lynn-server:~$ grep wheel /etc/group
wheel:x:1002:tux
```

<a name="result-7"/>

### Result of Command 7

```sh
lynn@lynn-server:~$ groups tux
tux : test_group wheel
```