#!/bin/bash

# Verwijder alle vorige installaties
deluser --remove-home -q pkuser
rm -rf /etc/project-kastje/

# Maak nieuwe system dirs
useradd -M -N -r -s /bin/false -c "Project Kastje System User" pkuser
mkdir -p /etc/project-kastje/

# Clone alle services
git clone https://github.com/Project-Kastje/backend-service /etc/project-kastje/backend-service/
chmod +x /etc/project-kastje/backend-service/service.py


chmod -R 000 /etc/project-kastje/
