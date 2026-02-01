# Infrastructure Management with Salt

This repository contains Salt states and pillar data for managing servers on Hetzner infrastructure.

## Overview

- **Platform**: Hetzner Cloud
- **Configuration Management**: Salt (local mode)
- **Bootstrap Methods**: Cloud-init (automated) or manual setup
- **Security**: GPG-encrypted pillar data for sensitive configuration

## Table of Contents

1. [Server Bootstrap](#server-bootstrap)
   - [Option A: Cloud-Init (Recommended)](#option-a-cloud-init-recommended)
   - [Option B: Manual Bootstrap](#option-b-manual-bootstrap)
2. [GPG Key Setup](#gpg-key-setup)
3. [First Salt Run](#first-salt-run)

---

## Server Bootstrap

Choose one of the two bootstrap methods below. **Option A (cloud-init) is recommended** for new servers.

### Option A: Cloud-Init (Recommended)

The fastest way to bootstrap a new server on Hetzner.

**Steps:**

1. In the Hetzner Cloud console, when creating a new server, paste the following in the **Cloud-Init** field:
   ```
   #include
   https://raw.githubusercontent.com/jodok/infra/refs/heads/master/cloud-init/ubuntu.yaml
   ```

2. Create the server and wait for cloud-init to complete (visible in the server's status page)

**What cloud-init automatically does:**
- Installs Salt from the official Salt Project repository
- Clones this repository to `/home/admin/sandbox/infra`
- Configures Salt minion for local mode
- Sets up basic system configuration

**Next steps:** Proceed to [GPG Key Setup](#gpg-key-setup)

### Option B: Manual Bootstrap

Use this method if cloud-init is not available or you prefer manual setup.

**Prerequisites:**
- SSH access to the server as root
- This repository available locally or accessible via git

**1. Install Salt**

Follow the official [Salt Project installation guide](https://docs.saltproject.io/salt/install-guide/en/latest/).

**2. Set the Minion Hostname (FQDN)**

Salt uses the minion ID to select server-specific pillar data. The FQDN must match the pillar configuration in [pillar/top.sls](pillar/top.sls).

Verify the current FQDN:
```bash
hostname --fqdn
```

If the FQDN does not include the domain (in my case `batlogg.com` or `nr.gy`), set it:
```bash
sudo hostnamectl set-hostname <hostname>.batlogg.com --static
```

Set the minion ID:
```bash
sudo sh -c 'echo "$(hostname -f)" > /etc/salt/minion_id'
```

**3. Configure Salt for Local Mode**

Edit `/etc/salt/minion` and add:

```yaml
file_client: local
file_roots:
  base:
    - /home/admin/sandbox/infra/salt/states
pillar_roots:
  base:
    - /home/admin/sandbox/infra/salt/pillar
decrypt_pillar:
  - "secrets:vault"
```

**4. Clone This Repository**

as the `admin` user, clone the repository:

```bash
mkdir -p /home/admin/sandbox
git clone https://github.com/jodok/infra.git /home/admin/sandbox/infra
```

**Next steps:** Proceed to [GPG Key Setup](#gpg-key-setup)

---

## GPG Key Setup

Before running Salt, GPG encryption must be configured for encrypted pillar data.

> **Important:** You must be logged in as root for initial setup. After the first Salt run, root login will be disabled and you must use the `admin` user.

### 1. Export GPG Keys (On Your Local Machine)

If you use [GPGTools](https://gpgtools.org/) (macOS) or another GPG setup with a sysadmin identity:

```bash
gpg --export-secret-key -a 354DEEB6FCFD06528A580222A3FBD09FADA7033F > keypair.gpg
```

> Replace `354DEEB6FCFD06528A580222A3FBD09FADA7033F` with your actual GPG key ID.

### 2. Transfer Keys to Server

Copy the exported key to the server:

```bash
scp keypair.gpg root@<server-ip>:/tmp/
```

### 3. Import Keys on Server

SSH into the server as root and run:

```bash
sudo mkdir -p /etc/salt/gpgkeys
sudo chmod 0700 /etc/salt/gpgkeys
sudo gpg --homedir /etc/salt/gpgkeys --import /tmp/keypair.gpg
sudo rm /tmp/keypair.gpg
```

You'll be prompted for the password used when exporting the key.

### 4. Remove GPG Password Protection

Since Salt runs headless, the GPG key must have an empty password. Run:

```bash
sudo gpg --homedir /etc/salt/gpgkeys --edit-key 354DEEB6FCFD06528A580222A3FBD09FADA7033F
```

At the `gpg>` prompt, enter:
```
passwd
```

Follow the prompts to set an empty password. You may need to repeat this command until it succeeds.

**Troubleshooting:** If you can't set an empty password, configure pinentry:
```bash
sudo apt install pinentry-tty
sudo update-alternatives --config pinentry
```
Select `pinentry-tty` from the menu.

---

## First Salt Run

Once GPG keys are configured, run Salt to apply the server configuration:

```bash
sudo salt-call --local state.apply terse=true
```

This will:
- Install and configure all services defined in `salt/`
- Apply host-specific settings from `pillar/hosts/`
- Decrypt secrets from `pillar/secrets.sls`

Monitor the output for any errors. Warnings about state changes are normal on the first run.
