FROM ubuntu:latest

RUN mkdir /home/steam
WORKDIR /home/steam

RUN set -ex && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /apt/cache && \
    mkdir -p /home/steam/steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/steam/steamcmd -zx

RUN set -ex && \
    /home/steam/steamcmd/steamcmd.sh +quit && \
    chmod a+x /home/steam/steamcmd/steamcmd.sh

RUN groupadd -g 999 steam && \
    useradd -r -u 999 -g steam steam && \
    chown -R steam:steam /home/steam

USER steam

CMD ["/home/steam/steamcmd/steamcmd.sh"]
