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

- Tạo file lab05.sh có chức năng sau: Nhập một số nguyên dương trong khoảng `1000` đến `5000`. Kiểm tra tính đúng dắn của dữ liệu nhập, nếu đúng in ra số Fibonacci lớn nhất nhưng nhỏ hơn số mới nhập.


<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

```sh
echo "Enter a number from 1000 to 5000: "; read A

if [ $A -lt 1000 ] || [ $A -gt 5000 ]; then
	echo "The number entered is invalid"
	exit
fi

num=0
num1=0
num2=1

while [ $num -lt $A ]; do
    if [ $((num1 + num2)) -lt $A ]; then
        num=$((num1 + num2))
        num1=$num2
        num2=$num
    else
        break
    fi
done

echo "Largest fibbonacci smaller than input $num"
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ ./lab05.sh
Enter a number from 1000 to 5000: 
5001
The number entered is invalid
lynn@lynn-server:~$ ./lab05.sh
Enter a number from 1000 to 5000: 
1000
Largest fibbonacci smaller than input 987
lynn@lynn-server:~$ ./lab05.sh
Enter a number from 1000 to 5000: 
1600
Largest fibbonacci smaller than input 1597
lynn@lynn-server:~$ 
```

