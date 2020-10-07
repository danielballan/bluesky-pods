set -e
# create the jupyterhub pod
podman pod create -n jupyterhub -p 8000:8000/tcp

podman run -dt --pod jupyterhub \
    -e PYTHONPATH=/ jupyterhub
    -v `pwd`/jupyterhub_config.py:/etc/jupyterhub/jupyterhub_config.py \
    -v `pwd`/podmanspawner.py:/podmanspawner.py \
    --rm jupyterhub
