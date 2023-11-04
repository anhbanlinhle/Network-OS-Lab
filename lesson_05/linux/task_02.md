# Requirements

Giả sử, quản trị mạng **A** được giao nhiệm vụ quản trị các máy server **R01**, **R02**. Tuy nhiên, **A** không thể vào phòng server để sử dụng bàn phím/chuột trực tiếp. **A** quyết định sử dụng `SSH` để quản trị các máy tính này từ xa. Để đảm bảo an toàn, tránh các phần mềm KeyLog có thể vô tình bị nhiễm, **A** quyết định sử dụng cơ chế xác thực thông qua bộ khóa công khai của người dùng theo cơ chế `RSA`.

- Hãy thiết lập server `R02` sao cho máy tính PC có khả năng đăng nhập từ xa như `root` thông qua `SSH` vào server trên mà **không cần mật khẩu**.

# Prerequisites

Install OpenSSH on both `client` and `server`

## Server - Linux

```sh
sudo apt install openssh-server
```

## Client - MacOS

```sh
brew install openssh
```

# Solution

## Commands

### Command 1

```sh
command
```

### Command 2

```sh
command
```

## Solution

### Command 1

```sh
executed command results
```

### Command 2

```sh
executed command results
```
