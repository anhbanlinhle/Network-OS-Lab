<h1>Requirements</h1>

Biết lệnh `ps` sẽ hiển thị các tiến trình trong bộ nhớ, hãy hiển thị một danh sách 10 tiến trình chiếm nhiều CPU nhất theo dạng 2 cột (`PID`, `%CPU`) và sắp xếp theo thứ tự giảm dần của CPU.

Thực hiện như trên nhưng thay tỷ lệ dùng CPU thành tỷ lệ dùng RAM

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
ps aux | sort -k3 -r | head -n 12 | tail -n 11 | awk '{print $2, $3}'
```

<h3>Command 2</h3>

```sh
ps aux | sort -k4 -r | head -n 11 | awk '{print $2, $4}'
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ps aux | sort -k3 -r | head -n 12 | tail -n 11 | awk '{print $2, $3}'
PID %CPU
42657 8.7
94453 6.3
66906 4.7
169 3.5
66920 2.7
258 1.6
177 1.2
32651 1.1
1322 0.7
7344 0.4
```

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ ~ ∫ % ps aux | sort -k4 -r | head -n 11 | awk '{print $2, $4}'     
PID %MEM
32605 2.7
32594 2.7
66906 2.6
32627 2.5
42657 2.5
50521 1.7
50522 1.6
32660 1.4
272 1.3
67329 1.3
```
