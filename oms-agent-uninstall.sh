#!/bin/bash -x

# The script removes oms-agent from Linux machine

sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d 
wget https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh && sh onboard_agent.sh --purge
sudo su rm -rf /etc/opt/microsoft/omsagent 
sudo su rm -rf/var/opt/microsoft/omsagent
