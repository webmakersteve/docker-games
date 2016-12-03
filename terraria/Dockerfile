FROM steam

# Switch to the root user
USER root

# Install mono libraries
RUN apt-get -y install mono-complete

# Get most recent version of the server
RUN curl -O http://terraria.org/system/dedicated_servers/archives/000/000/025/original/terraria-server-1343.zip

# Install zip to unpack this thing
RUN apt-get install -y zip

RUN unzip terraria-server-1343.zip

RUN mv "Dedicated Server" terraria

RUN rm -rf terraria-server-*

WORKDIR /home/steam/terraria

COPY run_terraria.sh .
COPY serverconfig.txt serverconfig.txt.base

# Environment variables for base config
ENV WORLD_NAME=docker-terraria
# 0(normal), 1(expert)
ENV DIFFICULTY=1
ENV PASSWORD=password

VOLUME /home/steam/terraria/Worlds

EXPOSE 7777

CMD ["./run_terraria.sh"]
