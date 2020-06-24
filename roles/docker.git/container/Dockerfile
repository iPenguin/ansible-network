# This docker container was extended from https://github.com/panubo/docker-sshd
#
FROM alpine:3.11

MAINTAINER "Brian Milco <brian@milco.info>"

COPY LICENSE README.md /

RUN apk update && \
    apk add bash git openssh rsync augeas shadow rssh && \
    deluser $(getent passwd 33 | cut -d: -f1) && \
    delgroup $(getent group 33 | cut -d: -f1) 2>/dev/null || true && \
    mkdir -p ~root/.ssh /etc/authorized_keys && chmod 700 ~root/.ssh/ && \
    augtool 'set /files/etc/ssh/sshd_config/AuthorizedKeysFile ".ssh/authorized_keys /etc/authorized_keys/%u"' && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /home/git/.ssh/ && \
    mkdir -p /git && \
    useradd -g users -s /usr/bin/git-shell git && \
    echo "git:$1$Uxm6V02m$znEIIqtD4GNgBLPF08rx.." > chpasswd -e && \
    chown -R git:users /home/git /git

EXPOSE 22

COPY entry.sh /usr/local/bin/entry.sh
RUN chown root:root /usr/local/bin/entry.sh && \
    chmod +x /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
