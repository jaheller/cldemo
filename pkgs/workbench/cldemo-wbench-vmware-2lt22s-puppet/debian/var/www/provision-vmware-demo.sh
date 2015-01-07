#!/bin/bash

function error() {
  echo -e "\e[0;33mERROR: Provisioning error running $BASH_COMMAND at line $BASH_LINENO of $(basename $0) \e[0m" >&2
  }

  # Log all output from this script
  exec >/var/log/autoprovision 2>&1

  trap error ERR

  # Switch repos due to beta
  sed -i '/^deb/ s/^/#/' /etc/apt/sources.list
  sed -i '/^APT/ s/^/#/' /etc/apt/apt.conf

  echo "deb http://ftp.us.debian.org/debian stable main contrib non-free

  deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free

  deb http://security.debian.org/ wheezy/updates main contrib non-free
  " >> /etc/apt/sources.list

  /usr/bin/wget -O /tmp/puppetlabs-release-wheezy.deb https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb 
  /usr/bin/dpkg -i /tmp/puppetlabs-release-wheezy.deb
  # push root & cumulus ssh keys
  URL="http://wbench.lab.local/authorized_keys"

  mkdir -p /root/.ssh 
  /usr/bin/wget -O /root/.ssh/authorized_keys $URL
  mkdir -p /home/cumulus/.ssh
  /usr/bin/wget -O /home/cumulus/.ssh/authorized_keys $URL
  chown -R cumulus:cumulus /home/cumulus/.ssh

  # Upgrade and install Puppet
  apt-get update -y
  apt-get install puppet -y

  echo "Configuring puppet" | wall -n
  sed -i /etc/default/puppet -e 's/START=no/START=yes/'

  service puppet restart

  # CUMULUS-AUTOPROVISIONING

  exit 0
