FROM steam

# Change max files open
RUN echo 'fs.file-max=100000' >> /etc/sysctl.conf

RUN sysctl -p /etc/sysctl.conf

RUN echo '*               soft    nofile          1000000' >> /etc/security/limits.conf
RUN echo '*               hard    nofile          1000000' >> /etc/security/limits.conf

RUN echo 'session required pam_limits.so' >> /etc/pam.d/common-session

# Install the ark server
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/ark +app_update 376030 +quit

# Query port for Steam's server browser
EXPOSE 27015

# Game client port
EXPOSE 7777

# Raw UDP socket port (always Game client port +1)
EXPOSE 7778

# RCON for remote console server access (optional)
EXPOSE 27020

# Environment variables for base config
ENV SERVER_PASSWORD=password
ENV SERVER_NAME=docker-ark
ENV SERVER_ADMIN_PASSWORD=admin

# Set workdir to ark install directory
WORKDIR /home/steam/ark

# Mount save directory as a volume for persistence
VOLUME /home/steam/ark/ShooterGame/Saved

# Copy config files

COPY Config /home/steam/ark/ShooterGame/Saved/Config/LinuxServer/

COPY run_ark.sh .

CMD ["./run_ark.sh"]
