<h1>Requirements</h1>

Chạy lệnh sau để đảm bảo không có file `nofile rm –f nofile`  sau đó lần lượt chạy các lệnh sau

```sh
cat nofile > output.txt 2>&1
cat nofile 2>&1 > output.txt
```

Hãy giải thích các hiện tượng diễn ra trên màn hình và nội dung file `output.txt`

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
cat nofile > output.txt 2>&1
```

<h3>Command 2</h3>

```sh
cat nofile 2>&1 > output.txt
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat nofile > output.txt 2>&1
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat output.txt
cat: nofile: No such file or directory
```

- Không tồn tại file `nofile` nên command `cat` không thể đọc được
- Operator `>` đầu tiên sẽ chuyển hướng thông báo lỗi từ `stdout` vào nội dung file
`output.txt`
- Operator `2>&1` thứ hai sẽ chuyển hướng thông báo lỗi từ `stderr` ra `stdout`, nhưng
ở đây `stderr` đã chuyển vào file `output.txt` rồi
- Kiểm tra nội dung file `output.txt` ta sẽ thấy thông báo lỗi của command ban đầu

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat nofile 2>&1 > output.txt
cat: nofile: No such file or directory
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat output.txt
(base) admin  Lynn-2 ∫ ~/Desktop ∫ 
```

- Không tồn tại file `nofile` nên command `cat` không thể đọc được
- Operator `2>&1` đầu tiên sẽ chuyển hướng thông báo lỗi từ `stderr` ra `stdout`, chính
là thông báo lỗi gặp phải ghi dùng command `cat` đọc file `nofile`
- Operator `>` thứ hai sẽ chuyển hướng thông báo đầu ra của `stdout` vào file
`output.txt`, nhưng ở đây `stdout` đang trống
- Kiểm tra nội dung file `output.txt` ta sẽ thấy rỗng