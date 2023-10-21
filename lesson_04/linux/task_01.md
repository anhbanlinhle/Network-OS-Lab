<h1>Requirements</h1>

Cấu hình DNS phân giải tên miền “mydomain.com.vn”, có các server  sau:

\-         DNS Server: `mydns.mydomain.com.vn`; IP: `192.168.20.10/24`

\-         Web Server: `myweb.mydomain.com.vn`; IP: `192.168.20.20/24`

\-         Samba Server: `samba.mydomain.com.vn`; IP: `192.168.30.30/24`

<h1>Solution</h1>

<h2>Commands</h2>

<h2>Prerequisites</h2>

Install `BIND`(*Berkeley Internet Name Distributed*)

```sh
sudo apt install bind9 dnsutils
```

<h3>Command 1</h3>

```sh
sudo vi /etc/bind/named.conf.local
```

<h3>File content</h3>

```sh
zone "mydomain.com.vn" {
        type master;
        file "/etc/bind/db.mydomain.com.vn";
};

zone "20.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/db.192";
};
```

<h3>Command 2</h3>

```sh
sudo vi /etc/bind/db.mydomain.com.vn
```

<h3>File content</h3>

```sh
$TTL    604800

@       IN      SOA     mydns.mydomain.com.vn. root.mydomain.com.vn (
                2	 	        ; Serial
                604800 		        ; Refresh
                86400		        ; Retry
                2419200 	        ; Expire
                604800 )	        ; Negative Cache TTL
        IN      A       192.168.20.10
;
@       IN      NS      mydns.mydomain.com.vn.
@       IN      A       192.168.20.10
@       IN      AAAA    ::1
mydns   IN      A       192.168.20.10
myweb	IN 	A 	192.168.20.20
samba	IN 	A 	192.168.20.30
```

<h3>Command 3</h3>

```sh
sudo vi /etc/bind/db.192
```

<h3>File content</h3>

```sh
$TTL    604800

@       IN      SOA     mydns.mydomain.com.vn. root.mydomain.com.vn (
        2	 	; Serial
        604800   	; Refresh
        86400         	; Retry
        2419200         ; Expire
        604800 )       	; Negative Cache TTL
;
@       IN      NS      mydns.
10      IN      PTR     mydns.mydomain.com.vn.
20      IN      PTR     myweb.mydomain.com.vn.
30      IN      PTR     samba.mydomain.com.vn.
```

<h3>Command 4</h3>

```sh
sudo systemctl restart bind9.service
```

<h3>Command 5</h3>

```sh
sudo systemctl status bind9.service
```

<h3>Command 6</h3>

```sh
nslookup 192.168.20.10 127.0.0.1
```

<h3>Command 7</h3>

```sh
nslookup 192.168.20.20 127.0.0.1
```

<h3>Command 8</h3>

```sh
nslookup 192.168.20.30 127.0.0.1
```

<h2>Solution</h2>

<h3>Command 1</h3>

```sh
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "mydomain.com.vn" {
        type master;
        file "/etc/bind/db.mydomain.com.vn";
};

zone "20.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/db.192";
};
~                                                                                                                                      
~                                                                                                                                      
"/etc/bind/named.conf.local" 17L, 350B                                                                               17,2          All
```

<h3>Command 2</h3>

```sh
$TTL    604800

@       IN      SOA     mydns.mydomain.com.vn. root.mydomain.com.vn (
                2                       ; Serial
                604800                  ; Refresh
                86400                   ; Retry
                2419200                 ; Expire
                604800 )                ; Negative Cache TTL
        IN      A       192.168.20.10
;
@       IN      NS      mydns.mydomain.com.vn.
@       IN      A       192.168.20.10
@       IN      AAAA    ::1
mydns   IN      A       192.168.20.10
myweb   IN      A       192.168.20.20
samba   IN      A       192.168.20.30
~                                                                                                                                      
~                                                                                                                                      
"/etc/bind/db.mydomain.com.vn" 16L, 546B                                                                             5,39-46       All
```

<h3>Command 3</h3>

```sh
$TTL    604800

@       IN      SOA     mydns.mydomain.com.vn. root.mydomain.com.vn (
        2               ; Serial
        604800          ; Refresh
        86400           ; Retry
        2419200         ; Expire
        604800 )        ; Negative Cache TTL
;
@       IN      NS      mydns.
10      IN      PTR     mydns.mydomain.com.vn.
20      IN      PTR     myweb.mydomain.com.vn.
30      IN      PTR     samba.mydomain.com.vn.
~                                                                                                                                      
~                                                                                                                                      
"/etc/bind/db.192" 13L, 418B                                                                                         13,46         All
```

<h3>Command 4</h3>

```sh
lynn@lynn-server:~$ sudo systemctl restart bind9.service
lynn@lynn-server:~$ 
```

<h3>Command 5</h3>

```sh
lynn@lynn-server:~$ sudo systemctl status bind9.service
● named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; preset: enabled)
     Active: active (running) since Sat 2023-10-21 12:25:54 +07; 20s ago
       Docs: man:named(8)
   Main PID: 4323 (named)
     Status: "running"
      Tasks: 10 (limit: 19024)
     Memory: 7.2M
        CPU: 163ms
     CGroup: /system.slice/named.service
             └─4323 /usr/sbin/named -f -u bind

Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './DNSKEY/IN': 2001:500:12::d0d#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './NS/IN': 2001:500:12::d0d#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './DNSKEY/IN': 2001:500:200::b#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './NS/IN': 2001:500:200::b#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './DNSKEY/IN': 2001:7fe::53#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './NS/IN': 2001:7fe::53#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './DNSKEY/IN': 2001:500:9f::42#53
Oct 21 12:25:54 lynn-server named[4323]: network unreachable resolving './NS/IN': 2001:500:9f::42#53
Oct 21 12:25:55 lynn-server named[4323]: managed-keys-zone: Key 20326 for zone . is now trusted (acceptance timer complete)
Oct 21 12:25:55 lynn-server named[4323]: resolver priming query complete: success
```

<h3>Command 6</h3>

```sh
lynn@lynn-server:/etc/bind$ nslookup 192.168.20.10 127.0.0.1
10.20.168.192.in-addr.arpa	name = mydns.mydomain.com.vn.
```

<h3>Command 7</h3>

```sh
lynn@lynn-server:/etc/bind$ nslookup 192.168.20.20 127.0.0.1
20.20.168.192.in-addr.arpa	name = myweb.mydomain.com.vn.
```

<h3>Command 8</h3>

```sh
lynn@lynn-server:/etc/bind$ nslookup 192.168.20.30 127.0.0.1
30.20.168.192.in-addr.arpa	name = samba.mydomain.com.vn.
```
