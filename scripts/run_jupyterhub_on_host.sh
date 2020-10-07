JUPYTERHUB_VENV=./.jupyterhub_venv
source ${JUPYTERHUB_VENV}/bin/activate
jupyterhub -f jupyterhub_config.py
