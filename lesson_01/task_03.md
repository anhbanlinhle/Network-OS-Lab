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
Lưu ý: Các file được tạo có nội dung được chép từ file `/etc/passwd` .

<h1>Solution</h1>

<h3>Commands</h3>

```sh
mkdir lab lab/data lab/project
```

```sh
cat /etc/passwd > lab/data/file1.txt > lab/data/file2.txt
```

<h3>Results</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % mkdir lab lab/data lab/project
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % tree lab
lab
├── data
└── project

3 directories, 0 files
```
```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % cat /etc/passwd > lab/data/file1.txt > lab/data/file2.txt
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % tree lab
lab
├── data
│   ├── file1.txt
│   └── file2.txt
└── project

3 directories, 2 files
```