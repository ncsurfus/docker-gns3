FROM ubuntu:18.04

ENV GNS3_VERSION 2.2.12
WORKDIR /

# Install Dependencies, GNS3 Server, GNS3 IOU
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y software-properties-common wget docker.io --no-install-recommends \
    && add-apt-repository ppa:gns3/ppa -y \
    && apt-get install -y "gns3-server=${GNS3_VERSION}~*" gns3-iou dynamips iouyap \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Add IOU License
RUN wget https://github.com/ncsurfus/goioulic/releases/download/v0.1.0/linux_amd64_goioulic \
 && chmod +x linux_amd64_goioulic \
 && echo "127.0.0.254 xml.cisco.com" >> /etc/hosts

# Create Data Directory
WORKDIR /data
VOLUME ["/data"]

# Add Config / Entrypoint / Docker scripts
ADD ./entrypoint.sh /entrypoint.sh
ADD ./docker.sh /docker.sh
ADD ./config.ini /config.ini
RUN chmod +x /entrypoint.sh && chmod +x /docker.sh

ENTRYPOINT [ "/entrypoint.sh" ]
