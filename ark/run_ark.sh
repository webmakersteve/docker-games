#! /bin/bash

# Remove the old config if it exists
rm ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini


# Write specific config crap

cp ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini.template ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

sed -i "s|{SERVER_NAME}|$SERVER_NAME|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
sed -i "s|{SERVER_PASSWORD}|$SERVER_PASSWORD|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini 
sed -i "s|{SERVER_ADMIN_PASSWORD}|$SERVER_ADMIN_PASSWORD|g" ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

cat ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

echo "Removing write privileges"

chmod 0444 ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
chattr +i ./ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen -server -log
