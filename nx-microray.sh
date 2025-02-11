#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEV_COMPOSE_FILE="$SCRIPT_DIR/nx-microray-docker/docker-compose.yml"
PROD_COMPOSE_FILE="$SCRIPT_DIR/nx-microray-docker/docker-compose.prod.yml"

case "$1" in
    dev)
        COMPOSE_FILE=$DEV_COMPOSE_FILE
        case "$2" in
            up)
                echo "Starting all development containers..."
                docker compose -f $COMPOSE_FILE up -d
                ;;
            down)
                echo "Stopping all development containers..."
                docker compose -f $COMPOSE_FILE down
                ;;
            restart)
                echo "Restarting all development containers..."
                docker compose -f $COMPOSE_FILE down
                docker compose -f $COMPOSE_FILE up -d
                ;;
            build)
                if [ -n "$3" ]; then
                    echo "Building development container $3..."
                    docker compose -f $COMPOSE_FILE build $3
                else
                    echo "Building all development containers..."
                    docker compose -f $COMPOSE_FILE build
                fi
                ;;
            *)
                echo "Usage: $0 dev {up|down|restart|build}"
                exit 1
                ;;
        esac
        ;;
    prod)
        COMPOSE_FILE=$PROD_COMPOSE_FILE
        case "$2" in
            up)
                echo "Starting all production containers..."
                docker compose -f $COMPOSE_FILE up -d
                ;;
            down)
                echo "Stopping all production containers..."
                docker compose -f $COMPOSE_FILE down
                ;;
            restart)
                echo "Restarting all production containers..."
                docker compose -f $COMPOSE_FILE down
                docker compose -f $COMPOSE_FILE up -d
                ;;
            build)
                if [ -n "$3" ]; then
                    echo "Building production container $3..."
                    docker compose -f $COMPOSE_FILE build $3
                else
                    echo "Building all production containers..."
                    docker compose -f $COMPOSE_FILE build
                fi
                ;;
            *)
                echo "Usage: $0 prod {up|down|restart|build}"
                exit 1
                ;;
        esac
        ;;
    import)
        echo "Importing data..."
        docker compose -f $DEV_COMPOSE_FILE up -d nx-microray-mongodb
        sleep 5 # Allow time for MongoDB to start
        docker exec nx-microray-mongodb bash /docker-entrypoint-initdb.d/mongo-import.sh
        ;;
    cleanup)
        echo "Cleaning up dangling volumes..."
        VOLUMES=$(docker volume ls -q --filter dangling=true)
        VOLUMES=$(echo "$VOLUMES" | grep -Ev 'nx-microray-mongodb-data|nx-microray-app-cache|nx-microray-app-node-modules')
        if [ -n "$VOLUMES" ]; then
            docker volume rm $VOLUMES
            echo "Removed dangling volumes."
        else
            echo "No dangling volumes found."
        fi
        ;;
    *)
        echo "Usage: $0 {dev|prod} {up|down|restart|build} | {import|cleanup}"
        exit 1
        ;;
esac