FROM hwdsl2/ipsec-vpn-server

ENV GNS3_CONTAINER=192.168.42.3
ENV GNS3_VPN=172.28.1.1

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]