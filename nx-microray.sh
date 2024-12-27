#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEV_COMPOSE_FILE="$SCRIPT_DIR/nx-microray-docker/docker-compose.yml"
PROD_COMPOSE_FILE="$SCRIPT_DIR/nx-microray-docker/docker-compose.prod.yml"

case "$1" in
    up)
        echo "Starting all containers..."
        docker compose -f $DEV_COMPOSE_FILE up -d
        ;;
    down)
        echo "Stopping all containers..."
        docker compose -f $DEV_COMPOSE_FILE down
        ;;
    restart)
        echo "Restarting all containers..."
        docker compose -f $DEV_COMPOSE_FILE down
        docker compose -f $DEV_COMPOSE_FILE up -d
        ;;
    build)
        if [ -n "$2" ]; then
            echo "Building container $2..."
            docker compose -f $DEV_COMPOSE_FILE build $2
        else
            echo "Building all containers..."
            docker compose -f $DEV_COMPOSE_FILE build
        fi
        ;;
    serve)
        echo "Building Production Image"
        docker compose -f $PROD_COMPOSE_FILE build
        echo "Serving Production Build..."
        docker compose -f $PROD_COMPOSE_FILE up
        ;;
    cleanup)
        echo "Cleaning up dangling volumes..."
        VOLUMES=$(docker volume ls -q --filter dangling=true)
        VOLUMES=$(echo "$VOLUMES" | grep -v 'nx-microray-mongodb-data')
        if [ -n "$VOLUMES" ]; then
            docker volume rm $VOLUMES
            echo "Removed dangling volumes."
        else
            echo "No dangling volumes found."
        fi
        ;;
    import)
        echo "Importing data..."
        docker compose -f $COMPOSE_FILE up -d nx-microray-mongodb
        sleep 5 # Allow time for MongoDB to start
        docker exec nx-microray-mongodb bash /docker-entrypoint-initdb.d/mongo-import.sh
        ;;
    *)
        echo "Usage: $0 {up|down|restart|build|cleanup|import}"
        exit 1
esac