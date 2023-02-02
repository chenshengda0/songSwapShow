#!/bin/bash
step=5 #间隔的秒数，不能大于60
for (( i = 0; i < 60; i=(i+step) )); do
{
    #获取交易对最新区块高度
    curl http://127.0.0.1:9528/consumer/get_coin_price

} &
    sleep $step

done
exit