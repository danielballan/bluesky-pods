JUPYTERHUB_VENV=./.jupyterhub_venv
source ${JUPYTERHUB_VENV}/bin/activate
echo `pwd`
PYTHONPATH=./podmanspawner jupyterhub -f jupyterhub_config.py  # HACK!
