<h1>Requirements</h1>

- Sử dụng lệnh  `adduser test`  để tạo người dùng test, hãy kết hợp hai lệnh `echo` và `passwd` để thay đổi mật khẩu của người dùng này chỉ cần 1 lần nhấn <kbd>Enter</kbd>
- Biết `A` là biến chứa một số nguyên dương. Hãy kết hợp giữa hai lệnh `head` và `tail` để hiển thị dòng thứ A trong file `/var/log/messages` (không cần kiểm tra `A` có lớn hơn số dòng trong file không)
- Hãy hiển thị tất cả các dòng không có từ `nologin` trong `/etc/passwd`

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
sudo adduser test
```

<h3>Command 2</h3>

```sh
echo "test:new_passwd" | sudo chpasswd
```

<h3>Command 3</h3>

```sh
cat > task_04.sh
```

<h3>Command 4</h3>

```sh
./task_04.sh
```

<h3>Command 5</h3>

```sh
grep -v "nologin" /etc/passwd
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
lynn@lynn-server:~$ sudo adduser test
Adding user `test' ...
Adding new group `test' (1001) ...
Adding new user `test' (1001) with group `test (1001)' ...
Creating home directory `/home/test' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for test
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
Adding new user `test' to supplemental / extra groups `users' ...
Adding user `test' to group `users' ...
```

<h3>Command 2</h3>

```sh
lynn@lynn-server:~$ echo "test:new_passwd" | sudo chpasswd
lynn@lynn-server:~$ su test
Password: 
test@lynn-server:/home/lynn$ 
```

<h3>Command 3</h3>

```sh
lynn@lynn-server:~$ cat > task_04.sh
echo "Nhap so dong can doc: "; read A
head -n "$A" /tmp/diem.txt | tail -n 1
```

<h3>Command 4</h3>

```sh
lynn@lynn-server:~$ ./task_04.sh
Nhap so dong can doc: 
7
minh nam 89 93 182
```

<h3>Command 5</h3>

```sh
lynn@lynn-server:~$ grep -v "nologin" /etc/passwd
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
pollinate:x:101:1::/var/cache/pollinate:/bin/false
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
lynn:x:1000:1000:Viet Linh:/home/lynn:/bin/bash
...
```