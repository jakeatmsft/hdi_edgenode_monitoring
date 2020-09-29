sudo su
cd /etc/opt/microsoft/omsagent/conf/omsagent.d
sed -i '87a\  log_level warn' hive.headnode.conf
/opt/microsoft/omsagent/bin/service_control restart
