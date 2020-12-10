============================
README for my infrastructure
============================

I've decided to share and document my own infrastructure. So get inspired and
provide me feedback.

This README assumes there's a user `admin` that we use to bootstrap the system
and we're going to use him for administrative tasks.

You can create an admin user with the following command (as root)::

  useradd -m -G wheel admin

I prefer to be able to run ``sudo`` as admin user without entering a password
therefor I set ``/etc/sudoers`` like this::

  ## Allows people in group wheel to run all commands
  # %wheel  ALL=(ALL) ALL

  ## Same thing without a password
  %wheel  ALL=(ALL) NOPASSWD: ALL

Make sure your hostname is set correctly. The following command should show the
fully qualified domainname of your host::

  hostname -f

In case this doesn't show the desired hostname (FQDN), correct it with::

  sudo hostnamectl set-hostname your-new-hostname.your-domain

We also assume that SELINUX is disabled. Disabling SELINUX requires a system
restart.

Going forward CentOS Stream is the preferred distribution. In case the base
image was based on CentOS 8, move to Stream::

  dnf install centos-release-stream
  dnf swap centos-{linux,stream}-repos
  dnf distro-sync


Local installation of Salt
==========================

First install salt-minion (and the required repositories)::

  sudo dnf config-manager --set-enabled PowerTools
  sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
  sudo dnf -y install https://repo.saltstack.com/py3/redhat/salt-py3-repo-latest.el8.noarch.rpm
  sudo dnf -y install salt-minion git

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

The first salt run
------------------

Here we go! We're ready to apply the state to the local node::

  sudo salt-call --local state.apply terse=true
