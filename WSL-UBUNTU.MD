# Differences in Ubuntu-Wsl

update shell scripts with `which bash` path
Only need to source envs in setup.sh **Check on Mac version?

sudo service docker start (systemctl not on wsl)

WSL runs via Docker like technology and has the same restrictions.
You have to point your web app inside the WSL to use the IP ‘0.0.0.0’ and then you can see the app in a browser at 127.0.0.1

Grab the "localhost" ip by running 

```sh
ip addr | grep eth0
```

This should output the following with <YOUR_IP_ADDRESS>

```sh
 eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    inet <YOUR_IP_ADDRESS>/20 brd 172.28.79.255 scope global eth0
```

When connecting to mysql you may also have to set `allowPublicKeyRetrieval=TRUE`

## Postgres

wsl hostname -I

 C:\Windows\System32\drivers\etc\hosts

 Create .wslconfig file at 
C:\Users\username>

set localhostForwarding=true


https://github.com/microsoft/WSL/discussions/2471
https://dev.to/grawl/working-with-docker-and-other-unix-things-on-windows-like-on-macos-or-linux-4o6p
https://docs.microsoft.com/en-us/windows/wsl/wsl-config


TODO!!! When running with docker-desktop -- did I miss something
MySQL8      | 2021-02-05T03:06:23.962125Z 1 [ERROR] [MY-012574] [InnoDB] Unable to lock ./ibdata1 error: 11
MySQL57     | 2021-02-05T03:06:24.120434Z 0 [ERROR] InnoDB: Unable to lock ./ibdata1 error: 11
MySQL57     | 2021-02-05T03:06:24.120524Z 0 [Note] InnoDB: Check that you do not already have another mysqld process using the same InnoDB data or log files.

ERROR: for MySQL8  Cannot start service mysql8: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/bb235ffc989f1414f39f56a2cafb8f03b4f802ffa3c7e1d08e7dcefc49c81444" to rootfs at "/var/lib/docker/overlay2/e63eea969ddaf3319e9615c44a0474834f36b57443693b65e4a34108cc191d69/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for MySQL57  Cannot start service mysql57: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/5802adc058127c203541b5b42959671230357deae5cdc5817de7bba218eb9d83" to rootfsStarting MySQL56  ... error

Starting postgres ... errorsed: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/dde7e4e0f6daa962bb41db8bb0505e4424e7d9e0968ffd840be79b901941fa05" to rootfs at "/var/lib/docker/overlay2/02f955fdbac0817ff650ef58d865756d4c43eeaf3fee4bf0d576dfc0d317223d/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for postgres  Cannot start service postgres: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/107a132861e08ae56577f73c659ea49aa4483342471809440729f4f4d103d4c3" to rootfs at "/var/lib/docker/overlay2/f02437999304c598adccd94d8da174c9a36a1c5b3063deede590a297ba930743/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for mysql8  Cannot start service mysql8: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/bb235ffc989f1414f39f56a2cafb8f03b4f802ffa3c7e1d08e7dcefc49c81444" to rootfs at "/var/lib/docker/overlay2/e63eea969ddaf3319e9615c44a0474834f36b57443693b65e4a34108cc191d69/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for mysql57  Cannot start service mysql57: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/5802adc058127c203541b5b42959671230357deae5cdc5817de7bba218eb9d83" to rootfs at "/var/lib/docker/overlay2/3b7b54d82c0f4a0e334a241105772f0100a0563435fcc76ab99b80840bcc1964/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for mysql56  Cannot start service mysql56: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/dde7e4e0f6daa962bb41db8bb0505e4424e7d9e0968ffd840be79b901941fa05" to rootfs at "/var/lib/docker/overlay2/02f955fdbac0817ff650ef58d865756d4c43eeaf3fee4bf0d576dfc0d317223d/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown

ERROR: for postgres  Cannot start service postgres: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/107a132861e08ae56577f73c659ea49aa4483342471809440729f4f4d103d4c3" to rootfs at "/var/lib/docker/overlay2/f02437999304c598adccd94d8da174c9a36a1c5b3063deede590a297ba930743/merged/docker-entrypoint-initdb.d" caused: no such file or directory: unknown