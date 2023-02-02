FROM node:latest
RUN apt -y update && apt -y upgrade && apt install -y vim iproute2 xz-utils wget sudo  inetutils-ping net-tools curl nginx screen cron
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_bak
COPY dex-show/nginx.conf /etc/nginx/nginx.conf

COPY dex-show/init-start.sh /opt/init-start.sh
COPY dex-show/restart.sh /opt/restart.sh
COPY dex-show/restart-ws.sh /opt/restart-ws.sh
COPY dex-show/consumer.sh /opt/consumer.sh
RUN sed -i -e "s/\r//" /opt/init-start.sh
RUN sed -i -e "s/\r//" /opt/restart.sh
RUN sed -i -e "s/\r//" /opt/restart-ws.sh
RUN sed -i -e "s/\r//" /opt/consumer.sh
RUN chmod -R 777 /opt/init-start.sh
RUN chmod -R 777 /opt/restart.sh
RUN chmod -R 777 /opt/restart-ws.sh
RUN chmod -R 777 /opt/consumer.sh
EXPOSE 9528
CMD /opt/init-start.sh && while true;do sleep 3000;done
