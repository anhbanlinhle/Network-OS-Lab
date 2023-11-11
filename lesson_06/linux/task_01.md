# Requirements

- Sử dụng `useradd` để tạo người dùng có tên là `tux` với ID người dùng là `600` và GID nhóm là `550`.

- Sử dụng `usermod` để thay đổi thư mục gốc của người dùng

- Có cần thiết phải tạo một thư mục mới không?

- Nội dung của `/etc/skel` có được copy sang thư mục mới không?

- Các nội dung trong thư mục gốc cũ vẫn có thể được truy cập bởi người dùng `tux` không?

- Sử dụng `usermod` để thêm `tux` vào nhóm `wheel`.

# Solution

## Commands

### Command 1

Check if any group with **gid = 550** exists

```sh
grep 550 /etc/group
```

If don't, create a new group with **gid = 550**

```sh
sudo groupadd -g 550 test_group
```

### Command 2

Create user **tux** with **id = 600** and **gid = 550**

```sh
sudo useradd -m -u 600 -g 550 tux
```

Check if user **tux** created successfully

```sh
grep tux /etc/passwd
```

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

### Command 4

Check if any new home directory is created

```sh
ls /home/
```

We need to create a new directory since `usermod` don't do it by default unless `-m` option was added

### Command 5

Check **tux**'s old home directory's content

```sh
ls -a /home/tux/
```

Check **tux**'s new home directory's content

```sh
ls -a /home/tux_alt/
```

`etc/skel`'s contents were not coppied since `usermod` don't do it by default unless `-m` option was added

### Command 6

Create new group **wheel**

```sh
sudo groupadd wheel
```

Check if group **wheel** created successfully

```sh
grep wheel /etc/group
```

### Command 7

Add user **tux** to group **wheel**

```sh
sudo usermod -aG wheel tux
```

Check if user **tux** was added to group **wheel**

```sh
groups tux
```

## Solution

