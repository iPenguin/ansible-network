#!/bin/bash
#
#

docker run -d --restart always \
	--name nfs-srv \
	--privileged \
	-v /srv/etc/exports:/etc/exports \
	-v /srv/shares:/srv/shares \
	-p 192.168.1.15:2049:2049 \
	-p 192.168.1.15:111:111 \
	-p 192.168.1.15:20048:20048 \
	nfs
