#!/usr/bin/bash
# This is a simple installation of JupyterHub.
#
# We considered the opinionated installation provided by The Littlest
# JupyterHub at https://tljh.jupyter.org/en/latest/install/custom-server.html
# but it is inherently multi-user and too opinionated for this application.
set -e
sudo apt-get update
sudo apt-get install -y curl gnupg2

sudo apt-get update
sudo apt-get install -y python3 python3-pip npm nodejs
sudo npm install -g configurable-http-proxy
JUPYTERHUB_VENV=./.jupyterhub_venv
[ ! -d "${JUPYTERHUB_VENV}" ] && python3 -m venv ${JUPYTERHUB_VENV}
source ${JUPYTERHUB_VENV}/bin/activate
pip3 install wheel
pip3 install --upgrade pip setuptools
pip3 install jupyterhub dockerspawner
