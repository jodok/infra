# Network setup (home)

> Scope: High-level documentation of the current home network as managed/observed through UniFi.
>
> **Status:** partial / TODOs included where details are not captured yet.

## Topology (high level)

- **UniFi console / gateway (router)**
  - Acts as the edge router / firewall.
  - Provides VLAN segmentation.
- **BTLG network**
  - VLAN: **7**
  - SSID: **BTLG WiFi**
- **Raspberry Pis**
  - `cantina` - Raspberry Pi in the basement (formerly `raspberrypi-keller`).
  - `ponte` - Raspberry Pi (role/TODO).

## Networks / VLANs

### BTLG network

- **Name:** BTLG
- **VLAN ID:** 7
- **Purpose:** Primary internal network segment for the BTLG environment.
- **WiFi:** BTLG WiFi (SSID)

**TODO:** document
- IPv4 subnet (e.g. 192.168.x.0/24) and gateway IP
- DHCP range + reservations
- DNS settings distributed via DHCP (gateway / custom resolver)
- Any firewall rules specific to VLAN 7

## WiFi

### BTLG WiFi

- **SSID:** BTLG WiFi
- **Mapped network:** BTLG (VLAN 7)

**TODO:** document
- WPA mode (WPA2/WPA3), PMF setting
- Band steering / minimum RSSI (if configured)
- AP(s) broadcasting this SSID

## Hosts

### `cantina` (Raspberry Pi)

- **Hostname:** `cantina`
- **Location:** basement ("keller")
- **OS:** Raspbian GNU/Linux 12 (bookworm)
- **Notes:**
  - Hostname was changed from `raspberrypi-keller` -> `cantina` on 2026-02-06.

**TODO:** document
- IP address (DHCP reservation?)
- Services running (OpenClaw node? DNS? monitoring? etc.)

### `ponte` (Raspberry Pi)

- **Hostname:** `ponte`

**TODO:** document
- Location
- IP address
- OS version
- Services running

## DNS

At the moment, the UniFi WAN is set to **Auto DNS Server** (i.e. uses ISP-provided resolvers) unless overridden.

**TODO:**
- Confirm the exact upstream resolvers (ISP vs manual)
- Decide whether to use a custom resolver (e.g. DNS4EU / Cloudflare / local Unbound)

## Operational notes

- Prefer documenting changes as small commits (e.g. "rename host raspberrypi-keller -> cantina").
- Keep a list of reserved IPs + hostnames.

## Changelog

- **2026-02-06**: Rename Raspberry Pi hostname to `cantina`.
