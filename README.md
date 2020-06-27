This repo contains a basic definition for a very simple network configuration.

I use this repository to deploy my home network and to experiment with Ansible, Docker and other technologies.

Directory Structure:

* galaxy      - Roles downloaded from galaxy.ansible.com

* hosts       - Host definitions, inventory files, and variables broken out by environment

* roles       - Custom roles
  + docker_skeleton - A special role designed for re-use with each docker node created.
* tasks       - Custom tasks

* playbooks   - Define servers and the roles, tasks, variables, and hosts they use
