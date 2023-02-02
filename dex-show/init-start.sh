#!/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc
sed -i "$ a source /etc/environment" /etc/screenrc
echo "* * * * * date >> /opt/build/test.md" >> ~/init-crontab
echo "0 0 * * * /opt/restart.sh" >> ~/init-crontab
#echo "*/5 * * * * /opt/restart-ws.sh >> /opt/build/test.md" >> ~/init-crontab
echo "* * * * * curl http://127.0.0.1:9528/publish/send_eth_price >> /opt/build/test.md" >> ~/init-crontab
echo "* * * * * curl http://127.0.0.1:9528/publish/send_btc_price >> /opt/build/test.md" >> ~/init-crontab
echo "* * * * * /opt/consumer.sh >> /opt/build/test.md" >> ~/init-crontab
crontab ~/init-crontab
rm -rf ~/init-crontab
service cron restart
#service nginx restart
/opt/restart.sh
#/opt/restart-ws.sh
echo "end" >> /opt/test.md