#! /bin/bash -e

# Remove the old config if it exists
rm -f ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

# Write specific config crap

cp ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini.template ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

sed -i "s|{SERVER_NAME}|$SERVER_NAME|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
sed -i "s|{SERVER_PASSWORD}|$SERVER_PASSWORD|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini 
sed -i "s|{SERVER_ADMIN_PASSWORD}|$SERVER_ADMIN_PASSWORD|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

cat ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

chmod 0444 ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

exec ./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen -server -log
