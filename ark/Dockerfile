FROM steam

# Switch to the root user
USER root

# Change max files open
RUN echo 'fs.file-max=100000' >> /etc/sysctl.conf

RUN sysctl -p /etc/sysctl.conf

RUN echo '*               soft    nofile          1000000' >> /etc/security/limits.conf
RUN echo '*               hard    nofile          1000000' >> /etc/security/limits.conf

RUN echo 'session required pam_limits.so' >> /etc/pam.d/common-session

USER steam

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/ark +app_update 376030 +quit

# Query port for Steam's server browser
EXPOSE 27015

# Game client port
EXPOSE 7777

# Raw UDP socket port (always Game client port +1)
EXPOSE 7778

# RCON for remote console server access (optional)
EXPOSE 27020

ENV SERVER_PASSWORD=password
ENV SERVER_NAME=docker-ark
ENV SERVER_ADMIN_PASSWORD=admin

WORKDIR /home/steam/ark

VOLUME /home/steam/ark/Saved

COPY run_ark.sh .

CMD ["./run_ark.sh"]
