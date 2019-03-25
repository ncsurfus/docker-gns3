FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl iputils-ping openssh-client iproute2 language-pack-en lsb-release gnupg && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    cd /tmp && \
    curl https://raw.githubusercontent.com/GNS3/gns3-server/master/scripts/remote-install.sh > gns3-remote-install.sh && \
    chmod +x gns3-remote-install.sh && \
    ./gns3-remote-install.sh --with-iou --with-i386-repository || true

RUN curl -L https://github.com/ncsurfus/goioulic/releases/download/v0.1.0/linux_amd64_goioulic > /tmp/goioulic && \
    chmod +x /tmp/goioulic

COPY start.sh /tmp/start.sh
ENTRYPOINT /tmp/start.sh

