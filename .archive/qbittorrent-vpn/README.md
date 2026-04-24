# Raspberry Pi qBittorrent Over VPN

Status: archived on 2026-04-24.

This directory contains the retired Raspberry Pi setup that ran `qbittorrent-nox` inside an OpenVPN-backed network namespace and exposed the Web UI on the LAN. No Kodi-specific files were present in this repo, so only the qBittorrent/VPN pieces were archived.

Archived files mirror their former locations in the active chezmoi source tree:

* `dot_local/bin/executable_vpn`
* `dot_local/bin/executable_aria2c-vpn`
* `dot_local/bin/executable_qbittorrent-vpn`
* `dot_local/bin/executable_qbittorrent-webui-proxy`
* `dot_etc/systemd/system/vpn.service`
* `dot_etc/systemd/system/qbittorrent-vpn.service`
* `dot_etc/systemd/system/qbittorrent-webui-proxy.service`
* `run_after_50-deploy-vpn-system-files.sh`

## What It Did

* `vpn.service` created the `airvpn` namespace, veth pair, nftables rules, and OpenVPN tunnel.
* `qbittorrent-vpn.service` ran `qbittorrent-nox` inside that namespace with its own profile at `~/.local/share/qbittorrent-vpn`.
* `qbittorrent-webui-proxy.service` exposed `http://<pi-lan-ip>:8080` on the host and forwarded it to `10.203.0.2:8080` inside the namespace.
* `aria2c-vpn` wrapped `aria2c` with the fixed interface and torrent flags used by that setup.
* `run_after_50-deploy-vpn-system-files.sh` copied helper binaries into `/usr/local/bin`, copied units into `/etc/systemd/system`, reloaded systemd, and tried to restart the affected services.

## Prerequisites

* `openvpn`, `nft`, `ip`, `getent`, and `runuser` available on the host
* `qbittorrent-nox` installed on the host
* exactly one OpenVPN profile at `~/.vpn/*.ovpn`
* `sudo` access for deployment and service management

## Operational Notes

* public CLI: `vpn enable`, `vpn disable`, `vpn check`, and `vpn exec <command>...`
* default Web UI port: `8080`
* default torrent port: `42424`
* host-side Web UI URL: `http://<pi-lan-ip>:8080`
* namespace-side Web UI URL from the Pi itself: `http://10.203.0.2:8080`
* first qBittorrent login defaults were `admin` / `adminadmin`

If you changed the OpenVPN profile and wanted a clean rebuild, the usual flow was:

```bash
vpn disable
vpn enable
vpn check
```

For one-off qBittorrent launches with a separate profile or port, the old README used:

```bash
tmp="$(mktemp -d)"
vpn exec qbittorrent-nox --profile="$tmp/profile" --webui-port=18080 --torrenting-port=42425 --daemon
```

## Reuse It Without Reintroducing It Globally

If you want to bring this back on one Raspberry Pi while keeping the shared dotfiles generic, treat the files in this directory as templates and install them manually on that host.

1. Copy the binaries from `.archive/raspberry-pi-qbittorrent-vpn/dot_local/bin/` into `~/.local/bin/`.
2. Install the service-facing binaries into `/usr/local/bin/`.
3. Install the units from `.archive/raspberry-pi-qbittorrent-vpn/dot_etc/systemd/system/` into `/etc/systemd/system/`.
4. Run `sudo systemctl daemon-reload`.
5. Place one `.ovpn` profile under `~/.vpn/`.
6. Start the namespace with `vpn enable`.
7. Optionally enable `qbittorrent-vpn.service` and `qbittorrent-webui-proxy.service`.

## Reintroduce It Into Chezmoi Later

If you decide this should be managed again from the dotfiles repo:

1. Move the archived files back to their original repo paths.
2. Restore a deployment hook or another privileged install step.
3. Gate the setup behind a machine-specific condition so it stays off the non-Pi machines.

## Retirement Cleanup

These were the relevant commands to remove the setup from a Raspberry Pi host:

```bash
sudo systemctl disable --now qbittorrent-webui-proxy.service qbittorrent-vpn.service vpn.service
sudo rm -f /usr/local/bin/vpn /usr/local/bin/qbittorrent-vpn /usr/local/bin/qbittorrent-webui-proxy
sudo rm -f /etc/systemd/system/vpn.service /etc/systemd/system/qbittorrent-vpn.service /etc/systemd/system/qbittorrent-webui-proxy.service
sudo systemctl daemon-reload
rm -rf ~/.local/share/qbittorrent-vpn
```
