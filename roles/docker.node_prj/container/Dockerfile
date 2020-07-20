FROM node:14

MAINTAINER Brian Milco <brian@milco.info>

RUN mkdir -p /srv/app/
COPY application/ /srv/app/

CMD [ "node", "/srv/app/app.js" ]

EXPOSE 80
