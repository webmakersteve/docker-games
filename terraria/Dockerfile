FROM ubuntu:14.04 

# Install mono libraries
RUN apt-get update && apt-get -y install mono-complete mono-devel

RUN apt-get -y install curl

# Get most recent version of the server
RUN curl -O https://terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip

# Install zip to unpack this thing
RUN apt-get install -y zip

RUN unzip terraria-server-1432.zip

RUN mv "Dedicated Server" /opt/terraria

RUN rm -rf terraria-server-*

WORKDIR /opt/terraria

COPY run_terraria.sh .
COPY serverconfig.txt serverconfig.txt.base

# Environment variables for base config
ENV WORLD_NAME=docker-terraria
# 0(normal), 1(expert)
ENV DIFFICULTY=1
ENV PASSWORD=password

RUN mkdir Worlds

VOLUME /opt/terraria/Worlds

EXPOSE 7777

CMD ["./run_terraria.sh"]
