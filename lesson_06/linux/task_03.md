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

- Thêm một người dùng vào hệ thống bằng cách soạn thảo `/etc/passwd` và `/etc/group`.

- Tạo một nhóm có tên là `share` và thêm người dùng `tux` vào nhóm này bằng cách soạn thảo bằng tay `/etc/group`.

<a name="solutions"/>

# Solution

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

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

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

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

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

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

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ grep alt_usr /etc/passwd
alt_usr:x:1111:2222::/home/alt_usr:/bin/sh
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
lynn@lynn-server:~$ grep alt_grp /etc/group
alt_grp:x:2222:alt_usr
```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

```sh
lynn@lynn-server:~$ grep share /etc/group
share:x:3333:tux
```