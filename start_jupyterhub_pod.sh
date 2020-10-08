set -e
# create the jupyterhub pod
# podman pod create -n jupyterhub -p 8000:8000/tcp

podman run -dt \
    -p 8000 \
    -e PYTHONPATH=`pwd`/opt/podmanspawner \
    -v `pwd`/jupyterhub_config.py:/etc/jupyterhub/jupyterhub_config.py \
    -v `pwd`/podmanspawner:/opt/podmanspawner \
    jupyterhub
