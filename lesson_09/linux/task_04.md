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

- Tạo file `lab04.sh` có chức năng sau: Nhập một số nguyên trong khoảng `1000` đến `50000`. Kiểm tra tính đúng đắn của dữ liệu nhập, nếu đúng in ra kết quả số nhập vào là số nguyên tố hay hợp số.

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

```sh
echo "Enter a number from 1000 to 50000: "; read A

if [ $A -gt 1000  -a  $A -lt  50000 ]; then
	isPrime=true
	threshold=$(echo "sqrt($A)" | bc)
	
	for (( i = 2; $i <= $threshold + 1; i++)) 
	do
	    if [ $((A % i)) -eq 0 ]; then
		isPrime=false
		break
	    fi	
	done

	if [ $isPrime == true ]; then
	    echo "$A is a prime number"
    	else
	    echo "$A is a composite number"
	fi
else
	echo "invalid number"
fi
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh

```

