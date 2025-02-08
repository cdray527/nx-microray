## Project Overview ( WIP )

![project overview](https://lucid.app/publicSegments/view/8204cb16-2f13-4480-86b7-31d71ac9009c/image.jpeg)

This proof-of-concept project designed to demonstrate the potential of a scalable web application in microservices architecture, each services are containerized using Docker. The key services include:

- **Frontend**: Microfrontend approach using Nx Workspace and Module Federation
- **Backend**: GraphQL server built with Golang
- **Database**: MongoDB
- **Reverse proxy**: Nginx

## Benefits of Microservices

- **Scalable**: Scale individual services independently or add new service based on demand.
- **Flexible**: Each service can be develop using own choices of languages or framework that best suited for.
- **Faster development**: Teams can work on different services simultaneously or independently.
- **Maintainable**: Smaller, focused codebases are easier to manage and debug.
- **Reusable**: Share services across multiple projects to reduce redundancy.
- **Isolation**: Faults in one service don’t impact the entire system, making failures easier to track and handle.
- **Continuous delivery**: Independent pipelines enable faster updates.

## Setup 

1. Install Docker on your machine.

2. Clone all submodules 
git submodule update --init --recursive

## Command 
A shell script was provided to run all packaged docker-compose commands

### Development
Init All Services : `./nx-microray.sh dev build`

Start All Services : `./nx-microray.sh dev up`

Stop All Services :`./nx-microray.sh dev down`

### Production
Build the application: `./nx-microray.sh prod build`

Start All Services: `./nx-microray.sh prod up`

Stop All Services: `./nx-microray.sh prod down`
