<h1>Requirements</h1>

Tạo file  `/root/backup.tar.bz2`  là bản backup dạng nén của thư mục backup trong bài 4. Sau đó giải nén file này thành thư mục  `/lab`  với cấu trúc thư mục như  `/backup`.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1 zipping</h3>

```sh
tar cf backup.tar backup
```

<h3>Command 2 zipping</h3>

```sh
bzip2 -z backup.tar > /root/backup.tar.bz2
```

<h2>Results</h2>

<h3>Command 1 zipping</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % ls backup.tar
ls: backup.tar: No such file or directory
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % tar cf backup.tar backup
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % ls backup.tar           
backup.tar
```

<h3>Command 2 zipping</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % ls backup.tar.bz2  
ls: backup.tar.bz2: No such file or directory
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % bzip2 -z backup.tar     
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % ls backup.tar.bz2  
backup.tar.bz2
```