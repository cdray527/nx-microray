## Project Overview ( WIP )

![project overview](https://lucid.app/publicSegments/view/8204cb16-2f13-4480-86b7-31d71ac9009c/image.jpeg)

This proof-of-concept project designed to demonstrate the potential of a scalable web application in microservices architecture, each services are containerized using Docker. The key services include:

- **Frontend**: Microfrontend approach using Nx Workspace and Module Federation
- **Backend**: GraphQL server built with Golang
- **Database**: MongoDB
- **Reverse proxy**: Nginx

## Setup 

1. Install Docker on your machine.

2. Clone all submodules

`git submodule update --init --recursive`

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
