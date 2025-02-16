#!/bin/bash

# borrar imagen
docker rmi -f rottdocker/personal:magis-video

# depurar imagenes
docker image prune


# construir contenedor
sudo docker build -t rottdocker/personal:magis-video .


# Subir al repositorio el contenedor
docker push rottdocker/personal:magis-video
