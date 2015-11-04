url="http://192.168.1.1/userRpm/SysRebootRpm.htm?Reboot=%D6%D8%C6%F4%C2%B7%D3%C9%C6%F7";

nmcli c up id 192.168.1.220
curl -u admin:admin "$url" -s > /dev/null
nmcli c up id 192.168.2.220
