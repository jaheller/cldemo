#!/bin/bash

function error() {
  echo -e "\e[0;33mERROR: Provisioning error running $BASH_COMMAND at line $BASH_LINENO of $(basename $0) \e[0m" >&2
}

# Log all output from this script
exec >/var/log/autoprovision 2>&1

trap error ERR


# Workaround for CM-3812; clean out the apt cache before we run apt-get update
$(rm -f /var/lib/apt/lists/partial/* /var/lib/apt/lists/* 2>/dev/null; true)

# Add CFEngine repository
wget -qO- https://s3.amazonaws.com/cfengine.package-repos/pub/gpg.key | apt-key add -
echo "deb http://cfengine.com/pub/apt/packages stable main" > /etc/apt/sources.list.d/cfengine-community.list

# install cfengine
apt-get update -y
apt-get upgrade -y
apt-get install cfengine-community -y

# bootstrap against itself
/var/cfengine/bin/cf-agent --bootstrap 192.168.0.1

sleep 5

/var/cfengine/bin/cf-agent -K

sleep 5

/var/cfengine/bin/cf-agent -K

#CUMULUS-AUTOPROVISIONING

exit 0
