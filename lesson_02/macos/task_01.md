<h1>Requirements</h1>

Tạo file `/tmp/diem.txt` có tối thiểu 20 với các yêu cầu sau

+ Mỗi dòng có 5 trường thể hiện các nội dung về (Tên, Giới tính, Điểm 1, Điểm 2, Điểm Tổng)

+ Tổng = Điểm 1 + Điểm 2 (các giá trị này là nguyên dương)

+ Tên không giống nhau với mỗi dòng và không bao gồm dấu cách. Lưu ý, Tên chứ không phải Họ và Tên

+ Mỗi trường cách nhau bằng đúng một dấu cách, mỗi dòng có đúng 4 dấu cách

+ Giới tính có hai loại là nam và nữ

+ Tất cả các ký tự trong file đều là chữ thường, không có dấu.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
vi /tmp/diem.txt
```


<h3>File content</h3>

```txt
nguyen nam 85 90 175
truong nu 92 88 180
hoang nam 78 86 164
thao nu 95 91 186
tuan nam 88 87 175
hong nu 80 94 174
minh nam 89 93 182
lan nu 75 89 164
duc nam 72 84 156
mai nu 96 85 181
thanh nam 68 91 159
phuong nu 82 88 170
linh nu 90 92 182
khanh nam 86 87 173
quynh nu 94 91 185
long nam 70 85 155
an nu 97 93 190
hieu nam 73 86 159
thuy nu 81 88 169
tien nam 79 87 166
```

<h3>Command 2</h3>

```sh
:w
```

<h3>Command 2</h3>

```sh
:q
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh

~                                                                               
~                                                                               
"diem.txt" [New]
```

<h3>Command 2</h3>

```sh
nguyen nam 85 90 175
truong nu 92 88 180
hoang nam 78 86 164
thao nu 95 91 186
tuan nam 88 87 175
hong nu 80 94 174
minh nam 89 93 182
lan nu 75 89 164
duc nam 72 84 156
mai nu 96 85 181
thanh nam 68 91 159
phuong nu 82 88 170
linh nu 90 92 182
khanh nam 86 87 173
quynh nu 94 91 185
long nam 70 85 155
an nu 97 93 190
hieu nam 73 86 159
thuy nu 81 88 169
tien nam 79 87 166
~                                                                               
~                                                                               
~                                                                               
"diem.txt" [New] 20L, 375B written
```

<h3>Command 3</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % vi diem.txt
(base) admin  Lynn-2 ∫ ~/Desktop ∫ % 
```