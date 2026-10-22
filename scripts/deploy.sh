#!/usr/bin/env bash
set -Eeuo pipefail

# Ir a la raíz del repositorio
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_DIR"

echo "Actualizando el código del proyecto..."

# Descargar los cambios de la rama remota configurada
git pull --ff-only

echo "Reconstruyendo e iniciando los contenedores..."

# Reconstruir imágenes y reiniciar los servicios
docker compose up -d --build --remove-orphans

echo "Estado de los servicios:"
docker compose ps

echo "Despliegue finalizado."