FROM ubuntu:21.04

RUN apt-get update -y && apt-get install -y curl apt-transport-https cron nano systemctl
RUN curl -s https://install.speedtest.net/app/cli/install.deb.sh | bash
# RUN chmod +x ./install.deb.sh && ./install.deb.sh && rm install.deb.sh
RUN apt-get install -y --no-install-recommends speedtest

RUN speedtest --accept-license

COPY capture-speed.sh /root/
RUN chmod +x /root/capture-speed.sh

RUN mkdir /data

RUN echo "59 * * * * root /root/capture-speed.sh /data/speedtest-results.csv >/dev/null 2>&1" >> /etc/crontab



COPY entrypoint.sh /root/entrypoint.sh 
RUN chmod +x /root/entrypoint.sh 
ENTRYPOINT ["/root/entrypoint.sh"]
