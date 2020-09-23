#! /usr/bin/bash

# In rootless podman, JupyterHub will be run as $USER and can only be logged
# into by $USER. This is an officially-supported way to run JupyterHub per the
# docs:
# https://jupyterhub.readthedocs.io/en/stable/quickstart.html#start-the-hub-server

set -e
set -o xtrace

# Get the directory of where this script itself is located.
# https://stackoverflow.com/a/246128/1221924
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

container=$(buildah from ubuntu)
buildah run -v $DIR/../scripts/jupyterhub.sh:/tmp/jupyterhub.sh $container -- bash /tmp/jupyterhub.sh
buildah config --cmd "jupyterhub -f /etc/jupyterhub/jupyterhub_config.py" $container
buildah unmount $container
buildah commit $container jupyterhub
