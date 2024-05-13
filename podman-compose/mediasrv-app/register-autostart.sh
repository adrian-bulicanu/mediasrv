# execute this script after you started well containers at least once
cd ~/mediasrv/podman-compose/mediasrv-app

podman-compose up -d

mkdir -p ~/.config/systemd/user

podman generate systemd --new sonarr        > ~/.config/systemd/user/sonarr.service
podman generate systemd --new radarr        > ~/.config/systemd/user/radarr.service
podman generate systemd --new prowlarr      > ~/.config/systemd/user/prowlarr.service
podman generate systemd --new qbittorrent   > ~/.config/systemd/user/qbittorrent.service
podman generate systemd --new jackett       > ~/.config/systemd/user/jackett.service
podman generate systemd --new monitorrent   > ~/.config/systemd/user/monitorrent.service
podman generate systemd --new jellyfin      > ~/.config/systemd/user/jellyfin.service

systemctl --user daemon-reload

systemctl --user enable sonarr.service
systemctl --user enable radarr.service
systemctl --user enable prowlarr.service
systemctl --user enable qbittorrent.service
systemctl --user enable jackett.service
systemctl --user enable monitorrent.service
systemctl --user enable jellyfin.service

# enable user services without login
loginctl enable-linger $(id -u)
