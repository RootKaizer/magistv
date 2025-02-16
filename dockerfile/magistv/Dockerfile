# Usamos la imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Instalar dependencias para anbox
RUN apt-get update && apt-get install -y \
    linux-image-5.15.0-131-generic \
    linux-headers-5.15.0-131-generic \
    dkms \
    lxc \
    lxc-templates \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    android-tools-adb \
    software-properties-common \
    android-tools-adb \
    android-tools-fastboot \
    wget \
    curl \
    dbus \
    && apt clean

# Agregar el PPA de Anbox e instalar Anbox
RUN apt update \
    && apt install -y anbox \
    && apt clean

# Configurar Anbox
COPY andbox/android.img /var/lib/anbox/android.img

# Copiar scripts de inicio (opcional)
COPY andbox/start-anbox.sh /usr/local/bin/start-anbox.sh
RUN chmod +x /usr/local/bin/start-anbox.sh

# Exponer el puerto ADB (opcional)
EXPOSE 5555

# Comando por defecto
#CMD ["/usr/local/bin/start-anbox.sh"]

# Configuramos el comando predeterminado para usar supervisord
CMD ["/bin/bash"]
