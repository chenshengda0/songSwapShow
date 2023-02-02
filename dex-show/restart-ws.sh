#!/bin/bash
screen -S DexNodeWs -X quit
screen -dmS DexNodeWs
screen -x -S DexNodeWs -p 0 -X stuff $'/usr/local/bin/node /opt/build/Crontab/index.js >> /opt/build/dex-show.md 2>&1'
screen -x -S DexNodeWs -p 0 -X stuff $'\n'
echo "重启WS"