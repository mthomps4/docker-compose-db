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
