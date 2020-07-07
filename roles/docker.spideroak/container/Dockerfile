FROM ubuntu:20.04
MAINTAINER Brian Milco <brian@milco.info>

RUN apt update && apt upgrade -y && \
    apt install apt-utils wget gnupg -y && \
    wget -O /spideroak.deb https://spideroak.com/release/spideroak/deb_x64 && \
    dpkg -i /spideroak.deb && \
    rm /spideroak.deb && \
    mkdir -p /root/.config/SpiderOakONE/

COPY init.sh /usr/local/bin/init
COPY setup.json /root/.config/SpiderOakONE/

RUN chmod +x /usr/local/bin/init

VOLUME [ "/docker", "/data" ]

ENTRYPOINT [ "/usr/local/bin/init" ]
CMD [ "/usr/bin/SpiderOakONE", "--headless" ]
