<a name="bookmarks"/>

# Bookmarks

- [Requirements](#requirements)

- [Solutions](#solutions)

	- [Commands](#commands)
		- [Command 1](#command-1)
		- [Command 2](#command-2)
		- [Command 3](#command-3)
		- [Command 4](#command-4)

	- [Results](#results)
		- [Result of Command 1](#result-1)
		- [Result of Command 2](#result-2)
		- [Result of Command 3](#result-3)
		- [Result of Command 4](#result-4)

<a name="requirements"/>

# Requirements

Tạo 4 group:

- Group 1 là `g1` gồm các user: `a1`, `a2`, `a3`

- Group 2 là `g2` gồm các user: `b1`, `b2`, `b3`

- Group 3 là `g3` gồm các user: `c1`, `c2`, `c3`

- Group 4 là `g4` gồm các user: `d1`, `d2`, `d3`

Tạo 3 folder: `f1`, `f2`, `f3`

Yêu cầu phân quyền đơn giản như sau:

- Các user thuộc `g1` có quyền write trên folder `f1`, read trên folder `f2`, cấm truy cập `f3`

- Các user thuộc `g2` có quyền write trên folder `f2`, read trên folder `f3`, cấm truy cập `f1`

- Các user thuộc `g3` có quyền read trên cả 3 folder: `f1`, `f2`, `f3`

- Các user thuộc `g4` có quyền write trên cả 3 folder: `f1`, `f2`, `f3`

<a name="solutions"/>

# Solutions 

<a name="commands"/>

## Commands

<a name="command-1"/>

### Command 1 [↑](#bookmarks) [↓](#result-1)

Create groups **g1, g2, g3, g4**

```sh
groups=("g1" "g2" "g3" "g4")

for group in "${groups[@]}"
do
  sudo groupadd "$group"
done
```

Check if created successfully

```sh
grep "g1\|g2\|g3\|g4" /etc/group
```

<a name="command-2"/>

### Command 2 [↑](#bookmarks) [↓](#result-2)

Create users: **a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3** and add them to groups

```sh
g1=("a1" "a2" "a3")
g2=("b1" "b2" "b3")
g3=("c1" "c2" "c3")
g4=("d1" "d2" "d3")

for user in ${g1[@]}
do
  sudo useradd $user && sudo usermod -aG g1 $user
done

for user in ${g2[@]}
do
  sudo useradd $user && sudo usermod -aG g2 $user
done

for user in ${g3[@]}
do
  sudo useradd $user && sudo usermod -aG g3 $user
done

for user in ${g4[@]}
do
  sudo useradd $user && sudo usermod -aG g4 $user
done
```

Check if created successfully

```sh
grep "a1\|a2\|a3\|b1\|b2\|b3\|c1\|c2\|c3\|d1\|d2\|d3" /etc/passwd
```

Check if added successfully

```sh
grep "g1\|g2\|g3\|g4" /etc/group
```

<a name="command-3"/>

### Command 3 [↑](#bookmarks) [↓](#result-3)

Create folders **f1, f2, f3**

```sh
mkdir f1 f2 f3
```

Check default ACL

```sh
getfacl f1 f2 f3
```

<a name="command-4"/>

### Command 4 [↑](#bookmarks) [↓](#result-4)

Set permissions as required

```sh
sudo setfacl -m g:g1:w f1
sudo setfacl -m g:g1:r f2
sudo setfacl -m g:g1:--- f3

sudo setfacl -m g:g2:--- f1
sudo setfacl -m g:g2:w f2
sudo setfacl -m g:g2:r f3

sudo setfacl -m g:g3:r f1
sudo setfacl -m g:g3:r f2
sudo setfacl -m g:g3:r f3

sudo setfacl -m g:g4:w f1
sudo setfacl -m g:g4:w f2
sudo setfacl -m g:g4:w f3
```

Check ACL if correct

```sh
getfacl f1 f2 f3 | grep "f1\|f2\|f3\|g1\|g2\|g3\|g4"
```

<a name="results"/>

## Results
