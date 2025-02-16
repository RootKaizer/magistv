# /bin/bash

# Definir el nombre del archivo docker-compose
COMPOSE_FILE="MagisTvContainer.yml"

# Detener y eliminar los contenedores, redes y volúmenes definidos en el archivo docker-compose
echo "Deteniendo y eliminando contenedores y redes..."
docker-compose -f $COMPOSE_FILE down

# Eliminar la imagen 'rottdocker/personal:magis-video'
echo "Eliminando la imagen 'rottdocker/personal:magis-video'..."
docker rmi -f rottdocker/personal:magis-video
docker ps

# Verificar si la imagen se ha eliminado correctamente
if ! docker image inspect rottdocker/personal:magis-video > /dev/null 2>&1; then
    echo "La imagen 'rottdocker/personal:magis-video' ha sido eliminada exitosamente."
else
    echo "Hubo un problema al eliminar la imagen."
fi

# Iniciar  contenedor magis-tv
docker-compose -f $COMPOSE_FILE up -d

docker ps -a
# Log de arranque
docker logs -f magis-tv
