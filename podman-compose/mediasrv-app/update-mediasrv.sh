cd ~/mediasrv/podman-compose/mediasrv-app

podman-compose pull
podman-compose down
podman-compose up -d
podman network prune --force
podman image prune --all --force
