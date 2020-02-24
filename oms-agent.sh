#!/bin/bash -x

# The script takes 2 parameters: <OMS workspace ID> <OMS primary key>
# <OMS workspace ID> is passed by user inputs
# <OMS primary key> is passed by user inputs

if [ $# != 2];
then
    echo "Invalid number of arguments: $# .Usage: oms-agent.sh <LAworkspaceid> <LAworkspacekey> "
    exit 1
fi

sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d 
wget https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh && sh onboard_agent.sh -w $1 -s $2 -d opinsights.azure.com 
sudo su omsagent -c 'python /opt/microsoft/omsconfig/Scripts/PerformRequiredConfigurationChecks.py' /opt/microsoft/omsagent/bin/service control restart $1