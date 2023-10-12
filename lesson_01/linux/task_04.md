<h1>Requirements</h1>

- Hãy sao chép thư mục `/lab` ở bài 3 thành thư mục `/backup` **(lưu ý thư mục `/backup` chưa tồn tại)** sau đó tạo thêm hai file có nội dung giống như hai file trước có tên là `/lab/project/more1.txt`  và  `/lab/data/more2.txt`.
- Lại sao chép thư mục `/lab` ở trên thành thư mục `/backup` **(lưu ý lúc này đã có thư mục này)** với yêu cầu là không phải trả lời các câu hỏi có ghi đè không mà ghi đè trực tiếp không hỏi, sau đó xóa thư mục `/lab`.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
sudo cp -r lab backup
```

<h3>Command 2</h3>

```sh
sudo cp /etc/passwd lab/project/more1.txt
```

<h3>Command 3</h3>

```sh
sudo cp /etc/passwd lab/data/more2.txt
```

<h3>Command 4</h3>

```sh
sudo cp -Rf lab/* backup
```

<h3>Command 5</h3>

```sh
sudo rm -rf lab
```

<h1>Results</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
lynn@lynn-server:/$ sudo cp -r lab backup
lynn@lynn-server:/$ tree backup
backup
├── data
│   ├── file1.txt
│   └── file2.txt
└── project

3 directories, 2 files
```

<h3>Command 2</h3>

```sh
lynn@lynn-server:/$ sudo cp /etc/passwd lab/project/more1.txt
lynn@lynn-server:/$ tree lab
lab
├── data
│   ├── file1.txt
│   └── file2.txt
└── project
    └── more1.txt

3 directories, 3 files
```

<h3>Command 3</h3>

```sh
lynn@lynn-server:/$ sudo cp /etc/passwd lab/data/more2.txt
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

<h3>Command 4</h3>

```sh
lynn@lynn-server:/$ sudo cp -Rf lab/* backup
lynn@lynn-server:/$ tree backup
backup
├── data
│   ├── file1.txt
│   ├── file2.txt
│   └── more2.txt
└── project
    └── more1.txt

3 directories, 4 files
```

<h3>Command 5</h3>

```sh
lynn@lynn-server:/$ sudo rm -rf lab
lynn@lynn-server:/$ tree lab
lab  [error opening dir]

0 directories, 0 files
```