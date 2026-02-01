============================
README for my infrastructure
============================

This repo contains the Salt states and pillar data for my servers. We run on
Hetzner and bootstrap new VPS instances via cloud-init.

Hetzner cloud-init
==================

In Hetzner, paste a cloud-init file when creating a new server. We use the
``#include`` directive to pull the shared bootstrap config from this repo::

  #include
  https://raw.githubusercontent.com/jodok/infra/refs/heads/master/cloud-init/ubuntu.yaml

What the cloud-init does:

- creates the ``admin`` user with passwordless sudo
- installs Salt from the Salt Project repository
- clones this repo to ``/home/admin/sandbox/infra``
- configures ``salt-minion`` for local mode
- runs the first ``salt-call --local`` from the cloned repo

Local Salt install (if not using cloud-init)
=============================================

Install salt-minion from the Salt Project DEB repository::

  sudo mkdir -p /etc/apt/keyrings
  sudo curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
  sudo curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

  sudo apt-get update
  sudo apt-get install -y salt-minion git


GPG encryption of pillar data
-----------------------------

I'm using GPG to encrypted sensitive pillar data. Therefore we need also need
to get the public and private GPG key to our server as well.
I'm using `GPGTools https://gpgtools.org/`_ on my Mac and created a separate
identiy for my sysadmin related tasks. To export the keys run::

  gpg --export-secret-key -a sysadmin@batlogg.com >keypair.gpg

Copy the file to the server to install and import the keys so salt can use them::

  sudo mkdir -p /etc/salt/gpgkeys
  sudo chmod 0700 /etc/salt/gpgkeys
  sudo gpg --homedir /etc/salt/gpgkeys --list-keys
  sudo gpg --homedir /etc/salt/gpgkeys --import keypair.gpg

Salt is running headless, therefor we need to remove the password protection from
the GPG private key. Unfortunately this has to be done interactively::

  sudo gpg --homedir /etc/salt/gpgkeys --list-keys

Use the key id from the output above and edit it::

  sudo gpg --homedir /etc/salt/gpgkeys --edit-key 354DEEB6FCFD06528A580222A3FBD09FADA7033F

Let's remove the password::

  gpg> passwd

In case you can't enter an empty password you might need to configure pinentry::

  sudo apt install pinentry-tty
  sudo update-alternatives --config pinentry

and set it to `pinentry-tty`


Notes
-----

- The bootstrap derives the FQDN from the existing hostname and appends
  ``batlogg.com``.
