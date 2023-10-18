<h1>Requirements</h1>

Thiết lập DHCP server trên các máy tính (`172.16.2.1`, `172.16.3.1`, `172.16.4.1`, `172.16.5.1`) sao cho:

\-          Chỉ lắng nghe yêu cầu trên mạng con (`192.168....`)

\-          Ngoài `IP/Subnetmask` còn cung cấp các thông số về `gateway`, `dns`, `dns postfix`.

<h1>Solution</h1>

<h2>Commands</h2>

<h3>Command 1</h3>

```sh
ifconfig -a
```

<h3>Command 2</h3>

```sh
sudo vi /etc/dhcp/dhcpd.conf
```

<h3>File content</h3>

```sh
default-lease-time 86400;
max-lease-time 86400;

subnet 10.0.2.0 netmask 255.255.255.0 {
 option routers 10.0.2.1;
 option domain-name-servers 10.0.2.2;
 option domain-name "lynxerver.com";
 range 10.0.2.100 10.0.2.200; 
}
```

<h3>Command 3</h3>

```sh
sudo systemctl restart isc-dhcp-server.service
```

<h3>Command 4</h3>

```sh
sudo systemctl status isc-dhcp-server.service
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
lynn@lynn-server:~$ ifconfig -a
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::a00:27ff:fe13:f19  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:13:0f:19  txqueuelen 1000  (Ethernet)
        RX packets 46  bytes 13502 (13.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 91  bytes 11321 (11.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 114  bytes 9644 (9.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 114  bytes 9644 (9.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

<h3>Command 2</h3>

```sh
default-lease-time 86400;
max-lease-time 86400;

subnet 10.0.2.0 netmask 255.255.255.0 {
 option routers 10.0.2.1;
 option domain-name-servers 10.0.2.2;
 option domain-name "lynxerver.com";
 range 10.0.2.100 10.0.2.200;
}
~                                                                                                                    
~                                                                                                                    
"/etc/dhcp/dhcpd.conf" 9L, 223B                                                                    8,18          All
```

<h3>Command 3</h3>

```sh
lynn@lynn-server:~$ sudo systemctl restart isc-dhcp-server.service
lynn@lynn-server:~$
```

<h3>Command 4</h3>

```sh
lynn@lynn-server:~$ sudo systemctl status isc-dhcp-server.service
● isc-dhcp-server.service - ISC DHCP IPv4 server
     Loaded: loaded (/lib/systemd/system/isc-dhcp-server.service; enabled; preset: enabled)
     Active: active (running) since Wed 2023-10-18 22:51:43 +07; 1s ago
       Docs: man:dhcpd(8)
   Main PID: 3577 (dhcpd)
      Tasks: 1 (limit: 19024)
     Memory: 3.7M
        CPU: 20ms
     CGroup: /system.slice/isc-dhcp-server.service
             └─3577 dhcpd -user dhcpd -group dhcpd -f -4 -pf /run/dhcp-server/dhcpd.pid -cf /etc/dhcp/dhcpd.conf

Oct 18 22:51:43 lynn-server sh[3577]: Wrote 0 leases to leases file.
Oct 18 22:51:43 lynn-server dhcpd[3577]: PID file: /run/dhcp-server/dhcpd.pid
Oct 18 22:51:43 lynn-server dhcpd[3577]: Wrote 0 leases to leases file.
Oct 18 22:51:43 lynn-server dhcpd[3577]: Listening on LPF/enp0s3/08:00:27:13:0f:19/10.0.2.0/24
Oct 18 22:51:43 lynn-server sh[3577]: Listening on LPF/enp0s3/08:00:27:13:0f:19/10.0.2.0/24
Oct 18 22:51:43 lynn-server sh[3577]: Sending on   LPF/enp0s3/08:00:27:13:0f:19/10.0.2.0/24
Oct 18 22:51:43 lynn-server sh[3577]: Sending on   Socket/fallback/fallback-net
Oct 18 22:51:43 lynn-server dhcpd[3577]: Sending on   LPF/enp0s3/08:00:27:13:0f:19/10.0.2.0/24
Oct 18 22:51:43 lynn-server dhcpd[3577]: Sending on   Socket/fallback/fallback-net
Oct 18 22:51:43 lynn-server dhcpd[3577]: Server starting service.
```