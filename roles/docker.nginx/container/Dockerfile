FROM centos:8
LABEL maintainer "Brian Milco <brian@milco.info>"
LABEL source "https://github.com/ipenguin/nfs-server"
LABEL branch "master"

COPY Dockerfile README.md /

RUN dnf update -y && \
    dnf install -y nfs-utils nfs4-acl-tools

EXPOSE 111
EXPOSE 2049
EXPOSE 20048

COPY entry.sh /usr/local/bin/entry.sh

RUN chmod +x /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]
