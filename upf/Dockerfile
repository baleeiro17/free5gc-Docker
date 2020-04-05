From free5gc-base

RUN apt-get install -y iptables

COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc.conf
COPY setup.sh /root/setup.sh

## THE LIFE SAVER
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait
RUN chmod +x /root/setup.sh

COPY iptables.sh /root/iptables.sh
RUN chmod +x /root/iptables.sh

CMD /wait && /root/setup.sh; /root/iptables.sh; /free5gc/free5gc-upfd
