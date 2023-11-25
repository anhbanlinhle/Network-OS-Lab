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

  - [Results](#results)
    - [Result of Command 1](#result-1)
    - [Result of Command 2](#result-2)
    - [Result of Command 3](#result-3)
    - [Result of Command 4](#result-4)
    - [Result of Command 5](#result-5)

<a name="requirements"/>

# Requirements

- Tạo 3 người dùng `user1`, `user2`, `user3` và 3 thư mục `f1`, `f2`, `f3`
- Thiết lập để `user1` là người dùng sở hữu thư mục `f1` và các file con
- Thiết lập để `user2` có quyền đọc và viết trên `f2` và cho bất kỳ file/thư mục con nào được tạo trong thư mục đó
- Xoá người dùng `user3` và các thư mục, file phụ thuộc

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Create users and their home directories

```sh
users=("user1" "user2" "user3")

for user in ${users[@]}
do
  sudo useradd -m $user
done
```

Check if created users successfully

```sh
grep "user1\|user2\|user3" /etc/passwd
```

Check home directories

```sh
ls /home | grep "user1\|user2\|user3"
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Create folders

```sh
mkdir f1 f2 f3
```

Check if created successfully

```sh
ls | grep "f1\|f2\|f3"
```

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

Set **user1** as owner of **f1** and its children

```sh
sudo chown -hR user1:user1 f1
```

Check **f1** permissions and owner

```sh
ls -l | grep f1
```

Check **f1** access control list

```sh
getfacl f1
```

<a name="command-4"/>

### Command 4 [↑](#bookmarks) [↓](#result-4)

Set **user2** permissions to read & write in **f2** and its children

```sh
sudo setfacl --default --recursive --modify u:user2:rw f2
```

Check **f2** access list control

```sh
getfacl f2
```

<a name="command-5"/>

### Command 5 [↑](#bookmarks) [↓](#result-5)

Find **user3** on system

```sh
grep user3 /etc/passwd
```

Find **user3** home directory

```sh
ls /home | grep user3
```

Remove **user3** and their folders & files

```sh
sudo userdel --remove user3
```
Find **user3** on system

```sh
grep user3 /etc/passwd
```

Find **user3** home directory

```sh
ls /home | grep user3
```


<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
executed command results
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
executed command results
```

<a name="result-3"/>

### Result of Command 3 [↑](#command-3)

```sh
executed command results
```

<a name="result-4"/>

### Result of Command 4 [↑](#command-4)

```sh
executed command results
```

<a name="result-5"/>

### Result of Command 5 [↑](#command-5)

```sh
executed command results
```