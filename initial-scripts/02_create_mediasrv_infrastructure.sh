# create user and group
sudo useradd mediasrv
sudo groupadd mediasrv
sudo usermod -a -G mediasrv mediasrv
sudo mkdir -p /home/mediasrv
sudo chown mediasrv:mediasrv /home/mediasrv

sudo mkdir /data/media
sudo mkdir /data/media/downloads
sudo mkdir /data/media/shows
sudo mkdir /data/media/movies

sudo mkdir /apps/prowlarr
sudo mkdir /apps/radarr
sudo mkdir /apps/sonarr
sudo mkdir /apps/qbittorrent
sudo mkdir /apps/jackett
sudo mkdir /apps/monitorrent
sudo touch /apps/monitorrent/monitorrent.db
sudo mkdir /apps/jellyfin
sudo mkdir /apps/homeassistant

# sudo chown -R $(id -u -n):$(id -g -n) /data
# sudo chown -R $(id -u -n):$(id -g -n) /apps

cp -r ~/mediasrv/default-configs/* /apps/

sudo chown -R mediasrv:mediasrv /data
sudo chown -R mediasrv:mediasrv /apps

# change ownership in podman namespace
# podman unshare chown -R mediasrv:mediasrv /data/media
# podman unshare chown -R mediasrv:mediasrv /apps

sudo loginctl enable-linger mediasrv
