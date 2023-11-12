# Requirements

- Thêm một người dùng vào hệ thống bằng cách soạn thảo `/etc/passwd` và `/etc/group`.

- Tạo một nhóm có tên là `share` và thêm người dùng `tux` vào nhóm này bằng cách soạn thảo bằng tay `/etc/group`.

# Solution

## Commands

### Command 1

Add new line in `/etc/passwd`

```sh
sudo vi /etc/passwd
```

File content

```sh
alt_usr:x:1111:2222::/home/alt_usr:/bin/sh
```

Check if user **alt_usr** added successfully

```sh
grep alt_usr /etc/passwd
```

### Command 2

Add new line in `/etc/group`

```sh
sudo vi /etc/group
```

File content

```sh
alt_grp:x:2222:alt_usr
```

Check if group **alt_grp** added successfully

```sh
grep alt_grp /etc/group
```

### Command 3

Add new line in `/etc/group`

```sh
sudo vi /etc/group
```

File content

```sh
share:x:3333:tux
```

Check if group **share** added with user **tux** in it successfully

```sh
grep share /etc/group
```

## Results

### Command 1

```sh
lynn@lynn-server:~$ grep alt_usr /etc/passwd
alt_usr:x:1111:2222::/home/alt_usr:/bin/sh
```

### Command 2

```sh
lynn@lynn-server:~$ grep alt_grp /etc/group
alt_grp:x:2222:alt_usr
```

### Command 3

```sh
lynn@lynn-server:~$ grep share /etc/group
share:x:3333:tux
```