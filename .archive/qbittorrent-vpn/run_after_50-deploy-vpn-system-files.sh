#!/bin/sh
set -eu

sudo install -m 0755 "$HOME/.local/bin/vpn" /usr/local/bin/vpn
sudo install -m 0755 "$HOME/.local/bin/qbittorrent-vpn" /usr/local/bin/qbittorrent-vpn
sudo install -m 0755 "$HOME/.local/bin/qbittorrent-webui-proxy" /usr/local/bin/qbittorrent-webui-proxy
sudo install -m 0644 "$HOME/.etc/systemd/system/vpn.service" /etc/systemd/system/vpn.service
sudo install -m 0644 "$HOME/.etc/systemd/system/qbittorrent-vpn.service" /etc/systemd/system/qbittorrent-vpn.service
sudo install -m 0644 "$HOME/.etc/systemd/system/qbittorrent-webui-proxy.service" /etc/systemd/system/qbittorrent-webui-proxy.service
sudo systemctl daemon-reload
sudo systemctl try-restart vpn.service qbittorrent-vpn.service qbittorrent-webui-proxy.service