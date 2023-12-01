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

- Viết script `findps.sh` với đầu vào là 1 số. Script sẽ tìm trong hệ thống tiến trình có `PID` là tham số đã nhập, đồng thời in ra `PID` và Tên của tiến trình cha của nó

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Create file **findps.sh**

```sh
vi findps.sh
```

File content

```sh
read PID
PID_NAME=$(ps o comm= -p $PID)
P_PID=$(ps o ppid= -p $PID)
PPID_NAME=$(ps o comm= -p $P_PID)

printf "%-10s %-10s %-10s\n" "ROLE" "PID" "COMMAND"
printf "%-10s %-10s %-10s\n" "Child" "$PID" "$PID_NAME"
printf "%-10s %-10s %-10s\n" "Parent" "$(echo $P_PID | tr -s ' ')" "$PPID_NAME"
```

Make file executable

```sh
chmod a+x findps.sh
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Find process **top**'s **PID**

```sh
ps o pid= -C top
```

Run script with found **PID**

```sh
ps o pid= -C top | sh findps.sh 
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ ps o pid= -C top 
   3958
```

Script can be adjust to receive **PID** directly from command

```sh
PID=$1
PID_NAME=$(ps o comm= -p $PID)
P_PID=$(ps o ppid= -p $PID)
PPID_NAME=$(ps o comm= -p $P_PID)

printf "%-10s %-10s %-10s\n" "ROLE" "PID" "COMMAND"
printf "%-10s %-10s %-10s\n" "Child" "$PID" "$PID_NAME"
printf "%-10s %-10s %-10s\n" "Parent" "$(echo $P_PID | tr -s ' ')" "$PPID_NAME"
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

First way

```sh
lynn@lynn-server:~$ ps o pid= -C top | sh findps.sh 
ROLE       PID        COMMAND   
Child      3958       top       
Parent     3951       bash   
```

Second way

```sh
lynn@lynn-server:~$ sh findps.sh 3958
ROLE       PID        COMMAND   
Child      3958       top       
Parent     3951       bash   
```