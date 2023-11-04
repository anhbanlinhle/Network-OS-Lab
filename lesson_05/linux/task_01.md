<h1>Requirements</h1>

Giả sử, quản trị mạng **A** được giao nhiệm vụ quản trị các máy server **R01**, **R02**. Tuy nhiên, **A** không thể vào phòng server để sử dụng bàn phím/chuột trực tiếp. **A** quyết định sử dụng `SSH` để quản trị các máy tính này từ xa. Để đảm bảo an toàn, tránh các phần mềm KeyLog có thể vô tình bị nhiễm, **A** quyết định sử dụng cơ chế xác thực thông qua bộ khóa công khai của người dùng theo cơ chế `RSA`.

-   Trên server `R01`, tạo tài khoản `user01` và cấu hình server này sao cho từ các máy tính khác có thể đăng nhập từ xa chỉ bằng tài khoản của `user01` thông qua dịch vụ `SSH`.

-   Hãy thiết lập server `R02` sao cho máy tính PC có khả năng đăng nhập từ xa như `root` thông qua `SSH` vào server trên mà không cần mật khẩu.

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