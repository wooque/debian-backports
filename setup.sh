#!/usr/bin/bash
set -e

echo "deb-src http://deb.debian.org/debian/ testing main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ unstable main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ experimental main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bookworm-backports main" >> /etc/apt/sources.list
apt update
apt full-upgrade -y
apt install --no-install-recommends -y packaging-dev debian-keyring devscripts equivs libdistro-info-perl wget nano ranger
