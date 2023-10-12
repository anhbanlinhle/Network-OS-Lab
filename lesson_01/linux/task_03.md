<h1>Requirements</h1>
Hãy sử dụng những lệnh đã biết ở bài 2 để tạo cấu trúc thư mục sau bằng số lệnh ít nhất có thể, số lần gõ bàn phím ít nhất có thể:

```
/-
  |-/lab

    |-/data

    | |- file1.txt

    | |- file2.txt

    |-/project
```
Lưu ý: Các file được tạo có nội dung được chép từ file `/etc/passwd`.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
sudo mkdir lab lab/data lab/project
```

<h3>Command 2</h3>

```sh
sudo cp /etc/passwd lab/data/file1.txt
```

<h3>Command 3</h3>

```sh
sudo cp /etc/passwd lab/data/file2.txt
```

<h2>Results</h2>

<h3>Command 1</h3>

```sh
lynn@lynn-server:/$ sudo mkdir lab lab/data lab/project
lynn@lynn-server:/$ tree lab
lab
├── data
└── project

3 directories, 0 files
```

<h3>Command 2</h3>

```sh
lynn@lynn-server:/$ sudo cp /etc/passwd lab/data/file1.txt
lynn@lynn-server:/$ tree lab
lab
├── data
│   └── file1.txt
└── project

3 directories, 1 files
```

<h3>Command 3</h3>

```sh
lynn@lynn-server:/$ sudo cp /etc/passwd lab/data/file1.txt
lynn@lynn-server:/$ tree lab
lab
├── data
│   ├── file1.txt
│   └── file2.txt
└── project

3 directories, 2 files
```