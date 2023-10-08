<h1>Requirements</h1>

- Sử dụng lệnh `ls` để liệt kê tất cả các file/thư mục trong hệ thống file tính từ thư mục gốc “`/`” sau đó dùng lệnh `grep` để lọc ra tất cả các file có phần đuôi là “`.txt`”

- Cũng yêu cầu trên, làm lại nhưng lọc kết quả là các file có phần đầu là “`dat`”.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
ls -R | grep .txt
```

<h3>Command 2</h3>

```sh
ls -R | grep "^dat"
```

<h2>Results</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ / ∫ % ls -R | grep .txt
LICENSE.txt
LICENSE.txt
...
```

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ / ∫ % ls -R | grep "^dat"
database.svg
database.svg
...
```