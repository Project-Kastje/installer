#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Run dit script met root (sudo)"
    exit
fi

# Verwijder alle vorige installaties
deluser --remove-home -q pkuser
rm -rf /etc/project-kastje/

# Maak nieuwe system dirs
useradd -M -N -r -s /bin/false -c "Project Kastje System User" pkuser
mkdir -p /etc/project-kastje/

# Installeer dependencies met aptitude
apt-get update && apt-get upgrade
apt-get --assume-yes install screen

# Kill alle vorige screen instances
screen -ls | awk -vFS='\t|[.]' '/backend-service-screen/ {system("screen -S "$2" -X quit")}'


# Clone alle services
git clone https://github.com/Project-Kastje/backend-service /etc/project-kastje/backend-service/
chmod +x /etc/project-kastje/backend-service/service.py
mariadb -u root < /etc/project-kastje/backend-service/delete-database.sql
mariadb -u root < /etc/project-kastje/backend-service/create-database.sql


# Start alle services
screen -d -m -S backend-service-screen bash -c 'python3 /etc/project-kastje/backend-service/service.py'



# Root toegang is nodig om de systeembestanden te zien
chmod -R 000 /etc/project-kastje/

echo ""
echo "Installatie success!!!!"
echo ""
