# create user and group, without home
sudo useradd -M mediasrv
sudo groupadd mediasrv
sudo usermod -a -G mediasrv mediasrv

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

sudo chown -R $(id -u -n):$(id -g -n) /data
sudo chown -R $(id -u -n):$(id -g -n) /apps

cp -r ~/mediasrv/default-configs/* /apps/

# podman things
MEDIA_UID=$(id -u mediasrv)
MEDIA_GID=$(id -g mediasrv)
# change ownership in podman namespace
podman unshare chown -R $MEDIA_UID:$MEDIA_GID /data/media
podman unshare chown -R $MEDIA_UID:$MEDIA_GID /apps
