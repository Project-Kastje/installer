#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Run dit script met root (sudo)"
    exit
fi

cp ./pkupdate /bin/pkupdate

cd /etc/project-kastje/backend-service/ && git fetch && git merge && git add -A && git commit -am "Auto-commit by pkupdater" && git push
cd /var/www/html/pk/ && git fetch && git merge && git add -A && git commit -am "Auto-commit by pkupdater" && git push
