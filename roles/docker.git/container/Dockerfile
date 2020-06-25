# This docker container was extended from https://github.com/panubo/docker-sshd
#
FROM alpine:3.11

MAINTAINER "Brian Milco <brian@milco.info>"

COPY LICENSE README.md /

RUN apk update && \
    apk add bash git openssh openssh-server-pam rsync augeas shadow rssh && \
    deluser $(getent passwd 33 | cut -d: -f1) && \
    delgroup $(getent group 33 | cut -d: -f1) 2>/dev/null || true && \
    mkdir -p /etc/authorized_keys

COPY sshd_config /etc/ssh/sshd_config

RUN cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

RUN useradd -g users -s /usr/bin/git-shell -md /git git && \
    echo "git:ywTti9mXVMarBcnEiCjCBLFjhb7LaoWyavvljcY0" | chpasswd && \
    chown -R git:users /git

EXPOSE 22

COPY entry.sh /usr/local/bin/entry.sh
RUN chown root:root /usr/local/bin/entry.sh && \
    chmod +x /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
