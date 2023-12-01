<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

	- [Commands](#commands)
		- [Command 1](#command-1)
		- [Command 2](#command-2)

	- [Results](#results)
		- [Result of Command 1](#result-1)
		- [Result of Command 2](#result-2)

<a name="requirements"/>

# Requirements

- Viết `loop{1,2,3}.sh` với nội dung tương ứng như sau:

```sh
while true; do
	echo “loop {1,2,3} ...”
	sleep 1
done
```

- Chạy 3 file này sao cho các tiến trình tương ứng hoạt động ở trạng
thái nền. Tắt từng tiến trình này

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

`loop1.sh`'s content

```sh
while true; do
	echo “loop 1 ...”
	sleep 1
done
```

`loop2.sh`'s content

```sh
while true; do
	echo “loop 2 ...”
	sleep 1
done
```

`loop3.sh`'s content

```sh
while true; do
	echo “loop 3 ...”
	sleep 1
done
```

Running 3 scripts in the background

```sh
sh loop1.sh &\
sh loop2.sh &\
sh loop3.sh &
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Kill 3 scripts's background processes

```sh
kill pid_1
kill pid_2
kill pid_3
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh

```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh

```

