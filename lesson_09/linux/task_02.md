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

- Tạo file `lab02.sh` có ba tham số dạng `A` `B` `o` trong đó hai tham số đầu tiên, `A` và `B` là các toán hạng, tham số thứ ba, `o`, là toán tử hai ngôi (`+` `-` `*` `/` `%` `**`). In ra màn hình khi chạy file này sẽ có dạng `A o B = S` với `S` là kết quả của phép toán `o` đối với hai toán hạng `A` và `B`. Lưu ý có kiểm tra phép toán chia và số chia = 0.

Ví dụ chạy

```
sh lab02.sh 20 30 +
```

Kết quả ra màn hình sẽ là

```
20 + 30  = 50
```

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

```sh
a=$1
b=$2
o=$3
if ( [ "$o" = "/" ] || [ "$o" = "%" ] ) && [ $b -eq 0 ]; then
	echo "invalid"
else
	echo -n "$a $o $b = "

	if [ "$o" = "+" ]; then 
		echo $(($a + $b))
	elif [ "$o" = "-" ]; then
		echo $(($a - $b))
	elif [ "$o" = "x" ]; then
		echo $(($a * $b))
	elif [ "$o" = "/" ]; then
		echo $(($a / $b))
	elif [ "$o" = "%" ]; then    
		echo $(($a % $b))
	elif [ "$o" = "^" ]; then
		echo $(($a ** $b))
	else
		echo "invalid"
	fi
fi
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh

```

