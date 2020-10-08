# This is a simple installation of JupyterHub.
#
# We considered the opinionated installation provided by The Littlest
# JupyterHub at https://tljh.jupyter.org/en/latest/install/custom-server.html
# but it is inherently multi-user and too opinionated for this application.
set -e

apt-get update
apt-get install -y curl gnupg2

# https://podman.io/getting-started/installation.html
. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | apt-key add -
apt-get update
apt-get -y upgrade
apt-get -y install podman

# The nodejs installation process prompts interactively for timezone info. Set
# the timezone info here instead.
# https://stackoverflow.com/a/44333806/1221924
DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt-get install -y python3 python3-pip curl npm nodejs
pip3 install jupyterhub dockerspawner
npm install -g configurable-http-proxy

useradd --create-home jovyan
