<h1>Requirements</h1>

- Hiển thị danh sách trong file `/tmp/diem.txt` theo thứ tự tăng dần của Tên

- Hiển thị danh sách trên theo tứ tự tăng dần của Tổng điểm

- Đếm số bạn nam, nữ trong file

- Tạo thêm file `/tmp/ds.txt` có hai trường Tên, Ngày sinh có số dòng và Tên như trong file `/tmp/diem.txt`. Hãy tạo file `/tmp/full.txt` chứa nội dung hai file trước nhưng cột Ngày sinh nằm sau cột Giới tính

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
sort -t' ' -k1,1 diem.txt
```

<h3>Command 2</h3>

```sh
sort -t' ' -k5n diem.txt
```

<h3>Command 3</h3>

```sh
grep -o 'nam' diem.txt | wc -l
```

<h3>Command 4</h3>

```sh
grep -o 'nu' diem.txt | wc -l
```

<h3>Command 5</h3>

```sh
> ds.txt
```

<h3>Command 6</h3>

```sh
paste -d' ' diem.txt ds.txt | awk '{print $1, $2, $7, $3, $4, $5}' > full.txt
```


<h2>Solution</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ sort -t' ' -k1,1 diem.txt
an nu 97 93 190
duc nam 72 84 156
hieu nam 73 86 159
hoang nam 78 86 164
hong nu 80 94 174
khanh nam 86 87 173
lan nu 75 89 164
linh nu 90 92 182
long nam 70 85 155
mai nu 96 85 181
minh nam 89 93 182
nguyen nam 85 90 175
phuong nu 82 88 170
quynh nu 94 91 185
thanh nam 68 91 159
thao nu 95 91 186
thuy nu 81 88 169
tien nam 79 87 166
truong nu 92 88 180
tuan nam 88 87 175
```

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ sort -t' ' -k5n diem.txt
long nam 70 85 155
duc nam 72 84 156
hieu nam 73 86 159
thanh nam 68 91 159
hoang nam 78 86 164
lan nu 75 89 164
tien nam 79 87 166
thuy nu 81 88 169
phuong nu 82 88 170
khanh nam 86 87 173
hong nu 80 94 174
nguyen nam 85 90 175
tuan nam 88 87 175
truong nu 92 88 180
mai nu 96 85 181
linh nu 90 92 182
minh nam 89 93 182
quynh nu 94 91 185
thao nu 95 91 186
an nu 97 93 190
```

<h3>Command 3</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ grep -o 'nam' diem.txt | wc -l
10
```

<h3>Command 4</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ grep -o 'nu' diem.txt | wc -l
10
```

<h3>Command 5</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ > ds.txt
nguyen 05/20/1990
truong 09/12/1995
hoang 01/08/1989
thao 07/27/1998
tuan 03/15/1988
hong 12/02/1993
minh 06/04/1992
lan 02/18/1997
duc 11/09/1986
mai 10/30/1996
thanh 08/25/1991
phuong 04/14/1987
linh 03/03/1993
khanh 07/11/1990
quynh 01/19/1994
long 09/26/1987
an 02/13/1992
hieu 05/08/1991
thuy 12/01/1994
tien 07/22/1988
```

<h3>Command 6</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ paste -d' ' diem.txt ds.txt | awk '{print $1, $2, $7, $3, $4, $5}' > full.txt
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat full.txt
nguyen nam 05/20/1990 85 90 175
truong nu 09/12/1995 92 88 180
hoang nam 01/08/1989 78 86 164
thao nu 07/27/1998 95 91 186
tuan nam 03/15/1988 88 87 175
hong nu 12/02/1993 80 94 174
minh nam 06/04/1992 89 93 182
lan nu 02/18/1997 75 89 164
duc nam 11/09/1986 72 84 156
mai nu 10/30/1996 96 85 181
thanh nam 08/25/1991 68 91 159
phuong nu 04/14/1987 82 88 170
linh nu 03/03/1993 90 92 182
khanh nam 07/11/1990 86 87 173
quynh nu 01/19/1994 94 91 185
long nam 09/26/1987 70 85 155
an nu 02/13/1992 97 93 190
hieu nam 05/08/1991 73 86 159
thuy nu 12/01/1994 81 88 169
tien nam 07/22/1988 79 87 166
```

