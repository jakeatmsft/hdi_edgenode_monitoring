oms-agent.sh: 
The script takes 3 parameters: &lt;OMS workspace ID&gt; &lt;OMS key&gt; &lt;storage location&gt;
 - &lt;OMS workspace ID&gt;  is passed by user inputs
 - &lt;OMS key&gt; is passed by user inputs
 - &lt;storagelocation&gt; storage location of install scripts

if [ $# != 3];
then
    echo "Invalid number of arguments: $# .Usage: oms-agent.sh <LAworkspaceid> <LAworkspacekey> <storagelocation> "
    exit 1
fi

sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d 
wget $3/onboard_agent.sh && sh onboard_agent.sh -w $1 -s $2 -d opinsights.azure.com -l $3
sudo su omsagent -c 'python /opt/microsoft/omsconfig/Scripts/PerformRequiredConfigurationChecks.py' /opt/microsoft/omsagent/bin/service control restart $1



## Steps
### Copy linux agents from to install folder in storage directory:
### https://github.com/Microsoft/OMS-Agent-for-Linux/releases/
### ensure that the names of the release scripts match in the onboard_agent.sh script lines:12-13
