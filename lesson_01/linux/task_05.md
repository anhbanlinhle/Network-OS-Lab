<h1>Requirements</h1>

Tạo file  `/root/backup.tar.bz2`  là bản backup dạng nén của thư mục backup trong bài 4. 
Sau đó giải nén file này thành thư mục  `/lab`  với cấu trúc thư mục như  `/backup`.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1 zipping</h3>

```sh
sudo tar cf backup.tar backup
```

<h3>Command 2 zipping</h3>

```sh
sudo bzip2 -z backup.tar  
```

<h3>Command 1 unzipping</h3>

```sh
sudo bzip2 -d backup.tar.bz2
```

<h3>Command 2 unzipping</h3>

```sh
sudo mkdir lab
```
```sh
sudo tar –xf backup.tar –C lab/
```
```sh
sudo mv lab/backup/* lab
```
```sh
sudo rmdir lab/backup
```

<h2>Results</h2>

<h3>Command 1 zipping</h3>

```sh
lynn@lynn-server:/$ ls backup.tar
ls: cannot access 'backup.tar': No such file or directory
lynn@lynn-server:/$ sudo tar cf backup.tar backup
lynn@lynn-server:/$ ls backup.tar
backup.tar
```

<h3>Command 2 zipping</h3>

```sh
lynn@lynn-server:/$ ls backup.tar.bz2
ls: cannot access 'backup.tar.bz2': No such file or directory
lynn@lynn-server:/$ sudo bzip2 -z backup.tar
lynn@lynn-server:/$ ls backup.tar.bz2
backup.tar.bz2
```

<h3>Command 1 unzipping</h3>

```sh
lynn@lynn-server:/$ ls backup.tar
ls: cannot access 'backup.tar': No such file or directory
lynn@lynn-server:/$ sudo bzip2 -d backup.tar.bz2
lynn@lynn-server:/$ ls backup.tar
backup.tar
```

<h3>Command 2 unzipping</h3>

```sh
lynn@lynn-server:/$ sudo mkdir lab
lynn@lynn-server:/$ sudo tar -xf backup.tar -C lab/
lynn@lynn-server:/$ sudo mv lab/backup/* lab
lynn@lynn-server:/$ sudo rmdir lab/backup
lynn@lynn-server:/$ tree lab
lab
├── data
│   ├── file1.txt
│   ├── file2.txt
│   └── more2.txt
└── project
    └── more1.txt

3 directories, 4 files
```