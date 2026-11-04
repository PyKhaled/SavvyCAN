#!/bin/sh

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$PROJECT_ROOT"
CURDIR=$PROJECT_ROOT

# Set absolute path
sed -e "s,<DIR>,$CURDIR,g" packaging/SavvyCAN.desktop > SavvyCAN.desktop.temp

cp SavvyCAN.desktop.temp ~/.local/share/applications/SavvyCAN.desktop
cp SavvyCAN.desktop.temp ~/Desktop/SavvyCAN.desktop
rm SavvyCAN.desktop.temp

echo "Installed SavvyCAN icons on menu and desktop !"
