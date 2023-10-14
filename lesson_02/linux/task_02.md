<h1>Requirements</h1>

<h3>Requirement 1</h3>

Chạy lệnh sau  `cat > /tmp/new.txt`  gõ một số đoạn ký tự có xuống dòng rồi nhấn <kbd>Ctrl</kbd>+<kbd>D</kbd> để kết thúc nhập. </br> 
Giải thích các thao tác trên

<h3>Requirement 2</h3>

Tạo file `sum.sh` có nội dung như sau:

```sh
echo –n “Nhap A: ”; read A
echo –n “Nhap B: ”; read B
echo “A + B = $(($A + $B))
```

Sau đó thực hiện các lệnh sau để chạy file mới tạo

```sh
chmod a+x sum.sh
./sum.sh
```

Nhập A, B bằng bàn phím để tính A + B. Sau đó tạo file `input.txt` có nội dung như sau (lưu ý có 3 dòng, dòng thứ 3 trống)

```sh
16
27

```

Sau đó chạy lệnh sau để kiểm tra chuyển hướng đầu vào (`stdin`)

```sh
./sum.sh < input.txt
```

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
command
```

<h3>Command 2</h3>

```sh
command
```

<h3>...</h3>

<h3>Command n</h3>

```sh
command
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
executed command results
```

<h3>Command 2</h3>

```sh
executed command results
```

<h3>...</h3>

<h3>Command n</h3>

```sh
executed command results
```