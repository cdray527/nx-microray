## Project Overview ( WIP )

![project overview](https://lucid.app/publicSegments/view/406b7f67-8c0c-474c-8c37-2ad5bc1f4976/image.jpeg)

This proof-of-concept project designed to demonstrate the potential of a scalable web application in microservices architecture, each services are containerized using Docker. The key services include:

- **Frontend**: Microfrontend approach using Nx Workspace and Module Federation
- **Backend**: GraphQL server built with Golang
- **Database**: MongoDB
- **API Gateway**: Nginx

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
[Backend](doc:https://github.com/cdray527/nx-microray-api/tree/41725b59b1761dd8de3b56ee23e460954310660a)
[Frontend](doc:https://github.com/cdray527/nx-microray-app/tree/736ccc1c014ed3625678b97452b68ba7bda9df04)
[Config](doc:https://github.com/cdray527/nx-microray-docker/tree/60d1e2a8ac9a6713e5496c76c813d73fef2bf1d8)

## Command 
A shell script was provided to run all packaged docker-compose commands

### Development
Start All Services

`nx-microray dev up`

Stop All Services

`nx-microray dev down`

### Production
Build the application

`nx-microray prod build`

Start All Services

`nx-microray prod up`

Stop All Services

`nx-microray prod down`
