<h1>Requirements</h1>

Biết lệnh `ps` sẽ hiển thị các tiến trình trong bộ nhớ, hãy hiển thị một danh sách 10 tiến trình chiếm nhiều CPU nhất theo dạng 2 cột (`PID`, `%CPU`) và sắp xếp theo thứ tự giảm dần của CPU.

Thực hiện như trên nhưng thay tỷ lệ dùng CPU thành tỷ lệ dùng RAM

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
ps aux | sort -k3 -r | head -n 11 | awk '{print $2, $3}'
```

<h3>Command 2</h3>

```sh
ps aux | sort -k4 -r | head -n 11 | awk '{print $2, $4}'
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
lynn@lynn-server:~$ ps aux | sort -k3 -r | head -n 11 | awk '{print $2, $3}'
PID %CPU
2838 3.9
3387 0.6
3608 0.3
3803 0.2
3173 0.2
859 0.2
843 0.2
1 0.2
3202 0.1
3032 0.1
```

<h3>Command 2</h3>

```sh
lynn@lynn-server:~$ ps aux | sort -k4 -r | head -n 11 | awk '{print $2, $4}'
PID %MEM
2838 2.1
3365 0.5
3242 0.4
3202 0.4
3089 0.3
3608 0.3
3803 0.3
3294 0.2
2918 0.2
2907 0.2
```
