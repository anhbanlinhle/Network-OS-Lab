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

Nhập A, B bằng bàn phím để tính A + B. </br>
Sau đó tạo file `input.txt` có nội dung như sau (lưu ý có 3 dòng, dòng thứ 3 trống)

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

<h3>Requirement 1</h3>

- Command `cat` không có argument -> tự chọn stdin là bàn phím để lấy dữ liệu vào
- Operator `>` điều hướng dữ liệu từ command trên để ghi vào file `new.txt`
- Các dòng dữ liệu do người dùng nhập từ bàn phím chính là `stdin`
- <kbd>Ctrl</kbd>+<kbd>D</kbd> để chèn ký tự `EOF` (end of file) báo hiệu kết thúc file
- Nội dung từ `stdin` được ghi vào file `new.txt`

<h3>Requirement 2</h3>

<h3>Command 1</h3>

```sh
sudo vi sum.sh
```

<h3>File content</h3>

```sh
echo "Nhap A: "; read A
echo "Nhap B: "; read B
echo “A + B = $($A + $B)"
```

<h3>Command 2</h3>

```sh
:w
```

<h3>Command 3</h3>

```sh
:q
```

<h3>Command 4</h3>

```sh
sudo chmod a+x sum.sh
```

<h3>Command 5</h3>

```sh
./sum.sh
```

<h3>Command 6</h3>

```sh
sudo vi input.txt
```

<h3>File content</h3>

```sh
16
27

```

<h3>Command 7</h3>

```sh
:w
```

<h3>Command 8</h3>

```sh
:q
```

<h3>Command 9</h3>

```sh
./sum.sh < input.txt
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh

~                                                                               
~                                                                               
"sum.sh" [New]                                                0,0-1         All
```

<h3>Command 2</h3>

```sh
echo "Nhap A: "; read A
echo "Nhap B: "; read B
echo "A + B = $(($A + $B))"
~                                                                               
~                                                                               
"sum.sh" [New] 3L, 76B written                                3,3,27       All
```

<h3>Command 3</h3>

```sh
lynn@lynn-server:/$ sudo vi sum.sh
lynn@lynn-server:/$ 
```

<h3>Command 4</h3>

```sh
lynn@lynn-server:/$ sudo chmod a+x sum.sh
lynn@lynn-server:/$ 
```

<h3>Command 5</h3>

```sh
lynn@lynn-server:/$ ./sum.sh
Nhap A: 
22
Nhap B: 
10
A + B = 32
```

<h3>Command 6</h3>

```sh
~                                                                               
~                                                                               
"input.txt" [New]                                             0,0-1         All
```

<h3>Command 7</h3>

```sh
16
27

~                                                                               
~                                                                               
"input.txt" [New] 3L, 7B written                              3,0-1         All
```

<h3>Command 8</h3>

```sh
lynn@lynn-server:/$ sudo vi input.txt
lynn@lynn-server:/$ 
```

<h3>Command 9</h3>

```sh
lynn@lynn-server:/$ ./sum.sh < input.txt
Nhap A: 
Nhap B: 
A + B = 43
```