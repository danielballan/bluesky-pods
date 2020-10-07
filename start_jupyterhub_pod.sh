set -e
# create the jupyterhub pod
podman pod create -n jupyterhub -p 8000:8000/tcp

podman run -dt --pod jupyterhub \
    -e PYTHONPATH=`pwd`/podmanspawner \
    -v `pwd`/jupyterhub_config.py:/etc/jupyterhub/jupyterhub_config.py \
    --rm jupyterhub
