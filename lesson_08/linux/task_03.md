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

- In ra 10 tiến trình có độ ưu tiên cao nhất (sắp xếp theo thứ tự từ cao
đến thấp)


<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

```sh
ps axk -pri o pid,comm,pri | head -n 11
```

<a name="results"/>

## Results

<a name="result-1"/>

### Result of Command 1 [↑](#command-1)

```sh
lynn@lynn-server:~$ ps axk -pri o pid,comm,pri | head -n 11
    PID COMMAND         PRI
     48 khugepaged        0
   3695 tracker-miner-f   0
     47 ksmd             14
   2687 rtkit-daemon     18
      1 systemd          19
      2 kthreadd         19
     11 rcu_tasks_kthre  19
     12 rcu_tasks_rude_  19
     13 rcu_tasks_trace  19
     14 ksoftirqd/0      19
```

