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

Or use **top** its self

```sh
top
```

Then press <kbd>r</kbd> to type **PID** and new **NICE** value

Check process **top**'s new **NICE** value

```sh
ps -C top o pid,comm,ni
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ ps axk -ni o pid,comm,ni | head -n 11
    PID COMMAND          NI
     48 khugepaged       19
   3695 tracker-miner-f   -
     47 ksmd              5
   2687 rtkit-daemon      1
      1 systemd           0
      2 kthreadd          0
      9 kworker/u8:0-fl   0
     11 rcu_tasks_kthre   0
     12 rcu_tasks_rude_   0
     13 rcu_tasks_trace   0
```

<a name="result-2"/>

### Result of Command 2 [↑](#command-2)

```sh
lynn@lynn-server:~$ ps -C top o pid,comm,ni
    PID COMMAND          NI
   3958 top               0
```

```sh
top - 23:20:42 up 2 min,  2 users,  load average: 1.10, 0.44, 0.16
Tasks: 242 total,   1 running, 241 sleeping,   0 stopped,   0 zombie
%Cpu(s): 16.7 us, 16.7 sy,  0.0 ni, 66.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  10373.9 total,   8366.8 free,   1164.1 used,   1139.0 buff/cache     
MiB Swap:   4096.0 total,   4096.0 free,      0.0 used.   9209.8 avail Mem 
PID to renice [default pid = 3178] 
    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND  
   3178 lynn      20   0 4568344 330816 131540 S  11.1   3.1   0:06.94 gnome-s+ 
   3313 lynn      20   0 2584852  26136  21376 S   5.6   0.2   0:00.09 gjs      
      1 root      20   0  168656  13012   8916 S   0.0   0.1   0:03.57 systemd  
    ...
```

```sh
top - 23:21:55 up 3 min,  2 users,  load average: 0.41, 0.36, 0.16
Tasks: 229 total,   2 running, 227 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.3 sy,  0.0 ni, 99.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  10373.9 total,   8419.3 free,   1057.8 used,   1191.4 buff/cache     
MiB Swap:   4096.0 total,   4096.0 free,      0.0 used.   9316.0 avail Mem 
Renice PID 3958 to value 
    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND  
   3178 lynn      20   0 4565940 331380 132308 S   1.3   3.1   0:10.25 gnome-s+ 
   3706 lynn      20   0  216088   3100   2816 S   1.0   0.0   0:00.90 VBoxCli+ 
     36 root      20   0       0      0      0 I   0.3   0.0   0:00.20 kworker+
    ...
```

```sh
lynn@lynn-server:~$ ps -C top o pid,comm,ni
    PID COMMAND          NI
   3958 top               1
```
