# mediasrv

1. clone the rep
```
git clone https://github.com/adrian-bulicanu/mediasrv.git
```
2. execute the scripts
```
sh ~/mediasrv/initial-scripts/00_common_infrastructure.sh
sh ~/mediasrv/initial-scripts/01_install_podman.sh
```
3. logoff + logon
4. execute
```
sh ~/mediasrv/initial-scripts/02_create_mediasrv_infrastructure.sh
```
5. edit the ```~/mediasrv/podman-compose/mediasrv-app/.env```
6. execute
```
sh ~/mediasrv/podman-compose/mediasrv-app/update-mediasrv.sh
sh ~/mediasrv/podman-compose/mediasrv-app/register-autostart.sh
```
7. to test, reboot the linux

The following apps/containers should autostart and be available by WebUI. To access a container from another one, use container name as host:

| app/container | port             | comment |
| ----------- | ---------------- | ------- |
| sonarr      | http://ipaddr:8989 |         |
| radarr      | http://ipaddr:7878 |         |
| prowlarr    | http://ipaddr:9696 |         |
| jackett     | http://ipaddr:9117 |         |
| monitorrent | http://ipaddr:6687 |         |
| qbittorrent | http://ipaddr:8080 | after first launch, use temporary admin password and change them. To see the temporary password, see the logs: ```podman logs qbittorrent``` |
| jellyfin    | http://ipaddr:8096 |         |
