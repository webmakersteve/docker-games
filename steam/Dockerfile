FROM ubuntu:xenial

RUN apt-get update
RUN apt-get upgrade

RUN useradd -m steam

WORKDIR /home/steam

RUN apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    curl
RUN mkdir -p /home/steam/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/steam/steamcmd -zx && \
    chown -R steam:steam /home/steam

USER steam

RUN /home/steam/steamcmd/steamcmd.sh +quit

CMD ["/home/steam/steamcmd/steamcmd.sh"]