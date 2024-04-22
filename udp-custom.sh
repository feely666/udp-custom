#!/bin/bash

purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }


cd
rm -rf /etc/udp-custom
mkdir -p /etc/udp-custom

sleep 1
# change to time GMT+7
red "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
green "downloading udp-custom"
curl -Lk "https://raw.githubusercontent.com/feely666/udp-custom/main/udp-custom-linux-amd64" -o /etc/udp-custom/udp-custom
chmod +x /etc/udp-custom/udp-custom

green "downloading default config"
curl -Lk "https://raw.githubusercontent.com/feely666/udp-custom/main/config.json" -o /etc/udp-custom/config.json
chmod 644 /etc/udp-custom/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp-custom/udp-custom server
WorkingDirectory=/etc/udp-custom/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp-custom/udp-custom server -exclude $1
WorkingDirectory=/etc/udp-custom/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

tyblue "start service udp-custom"
systemctl start udp-custom &>/dev/null

tyblue "enable service udp-custom"
systemctl enable udp-custom &>/dev/null
