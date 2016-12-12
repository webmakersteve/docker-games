#!/bin/bash

# We have the base config.
cp serverconfig.txt.base serverconfig.txt

# Replace parameters with env vars
sed -i "s|{WORLD_NAME}|$WORLD_NAME|g" serverconfig.txt
sed -i "s|{DIFFICULTY}|$DIFFICULTY|g" serverconfig.txt
sed -i "s|{PASSWORD}|$PASSWORD|g" serverconfig.txt

# Run it with that config
mono ./Linux/TerrariaServer.exe -config ./serverconfig.txt -world ./Worlds/world1.wld < /dev/null
