<h1>Requirements</h1>

Hãy đọc tài liệu man của các lệnh sau và **“chỉ nêu chức năng chính”** của các lệnh đó:

\- `cd`, `pwd`, `ls`, `mkdir`, `rmdir`, `cat`, `touch`, `rm`, `cp`, `mv`

\- `grep`, `cut`, `join`, `head`, `tail`, `wc`, `sed`, `tr`, `tee`

\- `tar`, `gzip`, `bzip2`

\- `which`, `whatis`, `apropos`

<h1>Solution</h1>

|Lệnh|Chức năng chính
|-|-
|`cd`| thay đổi directory hiện tại tới directory theo đường dẫn đi sau câu lệnh
|`pwd`| in ra standard output đường dẫn tuyệt đối của directory hiện tại
|`ls`| liệt kê các thư mục và tệp con nằm trong directory hiện tại
|`mkdir`| tạo một directory con trong directory hiện tại
|`rmdir`| xóa directory được chỉ định
|`cat`| đọc file và print ra standard output, nếu không chỉ file sẽ đọc từ standard input
|`touch`| ghi đè thời gian truy cập và thời gian điều chỉnh của file được chỉ định
|`rm`| xóa file hoặc directory được chỉ định
|`cp`| sao chép file hoặc directory được chỉ định
|`grep`| tìm các dòng trong file được chỉ định khớp với pattern yêu cầu
|`cut`| in những phần được chọn của file ra màn hình
|`join`| gộp 2 file dựa trên các trường chung
|`head`| in ra 10 dòng đầu của các file được chọn
|`tail`| in ra 10 dòng cuối của các file được chọn
|`wc`| in ra số lần xuống dòng, số từ, số byte của các file được chọn
|`sed`| sửa và thay thế văn bản theo biểu thức chính quy
|`tr`| dịch, xóa và ép các ký tự từ input và in ra output
|`tee`| đọc từ input, viết vào file được chọn. Nếu không có file, in ra output.
|`tar`| nén các file nhận vào thành một file duy nhất
|`gzip`| nhận vào một file nén thành một file
|`bzip2`| nén các file nhận vào thành một file duy nhất
|`which`| print ra thư mục trên thiết bị chứa file thực thi của command được chỉ định
|`whatis`| tìm manual page của command
|`apropos`| tìm manual page của command