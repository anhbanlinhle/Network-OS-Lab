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

- Dùng lệnh `ps` xem giá trị `NICE` của các tiến trình.
- Sau đó dùng lệnh `top` hoặc `renice` để thay đổi giá trị `NICE` của các tiến trình trong hệ thống

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Show top 10 process and their **NICE** value

```sh
ps axk -ni o pid,comm,ni | head -n 11
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Check process **top**'s **PID** and current **NICE** value

```sh
ps -C top o pid,comm,ni
```

Change process **top**'s **NICE** value

```sh
renice +1 4358
```

Check process **top**'s new **NICE** value

```sh
ps -C top o pid,comm,ni
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

