#!/usr/bin/bash
# This is a simple installation of JupyterHub.
#
# We considered the opinionated installation provided by The Littlest
# JupyterHub at https://tljh.jupyter.org/en/latest/install/custom-server.html
# but it is inherently multi-user and too opinionated for this application.
set -e
apt-get update

# The nodejs installation process prompts interactively for timezone info. Set
# the timezone info here instead.
# https://stackoverflow.com/a/44333806/1221924
DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt-get update
apt-get upgrade -y
apt-get install -y python3 python3-pip npm nodejs podman
pip3 install jupyterhub dockerspawner
npm install -g configurable-http-proxy
