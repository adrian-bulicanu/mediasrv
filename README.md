# mediasrv

1. clone the rep.
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
| sonarr      | http://<ip>:8989 | |
| radarr      | http://<ip>:7878 | |
| prowlarr    | http://<ip>:9696 | |
| jackett     | http://<ip>:9117 | |
| monitorrent | http://<ip>:6687 | |
| qbittorrent | http://<ip>:8080 | after first launch, use temporary admin password and change them. To see the temporary password, see the logs: ```podman logs qbittorrent``` |
| jellyfin    | http://<ip>:8096 | |
