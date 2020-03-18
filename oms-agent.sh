#!/bin/bash -x

# The script takes 3 parameters: <OMS workspace ID> <OMS primary key> <storagelocation>
# <OMS workspace ID> is passed by user inputs
# <OMS primary key> is passed by user inputs
# <storagelocation> storage location of install scripts

if [ $# != 3];
then
    echo "Invalid number of arguments: $# .Usage: oms-agent.sh <LAworkspaceid> <LAworkspacekey> <storagelocation> "
    exit 1
fi

sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d 
wget $3/onboard_agent.sh && sh onboard_agent.sh -w $1 -s $2 -d opinsights.azure.com -l $3
sudo su omsagent -c 'python /opt/microsoft/omsconfig/Scripts/PerformRequiredConfigurationChecks.py' /opt/microsoft/omsagent/bin/service control restart $1