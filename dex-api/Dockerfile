FROM node:latest
RUN apt -y update && apt -y upgrade && apt install -y vim iproute2 xz-utils wget sudo  inetutils-ping net-tools curl nginx screen cron

COPY dex-show/init-start.sh /opt/init-start.sh
COPY dex-show/restart.sh /opt/restart.sh

RUN sed -i -e "s/\r//" /opt/init-start.sh
RUN sed -i -e "s/\r//" /opt/restart.sh

RUN chmod -R 777 /opt/init-start.sh
RUN chmod -R 777 /opt/restart.sh

EXPOSE 9529
CMD /opt/init-start.sh && while true;do sleep 3000;done