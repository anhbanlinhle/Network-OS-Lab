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