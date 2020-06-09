#!/bin/bash
#
#
#

docker run -t -i \
	-e "DOMAIN=n.milco.info" \
	-e "NETBIOS=MILCO" \
	-e "DOMAINPASS=tLYC24gJkNNqKtQ2oNLx" \
	-e "DNSFORWARDER=192.168.1.1" \
	-e "HOSTIP=192.168.1.10" \
	-p 192.168.1.10:53:53 \
	-p 192.168.1.10:53:53/udp \
	-p 192.168.1.10:88:88 \
	-p 192.168.1.10:88:88/udp \
	-p 192.168.1.10:135:135 \
	-p 192.168.1.10:137-138:137-138/udp \
	-p 192.168.1.10:139:139 \
	-p 192.168.1.10:389:389 \
	-p 192.168.1.10:389:389/udp \
	-p 192.168.1.10:445:445 \
	-p 192.168.1.10:464:464 \
	-p 192.168.1.10:464:464/udp \
	-p 192.168.1.10:636:636 \
	-p 192.168.1.10:1024-1044:1024-1044 \
	-p 192.168.1.10:3268-3269:3268-3269 \
	-v /etc/localtime:/etc/localtime:ro \
	-v /data/ad1/data/:/var/lib/samba \
	-v /data/ad1/config/samba:/etc/samba/external \
	--dns-search n.milco.info \
	--dns 192.168.1.10 \
	--dns 192.168.1.11 \
	--add-host ad1.n.milco.info:192.168.1.10 \
	-h ad1 -d \
	--name ad1 \
	--privileged \
	samba-domain
