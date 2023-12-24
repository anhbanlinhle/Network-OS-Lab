<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

	- [Commands](#commands)
		- [Command 1](#command-1)

	- [Results](#results)
		- [Result of Command 1](#result-1)

<a name="requirements"/>

# Requirements

- Tạo file `lab03.sh` có 2 tham số, tham số đầu là đường dẫn đến 1 file, tham số thứ hai là dòng cần hiển thị trên màn hình. Kiểm tra sự tồn tại của file, số dòng của file có $\ge$ dòng cần hiển thị không? Nếu đúng hiện ra dòng cần hiển thị.

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

```sh
if [ -e $1 ]; then
    total=$(wc -l < $1)
    if [ $2 -le $total ]; then
        res=$(head -n $2 $1 | tail -n 1)
	echo "The line $2 is "
	echo $res
    else
	echo "The file have less than $2 lines"
    fi	
fi
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh

```

