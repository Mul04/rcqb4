FROM developeranaz/qbittorrent2rclone:beta1
RUN apt update; apt upgrade -y
RUN apt install curl wget golang zip unzip nginx -y
COPY scriptplusconf /scriptplusconf
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
CMD mkdir --parents /qBittorrent/downloads/
CMD curl -L "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/about.html" > /var/www/html/about.html
CMD curl -L "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/index.html" >/var/www/html/index.html
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
CMD curl -L "https://gist.githubusercontent.com/developeranaz/0094631c02f04b32dadf5cf0dd508112/raw/qb-go-entry-heroku.go" >qb-go-entry-heroku.go; go run qb-go-entry-heroku.go
