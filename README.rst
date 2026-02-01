============================
README for my infrastructure
============================

I've decided to share and document my own infrastructure. So get inspired and
provide me feedback.

Ubuntu is the preferred distribution for new servers.

This README assumes there's a user `admin` that we use to bootstrap the system
and we're going to use him for administrative tasks.

You can create an admin user with the following command (as root). On Ubuntu
use the `sudo` group::

  useradd -m -G sudo admin

I prefer to be able to run ``sudo`` as admin user without entering a password
therefor I set ``/etc/sudoers`` like this::

  ## Allows people in group sudo to run all commands
  # %sudo  ALL=(ALL:ALL) ALL

  ## Same thing without a password
  %sudo  ALL=(ALL:ALL) NOPASSWD: ALL

Make sure your hostname is set correctly. The following command should show the
fully qualified domainname of your host::

  hostname -f

In case this doesn't show the desired hostname (FQDN), correct it with::

  sudo hostnamectl set-hostname your-new-hostname.your-domain


Cloud-init bootstrap (Ubuntu)
=============================

The file ``cloud-init/ubuntu.yaml`` bootstraps a new Ubuntu VPS. It will:

- create the ``admin`` user (with passwordless sudo)
- install Salt via the Salt Project repository
- clone this repository from GitHub
- configure ``salt-minion`` for local usage
- run the first local ``salt-call`` from the cloned repository

Before using it:

- Replace the placeholder SSH key in the file.
- Optionally set ``hostname`` and ``fqdn`` in the cloud-init file if your VPS
  provider does not set the hostname for you. The cloud-init run writes
  ``/etc/salt/minion_id`` based on ``hostname -f``.
- Adjust the repository URL if you're using a fork.


Local installation of Salt (Ubuntu)
===================================

Install salt-minion from the Salt Project DEB repository::

  sudo mkdir -p /etc/apt/keyrings
  sudo curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
  sudo curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

  sudo apt-get update
  sudo apt-get install -y salt-minion git


Local Salt configuration
========================

Clone this repository to a working folder of the ``admin`` user::

  git clone https://github.com/jodok/infra /home/admin/sandbox/infra

Now, configure salt to not connect to a salt master, but rather use the local
files. Make sure the following options are set in ``/etc/salt/minion``::

  file_client: local
  file_roots:
    base:
    - /home/admin/sandbox/infra/salt
  pillar_roots:
    base:
    - /home/admin/sandbox/infra/pillar
  decrypt_pillar:
  - 'secrets:vault'

To make sure the host can be correctly identified when applying the states
create the file ``/etc/salt/minion_id``::

  echo $(hostname -f) | sudo tee -a /etc/salt/minion_id


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


The first salt run
------------------

Here we go! We're ready to apply the state to the local node::

  sudo salt-call --local state.apply terse=true
