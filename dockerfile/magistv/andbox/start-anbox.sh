#!/bin/bash

# Iniciar el servicio Anbox
service anbox-container-manager start

# Iniciar el servidor ADB
adb start-server

# Mantener el contenedor en ejecución
tail -f /dev/null
