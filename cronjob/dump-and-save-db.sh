#!/usr/bin/env bash
set -Eeuo pipefail

# Configurar estas variables en el entorno antes de ejecutar:
: "${DB_CONTAINER:?Falta DB_CONTAINER}"
: "${DB_NAME:?Falta DB_NAME}"
: "${DB_USER:?Falta DB_USER}"
: "${DB_PASSWORD:?Falta DB_PASSWORD}"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${BACKUP_DIR:-$SCRIPT_DIR/backups}"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql"

mkdir -p "$BACKUP_DIR"

echo "Iniciando copia de seguridad de $DB_NAME..."

if docker exec -e PGPASSWORD="$DB_PASSWORD" \
    "$DB_CONTAINER" \
    pg_dump -U "$DB_USER" "$DB_NAME" > "$BACKUP_FILE"; then
    echo "Backup creado: $BACKUP_FILE"
else
    rm -f "$BACKUP_FILE"
    echo "Error: no se pudo realizar el backup." >&2
    exit 1
fi