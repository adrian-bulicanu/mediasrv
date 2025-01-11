# mediasrv

1. clone the rep
```
git clone https://github.com/adrian-bulicanu/mediasrv.git
```
2. execute the scripts
```
sh ~/mediasrv/initial-scripts/00_common_infrastructure.sh
sh ~/mediasrv/initial-scripts/01_install_podman.sh
sh ~/mediasrv/initial-scripts/02_create_mediasrv_infrastructure.sh
```
3. edit the ```vars.env``` file
```
nano ~/mediasrv/mediasrv-app/vars.env
```
4. execute
```
sh ~/mediasrv/initial-scripts/03_configure_podman.sh
```
5. to test, reboot the linux

After the first reboot, containers will be downloaded, please be patient. The following apps/containers should autostart and be available by WebUI.

To manage services containers, use systemctl with user and machine paramateres, example:
```sudo systemctl --user --machine=mediasrv@ status sonarr```

To access a container from another one, use ```host.containers.internal``` as host:

|app/container| port               | comment |
| ----------- | ------------------ | ------- |
| sonarr      | http://ipaddr:8989 |         |
| radarr      | http://ipaddr:7878 |         |
| prowlarr    | http://ipaddr:9696 |         |
| jackett     | http://ipaddr:9117 |         |
| monitorrent | http://ipaddr:6687 |         |
| qbittorrent | http://ipaddr:8080 | after first launch, use temporary admin password and change them. To see the temporary password, see the logs: ```journalctl -t systemd-qbittorrent --no-pager``` |
| jellyfin    | http://ipaddr:8096 | look at https://hub.docker.com/r/linuxserver/jellyfin for enabling hardware acceleration |
|homeassistant| http://ipaddr:8123 | additional ports should be exposed, if required by integration |

Important pathes:
* /data/media : media files as follows:
  * /data/media/downloads : torrents
  * /data/media/shows : TV shows
  * /data/media/movies : Movies
* /apps : configuration and databases for each service. This folder should be backed up.
  * /apps/radarr
  * /apps/sonarr
  * /apps/qbittorrent
  * /apps/jackett
  * /apps/monitorrent
  * /apps/jellyfin
  * /apps/homeassistant
