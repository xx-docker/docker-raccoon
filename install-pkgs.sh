#!/bin/bash

apt-get update

{ cat <<EOF
alien
bison
build-essential
ca-certificates
cmake
curl
doxygen
flex
gcc
gcc-mingw-w64
geoip-database
git
graphviz
language-pack-en
libgcrypt20-dev
libglib2.0-dev
libgnutls28-dev
libgpgme11-dev
libgpgme-dev
libhiredis-dev
libical2-dev
libksba-dev
libmicrohttpd-dev
libnet-snmp-perl
libpcap-dev
libpopt-dev
libsnmp-dev
libsqlite3-dev
libssh-gcrypt-dev
libxml2-dev
net-tools
nikto
nmap
patch
perl-base heimdal-dev
pkg-config
python3
python3-dev
python3-pip
python3-defusedxml
python3-dialog
python3-lxml
python3-paramiko
python3-setuptools
wget
EOF
} | xargs apt-get install -yq --no-install-recommends


rm -rf /var/lib/apt/lists/*