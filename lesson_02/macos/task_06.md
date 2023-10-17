<h1>Requirements</h1>

- Sử dụng lệnh `sed` để thay đổi các từ `nam` trong file `/tmp/full.txt` thành `nu`

- Tạo file `/tmp/backup` là nội dung file `/etc/passwd` nhưng tất cả các chữ thường đã được chuyển thành chữ hoa.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
sed 's/nam/nu/g' /tmp/full.txt
```

<h3>Command 2</h3>

```sh
cat /etc/passwd | tr '[:lower:]' '[:upper:]' > backup
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ sed 's/nam/nu/g' full.txt
nguyen nu 05/20/1990 85 90 175
truong nu 09/12/1995 92 88 180
hoang nu 01/08/1989 78 86 164
thao nu 07/27/1998 95 91 186
tuan nu 03/15/1988 88 87 175
hong nu 12/02/1993 80 94 174
minh nu 06/04/1992 89 93 182
lan nu 02/18/1997 75 89 164
duc nu 11/09/1986 72 84 156
mai nu 10/30/1996 96 85 181
thanh nu 08/25/1991 68 91 159
phuong nu 04/14/1987 82 88 170
linh nu 03/03/1993 90 92 182
khanh nu 07/11/1990 86 87 173
quynh nu 01/19/1994 94 91 185
long nu 09/26/1987 70 85 155
an nu 02/13/1992 97 93 190
hieu nu 05/08/1991 73 86 159
thuy nu 12/01/1994 81 88 169
tien nu 07/22/1988 79 87 166
```

<h3>Command 2</h3>

```sh
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat /etc/passwd | tr '[:lower:]' '[:upper:]' > backup
(base) admin  Lynn-2 ∫ ~/Desktop ∫ cat backup
##
# USER DATABASE
# 
# NOTE THAT THIS FILE IS CONSULTED DIRECTLY ONLY WHEN THE SYSTEM IS RUNNING
# IN SINGLE-USER MODE.  AT OTHER TIMES THIS INFORMATION IS PROVIDED BY
# OPEN DIRECTORY.
#
# SEE THE OPENDIRECTORYD(8) MAN PAGE FOR ADDITIONAL INFORMATION ABOUT
# OPEN DIRECTORY.
##
NOBODY:*:-2:-2:UNPRIVILEGED USER:/VAR/EMPTY:/USR/BIN/FALSE
ROOT:*:0:0:SYSTEM ADMINISTRATOR:/VAR/ROOT:/BIN/SH
DAEMON:*:1:1:SYSTEM SERVICES:/VAR/ROOT:/USR/BIN/FALSE
...
```